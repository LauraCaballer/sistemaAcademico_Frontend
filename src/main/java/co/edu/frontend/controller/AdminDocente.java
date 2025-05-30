package co.edu.frontend.controller;

import co.edu.frontend.model.Docente;
import co.edu.frontend.model.Programa;
import co.edu.frontend.model.Persona;
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.PropertyEditorRegistry;
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
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminDocente {

    private static final String API_BASE = "http://localhost:8081/docentes";
    private static final String API_PROGRAMAS = "http://localhost:8081/programas";
    private static final String API_PERSONAS = "http://localhost:8081/personas";

    private final RestTemplate rest;

    @Autowired
    public AdminDocente(RestTemplate rest) {
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

    /** Reutilizamos el binder para OffsetDateTime */
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

    @GetMapping("/docentes")
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        // Traer docentes
        ResponseEntity<Docente[]> resp = rest.exchange(API_BASE, HttpMethod.GET, req, Docente[].class);
        model.addAttribute("docentes", Arrays.asList(resp.getBody()));
        return "admin_listDocente";
    }

    @GetMapping("/docentes/nuevo")
    public String crearForm(Model model, HttpSession session) {
        // Instancia vacía para el form
        model.addAttribute("docente", new Docente());
        // Listas para selects
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Programa[]> pr = rest.exchange(API_PROGRAMAS, HttpMethod.GET, req, Programa[].class);
        ResponseEntity<Persona[]> pe = rest.exchange(API_PERSONAS, HttpMethod.GET, req, Persona[].class);
        model.addAttribute("programas", Arrays.asList(pr.getBody()));
        model.addAttribute("personas", Arrays.asList(pe.getBody()));
        return "form-docente";
    }

    @PostMapping("/docentes")
    public String crear(@ModelAttribute Docente docente, HttpSession session) {
        HttpEntity<Docente> req = new HttpEntity<>(docente, authHeaders(session));
        rest.exchange(API_BASE, HttpMethod.POST, req, Docente.class);
        return "redirect:/admin/docentes";
    }

    @GetMapping("/docentes/{id}/editar")
    public String editarForm(@PathVariable Long id, Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        // Traer docente existente
        ResponseEntity<Docente> rd = rest.exchange(API_BASE + "/" + id, HttpMethod.GET, req, Docente.class);
        model.addAttribute("docente", rd.getBody());
        // Listas para selects
        ResponseEntity<Programa[]> pr = rest.exchange(API_PROGRAMAS, HttpMethod.GET, req, Programa[].class);
        ResponseEntity<Persona[]> pe = rest.exchange(API_PERSONAS, HttpMethod.GET, req, Persona[].class);
        model.addAttribute("programas", Arrays.asList(pr.getBody()));
        model.addAttribute("personas", Arrays.asList(pe.getBody()));
        return "form-docente";
    }

    @PostMapping("/docentes/{id}")
    public String actualizar(@PathVariable Long id, @ModelAttribute Docente docente, HttpSession session) {
        HttpEntity<Docente> req = new HttpEntity<>(docente, authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, req, Docente.class);
        return "redirect:/admin/docentes";
    }

    @PostMapping("/docentes/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);
        return "redirect:/admin/docentes";
    }
}
