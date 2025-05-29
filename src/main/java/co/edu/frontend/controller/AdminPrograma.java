// src/main/java/co/edu/frontend/controller/AdminPrograma.java
package co.edu.frontend.controller;

import co.edu.frontend.model.LoginResponse;
import co.edu.frontend.model.Programa;
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
public class AdminPrograma {

    private static final String API_BASE = "https://c568-181-33-168-160.ngrok-free.app/programas";
    private final RestTemplate rest;

    @Autowired
    public AdminPrograma(RestTemplate rest) {
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

    @GetMapping("/programas")
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Programa[]> resp = rest.exchange(
            API_BASE, HttpMethod.GET, req, Programa[].class);
        List<Programa> programas = Arrays.asList(resp.getBody());
        model.addAttribute("programas", programas);
        return "admin_listPrograma";
    }

    @GetMapping("/programas/nuevo")
    public String crearForm(Model model) {
        model.addAttribute("programa", new Programa());
        return "form-programa";
    }

    @PostMapping("/programas")
    public String crear(@ModelAttribute Programa programa, HttpSession session) {
        HttpEntity<Programa> req = new HttpEntity<>(programa, authHeaders(session));
        rest.exchange(API_BASE, HttpMethod.POST, req, Programa.class);
        return "redirect:/admin/programas";
    }

    @GetMapping("/programas/{id}/editar")
    public String editarForm(@PathVariable Long id, Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Programa> resp = rest.exchange(
            API_BASE + "/" + id, HttpMethod.GET, req, Programa.class);
        model.addAttribute("programa", resp.getBody());
        return "form-programa";
    }

    @PostMapping("/programas/{id}")
    public String actualizar(
            @PathVariable Long id,
            @ModelAttribute Programa programa,
            HttpSession session) {
        HttpEntity<Programa> req = new HttpEntity<>(programa, authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, req, Programa.class);
        return "redirect:/admin/programas";
    }

    @PostMapping("/programas/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);
        return "redirect:/admin/programas";
    }
}
