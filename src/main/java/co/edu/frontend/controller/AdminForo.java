// src/main/java/co/edu/frontend/controller/AdminForo.java
package co.edu.frontend.controller;

import co.edu.frontend.model.Foro;
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
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminForo {

    private static final String API_BASE = "http://localhost:8081/foros";
    private final RestTemplate rest;

    @Autowired
    public AdminForo(RestTemplate rest) {
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

    /** Binder para que el form convierta Strings ISO sin offset a OffsetDateTime en UTC */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(OffsetDateTime.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                if (text == null || text.isBlank()) {
                    setValue(null);
                } else {
                    // parsea con ISO_LOCAL_DATE_TIME: "yyyy-MM-dd'T'HH:mm:ss[.SSS]"
                    LocalDateTime ldt = LocalDateTime.parse(text);
                    setValue(ldt.atOffset(ZoneOffset.UTC));
                }
            }
            @Override
            public String getAsText() {
                OffsetDateTime odt = (OffsetDateTime) getValue();
                return (odt != null)
                    ? odt.toLocalDateTime().toString()
                    : "";
            }
        });
    }

    @GetMapping("/foros")
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Foro[]> resp = rest.exchange(
            API_BASE, HttpMethod.GET, req, Foro[].class);
        List<Foro> foros = Arrays.asList(resp.getBody());
        model.addAttribute("foros", foros);
        return "admin_listForo";
    }

    @GetMapping("/foros/nuevo")
    public String crearForm(Model model) {
        model.addAttribute("foro", new Foro());
        return "form-foro";
    }

    @PostMapping("/foros")
    public String crear(@ModelAttribute Foro foro, HttpSession session) {
        HttpEntity<Foro> req = new HttpEntity<>(foro, authHeaders(session));
        rest.exchange(API_BASE, HttpMethod.POST, req, Foro.class);
        return "redirect:/admin/foros";
    }

    @GetMapping("/foros/{id}/editar")
    public String editarForm(
            @PathVariable Long id,
            Model model,
            HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Foro> resp = rest.exchange(
            API_BASE + "/" + id, HttpMethod.GET, req, Foro.class);
        model.addAttribute("foro", resp.getBody());
        return "form-foro";
    }

    @PostMapping("/foros/{id}")
    public String actualizar(
            @PathVariable Long id,
            @ModelAttribute Foro foro,
            HttpSession session) {
        HttpEntity<Foro> req = new HttpEntity<>(foro, authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, req, Foro.class);
        return "redirect:/admin/foros";
    }

    @PostMapping("/foros/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);
        return "redirect:/admin/foros";
    }
}
