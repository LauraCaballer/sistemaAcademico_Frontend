package co.edu.frontend.controller;

import co.edu.frontend.model.Aula;
import co.edu.frontend.model.LoginResponse;
import co.edu.frontend.model.Recurso;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/aulas")
public class AdminAula {

    private static final String API_RECURSOS = "https://c568-181-33-168-160.ngrok-free.app/recursos";
    private static final String API_AULAS = "https://c568-181-33-168-160.ngrok-free.app/aulas";
    private final RestTemplate rest;

    @Autowired
    public AdminAula(RestTemplate rest) {
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

        // Obtener aulas del endpoint de aulas
        ResponseEntity<Aula[]> respAulas = rest.exchange(
                API_AULAS, HttpMethod.GET, req, Aula[].class);

        // Obtener recursos para obtener los nombres
        ResponseEntity<Recurso[]> respRecursos = rest.exchange(
                API_RECURSOS, HttpMethod.GET, req, Recurso[].class);

        List<Aula> aulas = Arrays.stream(respAulas.getBody())
                .map(aula -> {
                    // Buscar el recurso correspondiente para obtener el nombre
                    Arrays.stream(respRecursos.getBody())
                            .filter(r -> r.getId().equals(aula.getId().longValue()))
                            .findFirst()
                            .ifPresent(recurso -> {
                                // El nombre viene del recurso, los demás campos del aula
                                // Aquí podrías agregar el nombre al aula si tienes ese campo
                                // Por ahora solo traemos los datos del aula: capacidad, dimensiones, es_examen, estado y tipo
                            });
                    return aula;
                })
                .collect(Collectors.toList());

        model.addAttribute("aulas", aulas);
        model.addAttribute("recursos", Arrays.asList(respRecursos.getBody())); // Para mostrar nombres
        return "admin_listAula";
    }

    @GetMapping("/nuevo")
    public String crearForm(Model model) {
        model.addAttribute("aula", new Aula());
        return "form-aula";
    }

    @PostMapping
    public String crear(@ModelAttribute Aula aula, HttpSession session) {
        HttpHeaders headers = authHeaders(session);

        // 1. Crear el recurso primero
        Recurso recurso = new Recurso();
        recurso.setNombre("Aula " + (aula.getTipo() != null ? aula.getTipo() : ""));
        // recurso.setUbicacion() - esto se manejará desde otro formulario si es necesario

        HttpEntity<Recurso> reqRecurso = new HttpEntity<>(recurso, headers);
        ResponseEntity<Recurso> respRecurso = rest.exchange(
                API_RECURSOS, HttpMethod.POST, reqRecurso, Recurso.class);

        // 2. Usar el mismo ID del recurso creado para el aula
        Long recursoId = respRecurso.getBody().getId();
        aula.setId(recursoId.intValue());

        // 3. Crear el aula con el mismo ID
        HttpEntity<Aula> reqAula = new HttpEntity<>(aula, headers);
        rest.exchange(API_AULAS, HttpMethod.POST, reqAula, Aula.class);

        return "redirect:/admin/aulas";
    }

    @GetMapping("/{id}/editar")
    public String editarForm(@PathVariable Integer id, Model model, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));

        // Obtener el aula del endpoint de aulas
        ResponseEntity<Aula> respAula = rest.exchange(
                API_AULAS + "/" + id, HttpMethod.GET, req, Aula.class);

        // Obtener el recurso correspondiente para obtener el nombre
        ResponseEntity<Recurso> respRecurso = rest.exchange(
                API_RECURSOS + "/" + id, HttpMethod.GET, req, Recurso.class);

        Aula aula = respAula.getBody();
        Recurso recurso = respRecurso.getBody();

        // Agregar información del recurso (nombre) al modelo para mostrar en el formulario
        model.addAttribute("aula", aula);
        model.addAttribute("nombreRecurso", recurso.getNombre());

        return "form-aula";
    }

    @PostMapping("/{id}")
    public String actualizar(@PathVariable Integer id, @ModelAttribute Aula aula, HttpSession session) {
        HttpHeaders headers = authHeaders(session);

        // 1. Actualizar el aula (capacidad, dimensiones, es_examen, estado y tipo)
        HttpEntity<Aula> reqAula = new HttpEntity<>(aula, headers);
        rest.exchange(API_AULAS + "/" + id, HttpMethod.PUT, reqAula, Aula.class);

        // 2. Actualizar el recurso correspondiente (mismo ID) - solo el nombre
        Recurso recurso = new Recurso();
        recurso.setId(id.longValue());
        recurso.setNombre("Aula " + (aula.getTipo() != null ? aula.getTipo() : ""));
        // La ubicacion del recurso se mantiene o se actualiza desde otro lugar

        HttpEntity<Recurso> reqRecurso = new HttpEntity<>(recurso, headers);
        rest.exchange(API_RECURSOS + "/" + id, HttpMethod.PUT, reqRecurso, Recurso.class);

        return "redirect:/admin/aulas";
    }

    @PostMapping("/{id}/eliminar")
    public String eliminar(@PathVariable Integer id, HttpSession session) {
        HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));

        // Eliminar tanto del endpoint de aulas como de recursos (mismo ID)
        rest.exchange(API_AULAS + "/" + id, HttpMethod.DELETE, req, Void.class);
        rest.exchange(API_RECURSOS + "/" + id, HttpMethod.DELETE, req, Void.class);

        return "redirect:/admin/aulas";
    }
}