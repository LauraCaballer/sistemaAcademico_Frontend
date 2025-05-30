package co.edu.frontend.controller;

import co.edu.frontend.model.Material;
import co.edu.frontend.model.LoginResponse;
import co.edu.frontend.model.Recurso;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import java.util.Random;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/materiales")
public class AdminMaterial {

    private static final String API_BASE = "http://localhost:8080/recursos";
    private static final String MATERIAL = "http://localhost:8080/materiales";
    private static final String AULA = "http://localhost:8080/aulas";
    private final RestTemplate rest;

    @Autowired
    public AdminMaterial(RestTemplate rest) {
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

    @GetMapping
    public String listar(Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));

        // Obtener recursos y materiales
        ResponseEntity<Recurso[]> respRecursos = rest.exchange(
                API_BASE, HttpMethod.GET, req, Recurso[].class);
        ResponseEntity<Material[]> respMateriales = rest.exchange(
                MATERIAL, HttpMethod.GET, req, Material[].class);

        List<Recurso> recursos = Arrays.asList(respRecursos.getBody());
        List<Material> materiales = Arrays.asList(respMateriales.getBody());

        // Crear lista combinada usando Material pero con datos de ambas entidades
        List<Material> materialesView = recursos.stream()
                .filter(r -> r.getNombre() != null)
                .map(r -> {
                    // Buscar el material correspondiente por ID
                    Material material = materiales.stream()
                            .filter(m -> m.getId().equals(r.getId()))
                            .findFirst()
                            .orElse(null);

                    if (material != null && material.getTipo() != null &&
                            List.of("Didactico","Tecnologico","Mobiliario","Laboratorio","Deportivo").contains(material.getTipo())) {

                        // Usar el material existente y agregar campos adicionales si es necesario
                        // Como no podemos modificar Material, usaremos model.addAttribute para pasar datos adicionales
                        return material;
                    }
                    return null;
                })
                .filter(m -> m != null)
                .collect(Collectors.toList());

        // Pasar recursos también para obtener nombres en la vista
        model.addAttribute("materiales", materialesView);
        model.addAttribute("recursos", recursos);
        return "admin_listMaterial";
    }

    @GetMapping("/nuevo")
    public String crearForm(Model model) {
        model.addAttribute("material", new Material());
        model.addAttribute("recurso", new Recurso());
        return "form-material";
    }

    @PostMapping
    public String crear(@ModelAttribute Material material, @ModelAttribute Recurso recurso, HttpSession session) {
        Random r = new Random();
        long id = r.nextLong();

        // Crear recurso con el ID generado
        recurso.setId(id);
        HttpEntity<Recurso> reqRecurso = new HttpEntity<>(recurso, authHeaders(session));
        rest.exchange(API_BASE, HttpMethod.POST, reqRecurso, Recurso.class);

        // Crear material con el mismo ID
        material.setId(id);
        HttpEntity<Material> reqMaterial = new HttpEntity<>(material, authHeaders(session));
        rest.exchange(MATERIAL, HttpMethod.POST, reqMaterial, Material.class);

        return "redirect:/admin/materiales";
    }

    @GetMapping("/{id}/editar")
    public String editarForm(@PathVariable Long id, Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));

        // Obtener recurso y material por separado
        ResponseEntity<Recurso> respRecurso = rest.exchange(
                API_BASE + "/" + id, HttpMethod.GET, req, Recurso.class);
        ResponseEntity<Material> respMaterial = rest.exchange(
                MATERIAL + "/" + id, HttpMethod.GET, req, Material.class);

        model.addAttribute("recurso", respRecurso.getBody());
        model.addAttribute("material", respMaterial.getBody());
        return "form-material";
    }

    @PostMapping("/{id}")
    public String actualizar(@PathVariable Long id, @ModelAttribute Material material, @ModelAttribute Recurso recurso, HttpSession session) {
        // Actualizar recurso
        recurso.setId(id);
        HttpEntity<Recurso> reqRecurso = new HttpEntity<>(recurso, authHeaders(session));
        rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, reqRecurso, Recurso.class);

        // Actualizar material con el mismo ID
        material.setId(id);
        HttpEntity<Material> reqMaterial = new HttpEntity<>(material, authHeaders(session));
        rest.exchange(MATERIAL + "/" + id, HttpMethod.PUT, reqMaterial, Material.class);

        return "redirect:/admin/materiales";
    }

    @PostMapping("/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));

        // Eliminar tanto recurso como material
        rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);
        rest.exchange(MATERIAL + "/" + id, HttpMethod.DELETE, req, Void.class);

        return "redirect:/admin/materiales";
    }
}