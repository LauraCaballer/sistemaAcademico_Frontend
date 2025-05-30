package co.edu.frontend.controller;

import co.edu.frontend.model.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminCurso {

    private static final String API_CURSOS   = "http://localhost:8080/cursos";
    private static final String API_DOCENTES = "http://localhost:8080/docentes";
    private static final String API_PROGRAMAS = "http://localhost:8080/programas";
    private static final String API_SEMESTRES = "http://localhost:8080/semestres";
    private static final String API_ASIGNATURAS = "http://localhost:8080/asignaturas";


    private final RestTemplate rest;

    @Autowired
    public AdminCurso(RestTemplate rest) {
        this.rest = rest;
    }

    private HttpHeaders authHeaders(HttpSession session) {
        LoginResponse user = (LoginResponse) session.getAttribute("username");
        if (user == null || user.getToken() == null) {
            throw new IllegalStateException("No hay sesión activa");
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(user.getToken());
        headers.setContentType(MediaType.APPLICATION_JSON);
        return headers;
    }

    @GetMapping("/cursos")
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));

        // Obtener los cursos desde el backend
        ResponseEntity<Curso[]> cursosResp = rest.exchange(API_CURSOS, HttpMethod.GET, req, Curso[].class);
        Curso[] cursosArr = cursosResp.getBody();
        List<Curso> cursos = (cursosArr != null) ? Arrays.asList(cursosArr) : List.of();

        // Obtener las asignaciones desde el backend
        String API_ASIGNACIONES = "http://localhost:8081/asignaciones"; // Endpoint de asignaciones
        ResponseEntity<Asignacion[]> asignacionesResp = rest.exchange(API_ASIGNACIONES, HttpMethod.GET, req, Asignacion[].class);
        Asignacion[] asignacionesArr = asignacionesResp.getBody();
        List<Asignacion> asignaciones = (asignacionesArr != null) ? Arrays.asList(asignacionesArr) : List.of();

        // Mapear las asignaciones a los cursos
        for (Curso curso : cursos) {
            // Buscar la asignación correspondiente al curso
            asignaciones.stream()
                    .filter(asignacion -> asignacion.getCurso() != null && asignacion.getCurso().getId().equals(curso.getId()))
                    .findFirst()
                    .ifPresent(asignacion -> curso.setDocente(asignacion.getDocente())); // Enriquecer el curso con el docente asignado
        }

        // Añadir los cursos enriquecidos al modelo
        model.addAttribute("cursos", cursos);

        // Para el modal de “Asignar docente”
        ResponseEntity<Docente[]> docentesResp = rest.exchange(API_DOCENTES, HttpMethod.GET, req, Docente[].class);
        Docente[] docentesArr = docentesResp.getBody();
        List<Docente> docentes = (docentesArr != null) ? Arrays.asList(docentesArr) : List.of();
        model.addAttribute("docentes", docentes);

        return "admin_listCurso"; // JSP para visualizar cursos
    }

    @GetMapping("/cursos/nuevo")
    public String crearForm(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));

        model.addAttribute("curso", new Curso());

        ResponseEntity<Programa[]> progResp = rest.exchange(API_PROGRAMAS, HttpMethod.GET, req, Programa[].class);
        model.addAttribute("programas", Arrays.asList(progResp.getBody()));

        ResponseEntity<Semestre[]> semResp = rest.exchange(API_SEMESTRES, HttpMethod.GET, req, Semestre[].class);
        model.addAttribute("semestres", Arrays.asList(semResp.getBody()));

        ResponseEntity<Asignatura[]> asigResp = rest.exchange(API_ASIGNATURAS, HttpMethod.GET, req, Asignatura[].class);
        model.addAttribute("asignaturas", Arrays.asList(asigResp.getBody()));

        return "form-curso";
    }



    @PostMapping("/cursos")
    public String crear(@ModelAttribute Curso curso, HttpSession session) {
        HttpEntity<Curso> req = new HttpEntity<>(curso, authHeaders(session));
        rest.exchange(API_CURSOS, HttpMethod.POST, req, Curso.class);
        return "redirect:/admin/cursos";
    }

    /**
     * 1) GET /admin/cursos/{id}/editar → carga el curso completo (JSON anidado)
     *    y lo envía al formulario “form_curso.jsp”
     */
    @GetMapping("/cursos/{id}/editar")
    public String editarForm(@PathVariable Long id, Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));

        // Recuperar el curso (con toda la siguiente estructura JSON anidada)
        ResponseEntity<Curso> cursoResp = rest.exchange(API_CURSOS + "/" + id, HttpMethod.GET, req, Curso.class);
        Curso curso = cursoResp.getBody();
        model.addAttribute("curso", curso);
        ResponseEntity<Programa[]> progResp = rest.exchange(API_PROGRAMAS, HttpMethod.GET, req, Programa[].class);
        model.addAttribute("programas", Arrays.asList(progResp.getBody()));

        ResponseEntity<Semestre[]> semResp = rest.exchange(API_SEMESTRES, HttpMethod.GET, req, Semestre[].class);
        model.addAttribute("semestres", Arrays.asList(semResp.getBody()));

        ResponseEntity<Asignatura[]> asigResp = rest.exchange(API_ASIGNATURAS, HttpMethod.GET, req, Asignatura[].class);
        model.addAttribute("asignaturas", Arrays.asList(asigResp.getBody()));

        // Si necesitas poblar selects, los traes aquí:
        // ResponseEntity<Programa[]> progResp = rest.exchange(API_PROGRAMAS, HttpMethod.GET, req, Programa[].class);
        // model.addAttribute("programas", Arrays.asList(progResp.getBody()));
        // ResponseEntity<Semestre[]> semResp = rest.exchange(API_SEMESTRES, HttpMethod.GET, req, Semestre[].class);
        // model.addAttribute("semestres", Arrays.asList(semResp.getBody()));

        return "form_curso";
    }

    /**
     * 2) POST /admin/cursos/{id} → toma @ModelAttribute Curso (con sus IDs anidados)
     *    y hace PUT al backend localhost:8081/cursos/{id}
     */
    @PostMapping("/cursos/{id}")
    public String actualizar(@PathVariable Long id, @ModelAttribute Curso curso, HttpSession session) {
        HttpEntity<Curso> req = new HttpEntity<>(curso, authHeaders(session));
        rest.exchange(API_CURSOS + "/" + id, HttpMethod.PUT, req, Curso.class);
        return "redirect:/admin/cursos";
    }

    /** DELETE exacto: POST /admin/cursos/{id}/eliminar */
    @PostMapping("/cursos/{id}/eliminar")
    public String eliminarCurso(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        rest.exchange(API_CURSOS + "/" + id, HttpMethod.DELETE, req, Void.class);
        return "redirect:/admin/cursos";
    }

    /** Para el modal “Asignar docente” */
    @PostMapping("/cursos/asignar-docente")
    public String asignarDocente(@ModelAttribute Asignacion asignacion, HttpSession session) {
        HttpEntity<Asignacion> req = new HttpEntity<>(asignacion, authHeaders(session));
        rest.exchange(API_CURSOS + "/asignar-docente", HttpMethod.POST, req, Asignacion.class);
        return "redirect:/admin/cursos";
    }
}
