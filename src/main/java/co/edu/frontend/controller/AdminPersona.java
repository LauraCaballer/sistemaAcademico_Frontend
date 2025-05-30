package co.edu.frontend.controller;

import co.edu.frontend.model.LoginResponse;
import co.edu.frontend.model.Persona;
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
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminPersona {

    private static final String API_BASE = "http://localhost:8081/personas";
    private final RestTemplate rest;

    @Autowired
    public AdminPersona(RestTemplate rest) {
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

    /** Binder para OffsetDateTime en el form */
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

    @GetMapping("/personas")
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Persona[]> resp = rest.exchange(API_BASE, HttpMethod.GET, req, Persona[].class);
        List<Persona> personas = Arrays.asList(resp.getBody());
        model.addAttribute("personas", personas);
        return "admin_listPersona";
    }

    @GetMapping("/personas/nuevo")
    public String crearForm(Model model) {
        model.addAttribute("persona", new Persona());
        return "form-persona";
    }

    @PostMapping("/personas")
    public String crear(@ModelAttribute Persona persona, HttpSession session) {
        HttpEntity<Persona> req = new HttpEntity<>(persona, authHeaders(session));
        rest.exchange(API_BASE, HttpMethod.POST, req, Persona.class);
        return "redirect:/admin/personas";
    }

    @GetMapping("/personas/{id}/editar")
    public String editarForm(@PathVariable Long id, Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Persona> resp = rest.exchange(API_BASE + "/" + id, HttpMethod.GET, req, Persona.class);
        model.addAttribute("persona", resp.getBody());
        return "form-persona";
    }

    @PostMapping("/personas/{id}")
    public String actualizar(@PathVariable Long id, @ModelAttribute Persona persona, HttpSession session) {
        HttpEntity<Persona> req = new HttpEntity<>(persona, authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, req, Persona.class);
        return "redirect:/admin/personas";
    }

    @PostMapping("/personas/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);
        return "redirect:/admin/personas";
    }
}
