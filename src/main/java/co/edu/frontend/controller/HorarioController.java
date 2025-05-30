package co.edu.frontend.controller; // O tu paquete de controladores del frontend

import co.edu.frontend.model.Estudiante;
import co.edu.frontend.model.HorarioCurso; // Modelo del frontend
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/estudiante")
public class HorarioController {

    private static final Logger logger = LoggerFactory.getLogger(HorarioController.class);

    // Asegúrate que estas URLs sean las correctas para tu backend
    private final String ESTUDIANTE_API_URL = "http://localhost:8080/estudiantes";
    private final String ESTUDIANTE_CURSO_API_URL = "http://localhost:8080/estudiante-cursos";

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/mi-horario")
    public String mostrarMiHorario(HttpSession session, Model model) {
        LoginResponse loginData = (LoginResponse) session.getAttribute("username");
        if (loginData == null || loginData.getToken() == null) {
            logger.warn("No hay sesión activa o token nulo, redirigiendo al login.");
            return "redirect:/login";
        }

        Long personaId = loginData.getPersonaId();
        if (personaId == null) {
            model.addAttribute("errorGlobal", "ID de persona no encontrado en sesión.");
            model.addAttribute("horarioAgrupado", Collections.emptyMap());
            model.addAttribute("diasOrdenados", Collections.emptyList());
            return "estudiante_horario";
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(loginData.getToken());
        HttpEntity<Void> requestEntityForEstudiante = new HttpEntity<>(headers); // Request entity para obtener Estudiante
        Long estudianteId = null;
        String nombreCompletoEstudiante = "Estudiante"; // Valor por defecto

        try {
            String getEstudianteUrl = ESTUDIANTE_API_URL + "/persona/" + personaId;
            ResponseEntity<Estudiante> estudianteResponse = restTemplate.exchange(
                    getEstudianteUrl, HttpMethod.GET, requestEntityForEstudiante, Estudiante.class);

            if (estudianteResponse.getStatusCode() == HttpStatus.OK && estudianteResponse.getBody() != null) {
                Estudiante estudiante = estudianteResponse.getBody();
                estudianteId = estudiante.getId();
                if (estudiante.getPersona() != null) { // Asumiendo que Estudiante tiene Persona
                    nombreCompletoEstudiante = estudiante.getPersona().getNombre(); // Asumiendo que Persona tiene getNombreCompleto()
                }
                model.addAttribute("nombreEstudiante", nombreCompletoEstudiante);
            } else {
                model.addAttribute("errorGlobal", "No se pudo obtener la información del estudiante. Estado: " + estudianteResponse.getStatusCode());
                model.addAttribute("horarioAgrupado", Collections.emptyMap());
                model.addAttribute("diasOrdenados", Collections.emptyList());
                return "estudiante_horario";
            }
        } catch (HttpClientErrorException e) {
            logger.error("Error HTTP al obtener estudiante (personaId: {}): {} - {}", personaId, e.getStatusCode(), e.getResponseBodyAsString());
            model.addAttribute("errorGlobal", "Error al contactar servicio de estudiantes: " + e.getMessage());
            model.addAttribute("horarioAgrupado", Collections.emptyMap());
            model.addAttribute("diasOrdenados", Collections.emptyList());
            return "estudiante_horario";
        } catch (Exception e) {
            logger.error("Error general al obtener estudiante (personaId: {}):", personaId, e);
            model.addAttribute("errorGlobal", "Error inesperado al obtener datos del estudiante: " + e.getMessage());
            model.addAttribute("horarioAgrupado", Collections.emptyMap());
            model.addAttribute("diasOrdenados", Collections.emptyList());
            return "estudiante_horario";
        }

        if (estudianteId == null) {
            model.addAttribute("errorGlobal", "No se pudo determinar el ID del estudiante para cargar el horario.");
            model.addAttribute("horarioAgrupado", Collections.emptyMap());
            model.addAttribute("diasOrdenados", Collections.emptyList());
            return "estudiante_horario";
        }

        // Reusar HttpEntity con headers para la llamada al API del horario
        HttpEntity<Void> requestEntityForHorario = new HttpEntity<>(headers);

        try {
            String urlHorario = ESTUDIANTE_CURSO_API_URL + "/estudiante/" + estudianteId + "/horario-actual";
            logger.info("Obteniendo horario del estudiante ID {} desde: {}", estudianteId, urlHorario);

            ResponseEntity<List<HorarioCurso>> horarioResponse = restTemplate.exchange(
                    urlHorario,
                    HttpMethod.GET,
                    requestEntityForHorario,
                    new ParameterizedTypeReference<List<HorarioCurso>>() {}
            );

            if (horarioResponse.getStatusCode() == HttpStatus.OK && horarioResponse.getBody() != null) {
                List<HorarioCurso> horarioCompleto = horarioResponse.getBody();
                if (horarioCompleto.isEmpty()){
                    model.addAttribute("mensajeInfo", "No tienes un horario definido o cursos matriculados actualmente.");
                    model.addAttribute("horarioAgrupado", Collections.emptyMap());
                    model.addAttribute("diasOrdenados", Collections.emptyList());
                } else {
                    // Agrupar por día (String)
                    Map<String, List<HorarioCurso>> horarioAgrupado = horarioCompleto.stream()
                            .filter(h -> h.getDia() != null) // Filtrar por si acaso algún día es nulo
                            .collect(Collectors.groupingBy(HorarioCurso::getDia));

                    model.addAttribute("horarioAgrupado", horarioAgrupado);

                    // Crear una lista ordenada de los días (String) que realmente tienen horarios
                    List<String> diasConHorarioOrdenados = new ArrayList<>(horarioAgrupado.keySet());

                    Map<String, Integer> dayOrder = new HashMap<>();
                    dayOrder.put("LUNES", 1);
                    dayOrder.put("MARTES", 2);
                    dayOrder.put("MIERCOLES", 3);
                    dayOrder.put("JUEVES", 4);
                    dayOrder.put("VIERNES", 5);
                    dayOrder.put("SABADO", 6);
                    dayOrder.put("DOMINGO", 7);

                    diasConHorarioOrdenados.sort(Comparator.comparing(
                            diaStr -> dayOrder.getOrDefault(diaStr.toUpperCase(), Integer.MAX_VALUE)
                    ));
                    model.addAttribute("diasOrdenados", diasConHorarioOrdenados);
                }
            } else if (horarioResponse.getStatusCode() == HttpStatus.NO_CONTENT) {
                model.addAttribute("mensajeInfo", "No tienes un horario definido o cursos matriculados actualmente.");
                model.addAttribute("horarioAgrupado", Collections.emptyMap());
                model.addAttribute("diasOrdenados", Collections.emptyList());
            } else {
                model.addAttribute("errorHorario", "No se pudo obtener el horario (Respuesta API: " + horarioResponse.getStatusCode() + ")");
                model.addAttribute("horarioAgrupado", Collections.emptyMap());
                model.addAttribute("diasOrdenados", Collections.emptyList());
            }

        } catch (HttpClientErrorException e) {
            if (e.getStatusCode() == HttpStatus.NO_CONTENT) {
                model.addAttribute("mensajeInfo", "No tienes un horario definido o cursos matriculados actualmente.");
            } else {
                logger.error("Error HTTP al obtener horario del estudiante {}: {} - {}", estudianteId, e.getStatusCode(), e.getResponseBodyAsString());
                model.addAttribute("errorHorario", "Error al cargar el horario: " + e.getResponseBodyAsString());
            }
            model.addAttribute("horarioAgrupado", Collections.emptyMap());
            model.addAttribute("diasOrdenados", Collections.emptyList());
        } catch (Exception e) {
            logger.error("Error general al obtener horario del estudiante {}:", estudianteId, e);
            model.addAttribute("errorHorario", "Ocurrió un error inesperado al consultar tu horario: " + e.getMessage());
            model.addAttribute("horarioAgrupado", Collections.emptyMap());
            model.addAttribute("diasOrdenados", Collections.emptyList());
        }

        return "estudiante_horario";
    }
}