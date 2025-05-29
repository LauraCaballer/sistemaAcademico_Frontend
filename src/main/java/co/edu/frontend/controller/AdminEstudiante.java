package co.edu.frontend.controller;

import co.edu.frontend.model.Estudiante;
import co.edu.frontend.model.Programa;
import co.edu.frontend.model.Persona;
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.beans.PropertyEditorSupport;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.Arrays;

@Controller
@RequestMapping("/admin")
public class AdminEstudiante {

    private static final String API_BASE       = "http://localhost:8080/estudiantes";
    private static final String API_PROGRAMAS  = "http://localhost:8080/programas";
    private static final String API_PERSONAS   = "http://localhost:8080/personas";

    private final RestTemplate rest;

    @Autowired
    public AdminEstudiante(RestTemplate rest) {
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

    /** Binder para OffsetDateTime, si llegase a usarse en el form */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(OffsetDateTime.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                if (text == null || text.isBlank()) {
                    setValue(null);
                } else if (text.length() <= 10) {
                    LocalDate ld = LocalDate.parse(text);
                    setValue(ld.atStartOfDay().atOffset(ZoneOffset.UTC));
                } else {
                    setValue(OffsetDateTime.parse(text));
                }
            }
            @Override
            public String getAsText() {
                OffsetDateTime odt = (OffsetDateTime) getValue();
                return odt != null ? odt.toLocalDate().toString() : "";
            }
        });
    }

    @GetMapping("/estudiantes")
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        Estudiante[] arr = rest.exchange(API_BASE, HttpMethod.GET, req, Estudiante[].class).getBody();
        model.addAttribute("estudiantes", Arrays.asList(arr));
        return "admin_listEstudiante";
    }

    @GetMapping("/estudiantes/nuevo")
    public String crearForm(Model model, HttpSession session) {
        model.addAttribute("estudiante", new Estudiante());
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        model.addAttribute("programas", Arrays.asList(
                rest.exchange(API_PROGRAMAS, HttpMethod.GET, req, Programa[].class).getBody()));
        model.addAttribute("personas", Arrays.asList(
                rest.exchange(API_PERSONAS, HttpMethod.GET, req, Persona[].class).getBody()));
        return "form-estudiante";
    }

    @PostMapping("/estudiantes")
    public String crear(@ModelAttribute Estudiante estudiante, HttpSession session) {
        HttpEntity<Estudiante> req = new HttpEntity<>(estudiante, authHeaders(session));
        rest.exchange(API_BASE, HttpMethod.POST, req, Estudiante.class);
        return "redirect:/admin/estudiantes";
    }

    @GetMapping("/estudiantes/{id}/editar")
    public String editarForm(@PathVariable Long id, Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        Estudiante e = rest.exchange(API_BASE + "/" + id, HttpMethod.GET, req, Estudiante.class).getBody();
        model.addAttribute("estudiante", e);
        model.addAttribute("programas", Arrays.asList(
                rest.exchange(API_PROGRAMAS, HttpMethod.GET, req, Programa[].class).getBody()));
        model.addAttribute("personas", Arrays.asList(
                rest.exchange(API_PERSONAS, HttpMethod.GET, req, Persona[].class).getBody()));
        return "form-estudiante";
    }

    @PostMapping("/estudiantes/{id}")
    public String actualizar(@PathVariable Long id, @ModelAttribute Estudiante estudiante, HttpSession session) {
        HttpEntity<Estudiante> req = new HttpEntity<>(estudiante, authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, req, Estudiante.class);
        return "redirect:/admin/estudiantes";
    }

    @PostMapping("/estudiantes/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);
        return "redirect:/admin/estudiantes";
    }
}
