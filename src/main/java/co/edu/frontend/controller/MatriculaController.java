package co.edu.frontend.controller;

import co.edu.frontend.model.Curso;
import co.edu.frontend.model.Estudiante;
import co.edu.frontend.model.EstudianteCurso;
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/estudiante")
public class MatriculaController {

    private static final Logger logger = LoggerFactory.getLogger(MatriculaController.class);

    private final String ESTUDIANTE_API_URL = "http://localhost:8081/estudiantes"; // O tu puerto/URL real
    private final String ESTUDIANTE_CURSO_API_URL = "http://localhost:8081/estudiante-cursos";
    private final String CURSO_API_URL = "http://localhost:8081/cursos";

    @Autowired
    private RestTemplate restTemplate;

    private Long getEstudianteIdFromSession(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        LoginResponse loginData = (LoginResponse) session.getAttribute("username");
        if (loginData == null || loginData.getToken() == null) {
            logger.warn("No hay sesión activa o token nulo.");
            if (redirectAttributes != null) {
                redirectAttributes.addFlashAttribute("globalError", "Sesión no válida. Por favor, inicie sesión.");
            } else {
                model.addAttribute("globalError", "Sesión no válida. Por favor, inicie sesión.");
            }
            return null;
        }
        model.addAttribute("loginData", loginData); // Para headers

        Long personaId = loginData.getPersonaId();
        if (personaId == null) {
            logger.warn("ID de persona no encontrado en sesión.");
            if (redirectAttributes != null) {
                redirectAttributes.addFlashAttribute("globalError", "ID de persona no encontrado en sesión.");
            } else {
                model.addAttribute("globalError", "ID de persona no encontrado en sesión.");
            }
            return null;
        }

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(loginData.getToken());
            HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

            String getEstudianteUrl = ESTUDIANTE_API_URL + "/persona/" + personaId;
            ResponseEntity<Estudiante> estudianteResponse = restTemplate.exchange(
                    getEstudianteUrl, HttpMethod.GET, requestEntity, Estudiante.class);

            if (estudianteResponse.getStatusCode() == HttpStatus.OK && estudianteResponse.getBody() != null) {
                Estudiante estudiante = estudianteResponse.getBody();
                model.addAttribute("estudiante", estudiante); // Añadir el objeto estudiante completo
                return estudiante.getId();
            } else {
                String errorMsg = "No se pudo obtener la información del estudiante. Estado: " + estudianteResponse.getStatusCode();
                logger.warn(errorMsg);
                if (redirectAttributes != null) {
                    redirectAttributes.addFlashAttribute("globalError", errorMsg);
                } else {
                    model.addAttribute("globalError", errorMsg);
                }
                return null;
            }
        } catch (HttpClientErrorException e) {
            String errorMsg = "Error al contactar servicio de estudiantes: " + e.getResponseBodyAsString();
            logger.error("Error al obtener estudiante (personaId: {}): {} - {}", personaId, e.getStatusCode(), e.getResponseBodyAsString(), e);
            if (redirectAttributes != null) {
                redirectAttributes.addFlashAttribute("globalError", errorMsg);
            } else {
                model.addAttribute("globalError", errorMsg);
            }
            return null;
        } catch (Exception e) {
            String errorMsg = "Error inesperado al obtener datos del estudiante: " + e.getMessage();
            logger.error("Error general al obtener estudiante (personaId: {}):", personaId, e);
            if (redirectAttributes != null) {
                redirectAttributes.addFlashAttribute("globalError", errorMsg);
            } else {
                model.addAttribute("globalError", errorMsg);
            }
            return null;
        }
    }


    @GetMapping("/gestion")
    public String mostrarPaginaMatricula(HttpSession session, Model model) {
        Long estudianteId = getEstudianteIdFromSession(session, model, null);

        if (estudianteId == null) {
            // Si getEstudianteIdFromSession devuelve null, ya ha añadido "globalError" al model.
            // Si el error es por sesión inválida, podría ser un redirect a login.
            if (model.getAttribute("globalError") != null && model.getAttribute("globalError").toString().contains("Sesión no válida")) {
                return "redirect:/login";
            }
            model.addAttribute("cursosMatriculados", Collections.emptyList());
            model.addAttribute("cursosDisponibles", Collections.emptyList());
            return "estudiante_matricula"; // Mostrar página con el error global
        }

        LoginResponse loginData = (LoginResponse) model.getAttribute("loginData");
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(loginData.getToken());
        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        // 1. Obtener cursos actualmente matriculados ("Cursando")
        try {
            String urlCursosMatriculados = ESTUDIANTE_CURSO_API_URL + "/estudiante-cursados/" + estudianteId;
            logger.info("Obteniendo cursos matriculados (cursando) desde: {}", urlCursosMatriculados);
            ResponseEntity<List<EstudianteCurso>> matriculadosResponse = restTemplate.exchange(
                    urlCursosMatriculados, HttpMethod.GET, requestEntity,
                    new ParameterizedTypeReference<List<EstudianteCurso>>() {});
            model.addAttribute("cursosMatriculados", matriculadosResponse.getBody());
        } catch (HttpClientErrorException e) {
            logger.error("Error al obtener cursos matriculados: {} - {}", e.getStatusCode(), e.getResponseBodyAsString());
            model.addAttribute("errorMatriculados", "No se pudieron cargar los cursos matriculados: " + e.getResponseBodyAsString());
            model.addAttribute("cursosMatriculados", Collections.emptyList());
        } catch (Exception e) {
            logger.error("Error general al obtener cursos matriculados:", e);
            model.addAttribute("errorMatriculados", "Error inesperado al cargar cursos matriculados.");
            model.addAttribute("cursosMatriculados", Collections.emptyList());
        }

        // 2. Obtener cursos disponibles para matricular
        try {
            String urlCursosDisponibles = CURSO_API_URL + "/matriculables/estudiante/" + estudianteId;
            logger.info("Obteniendo cursos disponibles desde: {}", urlCursosDisponibles);
            ResponseEntity<List<Curso>> disponiblesResponse = restTemplate.exchange(
                    urlCursosDisponibles, HttpMethod.GET, requestEntity,
                    new ParameterizedTypeReference<List<Curso>>() {});
            model.addAttribute("cursosDisponibles", disponiblesResponse.getBody());
        } catch (HttpClientErrorException e) {
            if (e.getStatusCode() == HttpStatus.NO_CONTENT) {
                logger.info("No hay cursos disponibles para matricular para estudianteId {}", estudianteId);
                model.addAttribute("infoDisponibles", "No hay cursos disponibles para matricular en este momento.");
            } else {
                logger.error("Error al obtener cursos disponibles: {} - {}", e.getStatusCode(), e.getResponseBodyAsString());
                model.addAttribute("errorDisponibles", "No se pudieron cargar los cursos disponibles: " + e.getResponseBodyAsString());
            }
            model.addAttribute("cursosDisponibles", Collections.emptyList());
        } catch (Exception e) {
            logger.error("Error general al obtener cursos disponibles:", e);
            model.addAttribute("errorDisponibles", "Error inesperado al cargar cursos disponibles.");
            model.addAttribute("cursosDisponibles", Collections.emptyList());
        }

        return "estudiante_matricula";
    }

    @PostMapping("/inscribir/{cursoId}")
    public String inscribirCurso(@PathVariable Long cursoId,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes, Model model) {
        Long estudianteId = getEstudianteIdFromSession(session, model, redirectAttributes);
        if (estudianteId == null) {
            return "redirect:/estudiante/gestion"; // Error ya está en redirectAttributes
        }

        LoginResponse loginData = (LoginResponse) model.getAttribute("loginData");
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(loginData.getToken());
        // Para un POST que espera un cuerpo, incluso si es vacío, a veces se necesita un HttpEntity<Object>
        HttpEntity<Object> requestEntity = new HttpEntity<>(null, headers);


        try {
            String urlInscribir = ESTUDIANTE_CURSO_API_URL + "/matricular/" + estudianteId + "/" + cursoId;
            logger.info("Intentando matricular curso. URL: {}", urlInscribir);

            ResponseEntity<EstudianteCurso> response = restTemplate.exchange(
                    urlInscribir, HttpMethod.POST, requestEntity, EstudianteCurso.class);

            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                String nombreCursoMatriculado = (response.getBody().getCurso() != null &&
                        response.getBody().getCurso().getAsignatura() != null) ?
                        response.getBody().getCurso().getAsignatura().getNombre() : "Desconocido";
                redirectAttributes.addFlashAttribute("successMessage", "Curso '" + nombreCursoMatriculado + "' matriculado exitosamente.");
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "No se pudo matricular el curso. Estado: " + response.getStatusCode());
            }
        } catch (HttpClientErrorException e) {
            logger.error("Error HTTP al matricular curso: {} - {}", e.getStatusCode(), e.getResponseBodyAsString());
            redirectAttributes.addFlashAttribute("errorMessage", "Error al matricular: " + e.getResponseBodyAsString());
        } catch (Exception e) {
            logger.error("Error general al matricular curso:", e);
            redirectAttributes.addFlashAttribute("errorMessage", "Error inesperado al matricular el curso: " + e.getMessage());
        }
        return "redirect:/estudiante/gestion";
    }

    @PostMapping("/cancelar/{estudianteCursoId}") // Cambiado a POST para simplicidad de formulario HTML
    public String cancelarCurso(@PathVariable Long estudianteCursoId,
                                @RequestParam(value = "_method", required = false) String method, // Para HiddenHttpMethodFilter si se usa PUT
                                HttpSession session,
                                RedirectAttributes redirectAttributes, Model model) {
        Long estudianteId = getEstudianteIdFromSession(session, model, redirectAttributes); // Para la validación de sesión
        if (estudianteId == null) {
            return "redirect:/estudiante/gestion";
        }
        LoginResponse loginData = (LoginResponse) model.getAttribute("loginData");
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(loginData.getToken());
        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        try {
            // El backend espera PUT para /estudiante-cursos/{id}/cancelar
            // Si no usas HiddenHttpMethodFilter, cambia este endpoint en backend a POST
            // o usa JavaScript para enviar PUT. Aquí asumimos que el backend podría aceptar POST o se usa filtro.
            // Para el ejemplo, la URL es la misma, pero el metodo es PUT.
            String urlCancelar = ESTUDIANTE_CURSO_API_URL + "/" + estudianteCursoId + "/cancelar";
            logger.info("Intentando cancelar inscripción ID {}. URL: {}", estudianteCursoId, urlCancelar);

            // Usamos PUT como lo define el backend
            ResponseEntity<Void> response = restTemplate.exchange(urlCancelar, HttpMethod.PUT, requestEntity, Void.class);

            if (response.getStatusCode() == HttpStatus.OK) {
                redirectAttributes.addFlashAttribute("successMessage", "Curso cancelado exitosamente.");
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "No se pudo cancelar el curso. Estado: " + response.getStatusCode());
            }
        } catch (HttpClientErrorException e) {
            logger.error("Error HTTP al cancelar curso {}: {} - {}", estudianteCursoId, e.getStatusCode(), e.getResponseBodyAsString());
            redirectAttributes.addFlashAttribute("errorMessage", "Error al cancelar: " + e.getResponseBodyAsString());
        } catch (Exception e) {
            logger.error("Error general al cancelar curso {}:", estudianteCursoId, e);
            redirectAttributes.addFlashAttribute("errorMessage", "Error inesperado al cancelar el curso: " + e.getMessage());
        }
        return "redirect:/estudiante/gestion";
    }
}