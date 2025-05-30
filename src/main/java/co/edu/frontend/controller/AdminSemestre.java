// src/main/java/co/edu/frontend/controller/AdminSemestre.java
package co.edu.frontend.controller;

import co.edu.frontend.model.LoginResponse;
import co.edu.frontend.model.Semestre;
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
public class AdminSemestre {

    private static final String API_BASE = "http://localhost:8080/semestres";
    private final RestTemplate rest;

    @Autowired
    public AdminSemestre(RestTemplate rest) {
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

    @GetMapping("/semestres")
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Semestre[]> resp = rest.exchange(
            API_BASE, HttpMethod.GET, req, Semestre[].class);
        List<Semestre> semestres = Arrays.asList(resp.getBody());
        model.addAttribute("semestres", semestres);
        return "admin_listSemestre";
    }

    @GetMapping("/semestres/nuevo")
    public String crearForm(Model model) {
        model.addAttribute("semestre", new Semestre());
        return "form-semestre";
    }

    @PostMapping("/semestres")
    public String crear(@ModelAttribute Semestre semestre, HttpSession session) {
        HttpEntity<Semestre> req = new HttpEntity<>(semestre, authHeaders(session));
        rest.exchange(API_BASE, HttpMethod.POST, req, Semestre.class);
        return "redirect:/admin/semestres";
    }

    @GetMapping("/semestres/{id}/editar")
    public String editarForm(
            @PathVariable Long id,
            Model model,
            HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        ResponseEntity<Semestre> resp = rest.exchange(
            API_BASE + "/" + id, HttpMethod.GET, req, Semestre.class);
        model.addAttribute("semestre", resp.getBody());
        return "form-semestre";
    }

    @PostMapping("/semestres/{id}")
    public String actualizar(
            @PathVariable Long id,
            @ModelAttribute Semestre semestre,
            HttpSession session) {
        HttpEntity<Semestre> req = new HttpEntity<>(semestre, authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, req, Semestre.class);
        return "redirect:/admin/semestres";
    }

    @PostMapping("/semestres/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);
        return "redirect:/admin/semestres";
    }
}
