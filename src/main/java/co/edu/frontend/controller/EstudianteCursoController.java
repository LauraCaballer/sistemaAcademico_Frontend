package co.edu.frontend.controller;

import co.edu.frontend.model.Estudiante;
import co.edu.frontend.model.EstudianteCurso; // Asegúrate que este modelo exista en tu frontend
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference; // Para listas en RestTemplate
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.Collections; // Para listas vacías
import java.util.List;

@Controller
@RequestMapping("/estudiante")
public class EstudianteCursoController { // Puedes usar este controlador o crear uno nuevo como EstudianteHistorialController

    private static final Logger logger = LoggerFactory.getLogger(EstudianteCursoController.class);

    // URLs de tu API backend
    private final String ESTUDIANTE_API_URL = "https://005b-2800-486-e78-6d00-48b9-32c2-f399-b856.ngrok-free.app/estudiantes"; // Backend EstudianteController
    private final String ESTUDIANTE_CURSO_API_URL = "https://005b-2800-486-e78-6d00-48b9-32c2-f399-b856.ngrok-free.app/estudiante-cursos"; // Backend EstudianteCursoController
    private final String HISTORIAL_API_URL = "https://005b-2800-486-e78-6d00-48b9-32c2-f399-b856.ngrok-free.app/historial";

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/historial")
    public String mostrarHistorialAcademico(HttpSession session, Model model) {
        LoginResponse loginData = (LoginResponse) session.getAttribute("username");

        if (loginData == null || loginData.getToken() == null) {
            logger.warn("No hay sesión activa o token nulo, redirigiendo al login.");
            return "redirect:/login";
        }

        // Usa el getter correcto para personaId de la clase LoginResponse
        Long personaId = loginData.getPersonaId();

        if (personaId == null) {
            logger.warn("ID de persona es nulo para el usuario en sesión.");
            model.addAttribute("error", "No se pudo obtener la identificación del usuario.");
            return "estudiante_historial"; // Renderiza la página de historial con el error
        }

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(loginData.getToken());
            HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

            // PASO 1: Obtener el objeto Estudiante para conseguir su ID principal (estudianteId)
            String getEstudianteUrl = ESTUDIANTE_API_URL + "/persona/" + personaId;
            logger.info("Llamando a API para obtener Estudiante: {}", getEstudianteUrl);
            ResponseEntity<Estudiante> estudianteResponseEntity = restTemplate.exchange(
                    getEstudianteUrl,
                    HttpMethod.GET,
                    requestEntity,
                    Estudiante.class // Modelo frontend co.edu.frontend.model.Estudiante
            );

            if (estudianteResponseEntity.getStatusCode() == HttpStatus.OK && estudianteResponseEntity.getBody() != null) {
                Estudiante estudiante = estudianteResponseEntity.getBody();
                Long estudianteId = estudiante.getId(); // Este es el ID del estudiante que necesitamos

                if (estudianteId == null) {
                    logger.warn("Estudiante recuperado (personaId: {}) no tiene un ID de estudiante utilizable.", personaId);
                    model.addAttribute("error", "No se pudo obtener el identificador de estudiante.");
                    return "estudiante_historial";
                }
                logger.info("Estudiante ID obtenido: {} para personaId: {}", estudianteId, personaId);

                try {
                    // Asegúrate que este endpoint exista en tu backend
                    String promedioUrl = HISTORIAL_API_URL + "/ponderado/" + estudianteId;
                    logger.info("Llamando a API para obtener promedio ponderado acumulado: {}", promedioUrl);

                    ResponseEntity<Double> promedioResponse = restTemplate.exchange(
                            promedioUrl,
                            HttpMethod.GET,
                            requestEntity, // Reutilizar requestEntity con el token
                            Double.class   // O Float.class, según lo que devuelva tu backend
                    );

                    if (promedioResponse.getStatusCode() == HttpStatus.OK && promedioResponse.getBody() != null) {
                        model.addAttribute("promedioPonderadoAcumulado", promedioResponse.getBody());
                        logger.info("Promedio ponderado acumulado obtenido: {}", promedioResponse.getBody());
                    } else {
                        logger.warn("No se pudo obtener el promedio ponderado acumulado o la respuesta no fue OK: {}. Se dejará sin mostrar.", promedioResponse.getStatusCode());
                    }
                } catch (HttpClientErrorException ex) {
                    logger.error("Error HTTP al obtener promedio ponderado acumulado para estudianteId {}: {} - {}. No se mostrará.", estudianteId, ex.getStatusCode(), ex.getResponseBodyAsString());
                } catch (Exception ex) {
                    logger.error("Error general al obtener promedio ponderado acumulado para estudianteId {}: {}. No se mostrará.", estudianteId, ex.getMessage());
                }

                // PASO 2: Obtener la lista de EstudianteCurso usando el estudianteId
                String getHistorialUrl = ESTUDIANTE_CURSO_API_URL + "/estudiante-aprobados/" + estudianteId;
                logger.info("Llamando a API para obtener historial de cursos: {}", getHistorialUrl);

                // Para obtener una lista de objetos genéricos con RestTemplate
                ParameterizedTypeReference<List<EstudianteCurso>> responseType =
                        new ParameterizedTypeReference<List<EstudianteCurso>>() {};

                ResponseEntity<List<EstudianteCurso>> historialResponse = restTemplate.exchange(
                        getHistorialUrl,
                        HttpMethod.GET,
                        requestEntity, // Podemos reusar el requestEntity con headers
                        responseType   // Usamos el ParameterizedTypeReference
                );

                if (historialResponse.getStatusCode() == HttpStatus.OK && historialResponse.getBody() != null) {
                    List<EstudianteCurso> historialCursos = historialResponse.getBody();
                    logger.info("Se encontraron {} cursos en el historial para estudianteId: {}", historialCursos.size(), estudianteId);

                    // Iterar para obtener y asignar la definitiva a cada EstudianteCurso
                    for (EstudianteCurso ec : historialCursos) { //
                        if (ec.getId() != null) {
                            String getDefinitivaUrl = HISTORIAL_API_URL + "/definitiva/" + ec.getId(); //
                            logger.info("Llamando a API para obtener definitiva del EstudianteCurso ID {}: {}", ec.getId(), getDefinitivaUrl); //

                            try {
                                ResponseEntity<Float> definitivaResponse = restTemplate.exchange(
                                        getDefinitivaUrl,
                                        HttpMethod.GET,
                                        requestEntity, // Reutilizar requestEntity con el token de autenticación
                                        Float.class    // Esperamos un Float como respuesta
                                );

                                if (definitivaResponse.getStatusCode() == HttpStatus.OK && definitivaResponse.getBody() != null) {
                                    Float definitiva = definitivaResponse.getBody();
                                    ec.setDefinitiva(definitiva); // Asignar la definitiva al objeto EstudianteCurso
                                    logger.info("Definitiva obtenida para EstudianteCurso ID {}: {}", ec.getId(), definitiva);
                                } else {
                                    logger.warn("No se pudo obtener la definitiva para EstudianteCurso ID {} o la respuesta no fue OK: {}. Se dejará como null.", ec.getId(), definitivaResponse.getStatusCode());
                                    ec.setDefinitiva(null); // O un valor por defecto si prefieres
                                }
                            } catch (HttpClientErrorException ex) {
                                // Capturar errores específicos de la llamada HTTP, como 404 si no hay calificaciones aún
                                logger.error("Error HTTP al obtener definitiva para EstudianteCurso ID {}: {} - {}. Se dejará como null.", ec.getId(), ex.getStatusCode(), ex.getResponseBodyAsString());
                                ec.setDefinitiva(null);
                            } catch (Exception ex) {
                                // Capturar cualquier otro error general
                                logger.error("Error general al obtener definitiva para EstudianteCurso ID {}: {}. Se dejará como null.", ec.getId(), ex.getMessage());
                                ec.setDefinitiva(null);
                            }
                        }
                    }
                    model.addAttribute("historialCursos", historialCursos);

                } else {
                    logger.warn("Respuesta no OK ({}) al obtener historial para estudianteId: {}", historialResponse.getStatusCode(), estudianteId);
                    model.addAttribute("error", "No se pudo obtener el historial de cursos (Respuesta API: " + historialResponse.getStatusCode() + ")");
                    model.addAttribute("historialCursos", Collections.emptyList());
                }
            } else {
                logger.warn("No se pudo encontrar el estudiante (personaId: {}). Estado API: {}", personaId, estudianteResponseEntity.getStatusCode());
                model.addAttribute("error", "No se encontró el estudiante asociado a esta sesión.");
            }

        } catch (HttpClientErrorException.NotFound e) {
            logger.warn("Recurso no encontrado (404) al intentar obtener datos del estudiante o su historial: {}", e.getMessage());
            model.addAttribute("error", "Información no encontrada. Es posible que el estudiante no exista o no tenga historial.");
        } catch (Exception e) {
            logger.error("Error general al obtener historial académico para personaId: {}", personaId, e);
            model.addAttribute("error", "Ocurrió un error al consultar el historial académico: " + e.getMessage());
        }

        return "estudiante_historial"; // Nombre de tu nuevo archivo JSP
    }
}