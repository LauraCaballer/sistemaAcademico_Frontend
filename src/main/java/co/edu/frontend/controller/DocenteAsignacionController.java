package co.edu.frontend.controller;

import co.edu.frontend.model.Curso;
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/docente")
public class DocenteAsignacionController {
    private static final Logger logger = LoggerFactory.getLogger(DocenteAsignacionController.class);

    // Base URL de tu API de backend (ajusta la parte del host/puerto según tu configuración)
    private final String BACKEND_BASE = "https://005b-2800-486-e78-6d00-48b9-32c2-f399-b856.ngrok-free.app";
    private final String ASIGNACIONES_API = BACKEND_BASE + "/asignaciones";

    private final RestTemplate restTemplate;

    public DocenteAsignacionController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping("/cursos")
    public String mostrarCursosDocente(HttpSession session, Model model) {
        // 1. Obtener datos de sesión
        LoginResponse login = (LoginResponse) session.getAttribute("username");
        if (login == null || login.getToken() == null) {
            return "redirect:/login";
        }

        Long codigoDocente = login.getPersonaId();  // usamos personaId como códigoDocente

        // 2. Llamada al backend
        String url = ASIGNACIONES_API + "/docente/" + codigoDocente + "/cursos";
        logger.info("Llamando a API de cursos de docente: {}", url);

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(login.getToken());
        HttpEntity<Void> request = new HttpEntity<>(headers);

        List<Curso> cursos;
        try {
            ResponseEntity<List<Curso>> resp = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    request,
                    new ParameterizedTypeReference<>() {}
            );
            cursos = resp.getStatusCode() == HttpStatus.OK && resp.getBody() != null
                    ? resp.getBody()
                    : Collections.emptyList();
        } catch (Exception ex) {
            logger.error("Error al obtener cursos del docente {}", codigoDocente, ex);
            cursos = Collections.emptyList();
            model.addAttribute("error", "No se pudo cargar la lista de cursos.");
        }

        model.addAttribute("cursos", cursos);
        return "docente_cursos";
    }





    @GetMapping("/curso/{cursoId}/estudiantes")

    public String mostrarEstudiantesPorCurso(Long cursoId, HttpSession session, Model model) {
        LoginResponse login = (LoginResponse) session.getAttribute("username");
        if (login == null || login.getToken() == null) {
            return "redirect:/login";
        }

        Long docenteId = login.getPersonaId();
        String url = ASIGNACIONES_API + "/docente/" + docenteId + "/curso/" + cursoId + "/estudiantes";

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(login.getToken());
        HttpEntity<Void> request = new HttpEntity<>(headers);

        try {
            ResponseEntity<List> response = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    request,
                    new ParameterizedTypeReference<>() {}
            );
            model.addAttribute("estudiantes", response.getBody());
        } catch (Exception e) {
            model.addAttribute("error", "No se pudo cargar la lista de estudiantes.");
            model.addAttribute("estudiantes", Collections.emptyList());
        }

        return "docente_estudiantes";
    }

}
