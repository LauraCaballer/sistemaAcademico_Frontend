package co.edu.frontend.controller;

import co.edu.frontend.model.Asignatura;
import co.edu.frontend.model.Pensum;
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
import java.util.Arrays;

@Controller
@RequestMapping("/admin/asignaturas")
public class AdminAsignatura {
    private static final String API_BASE   = "http://localhost:8080/asignaturas";
    private static final String API_PENSUM = "http://localhost:8080/pensums";

    private final RestTemplate rest;

    @Autowired
    public AdminAsignatura(RestTemplate rest) { this.rest = rest; }

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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // Si necesitas custom editors para fechas, añádelos aquí
    }

    @GetMapping
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        Asignatura[] arr = rest.exchange(API_BASE, HttpMethod.GET, req, Asignatura[].class).getBody();
        model.addAttribute("asignaturas", Arrays.asList(arr));
        return "admin_listAsignatura";
    }

    @GetMapping("/nuevo")
    public String crearForm(Model model, HttpSession session) {
        model.addAttribute("asignatura", new Asignatura());
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        model.addAttribute("pensums", Arrays.asList(
                rest.exchange(API_PENSUM, HttpMethod.GET, req, Pensum[].class).getBody()));
        return "form-asignatura";
    }

    @PostMapping
    public String crear(@ModelAttribute Asignatura asignatura, HttpSession session) {
        HttpEntity<Asignatura> req = new HttpEntity<>(asignatura, authHeaders(session));
        rest.exchange(API_BASE, HttpMethod.POST, req, Asignatura.class);
        return "redirect:/admin/asignaturas";
    }

    @GetMapping("/{id}/editar")
    public String editarForm(@PathVariable Long id, Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        Asignatura a = rest.exchange(API_BASE + "/" + id, HttpMethod.GET, req, Asignatura.class).getBody();
        model.addAttribute("asignatura", a);
        model.addAttribute("pensums", Arrays.asList(
                rest.exchange(API_PENSUM, HttpMethod.GET, req, Pensum[].class).getBody()));
        return "form-asignatura";
    }

    @PostMapping("/{id}")
    public String actualizar(@PathVariable Long id, @ModelAttribute Asignatura asignatura, HttpSession session) {
        HttpEntity<Asignatura> req = new HttpEntity<>(asignatura, authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, req, Asignatura.class);
        return "redirect:/admin/asignaturas";
    }

    @PostMapping("/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);
        return "redirect:/admin/asignaturas";
    }
}