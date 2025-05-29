package co.edu.frontend.controller;

import co.edu.frontend.model.LoginResponse;
import co.edu.frontend.model.Mensajeria;
import co.edu.frontend.model.Persona;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class MensajeController {

    private static final String API_BASE = "http://localhost:8080/mensajes";
    private final RestTemplate rest;

    @Autowired
    public MensajeController(RestTemplate rest) {
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

    @GetMapping("/mensajes")
    public String listarMensajes(Model model, HttpSession session) {
        try {
            LoginResponse login = (LoginResponse) session.getAttribute("username");
            if (login == null || login.getToken() == null) {
                return "redirect:/login";
            }

            HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
            ResponseEntity<Mensajeria[]> resp = rest.exchange(API_BASE, HttpMethod.GET, req, Mensajeria[].class);

            List<Mensajeria> mensajes = Arrays.asList(resp.getBody() != null ? resp.getBody() : new Mensajeria[0]);

            // Contar mensajes no leídos
            long unreadCount = mensajes.stream()
                    .filter(m -> m.getLeido() != null && !m.getLeido())
                    .count();

            // Agregar atributos para la vista
            model.addAttribute("mensajes", mensajes); // Corregido: era "messages"
            model.addAttribute("unreadCount", unreadCount);
            model.addAttribute("now", new Date());

            return "admin_mensajeria";

        } catch (Exception e) {
            e.printStackTrace(); // Para debug
            model.addAttribute("error", "Error al cargar mensajes: " + e.getMessage());
            return "error"; // O redirigir a una página de error
        }
    }

    @GetMapping("/mensajes/nuevo")
    public String nuevoMensajeForm(Model model, HttpSession session) {
        LoginResponse login = (LoginResponse) session.getAttribute("username");
        if (login == null || login.getToken() == null) {
            return "redirect:/login";
        }

        model.addAttribute("mensaje", new Mensajeria());
        return "form-mensaje";
    }

    @PostMapping("/mensajes")
    public String enviarMensaje(@ModelAttribute Mensajeria mensaje, HttpSession session) {
        try {
            LoginResponse login = (LoginResponse) session.getAttribute("username");
            if (login == null || login.getToken() == null) {
                return "redirect:/login";
            }

            mensaje.setFechaEnvio(new Date());
            mensaje.setLeido(false);

            // Crear el remitente
            Persona remitente = new Persona();
            remitente.setId(login.getPersonaId());
            mensaje.setRemitente(remitente);

            // Asegurarse de que el destinatario tenga un ID válido
            if (mensaje.getDestinatario() == null || mensaje.getDestinatario().getId() == null) {
                return "redirect:/admin/mensajes?error=destinatario_requerido";
            }

            HttpEntity<Mensajeria> req = new HttpEntity<>(mensaje, authHeaders(session));
            rest.exchange(API_BASE, HttpMethod.POST, req, Mensajeria.class);

            return "redirect:/admin/mensajes";

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/mensajes?error=envio";
        }
    }

    @GetMapping("/mensajes/{id}/leer")
    public String verMensaje(@PathVariable Long id, Model model, HttpSession session) {
        try {
            LoginResponse login = (LoginResponse) session.getAttribute("username");
            if (login == null || login.getToken() == null) {
                return "redirect:/login";
            }

            HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
            ResponseEntity<Mensajeria> resp = rest.exchange(API_BASE + "/" + id, HttpMethod.GET, req, Mensajeria.class);
            Mensajeria mensaje = resp.getBody();

            if (mensaje != null && (mensaje.getLeido() == null || !mensaje.getLeido())) {
                mensaje.setLeido(true);
                HttpEntity<Mensajeria> updateReq = new HttpEntity<>(mensaje, authHeaders(session));
                rest.exchange(API_BASE + "/" + id, HttpMethod.PUT, updateReq, Mensajeria.class);
            }

            model.addAttribute("mensaje", mensaje);
            return "form-mensaje";

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/mensajes?error=lectura";
        }
    }

    @PostMapping("/mensajes/{id}/eliminar")
    public String eliminar(@PathVariable Long id, HttpSession session) {
        try {
            LoginResponse login = (LoginResponse) session.getAttribute("username");
            if (login == null || login.getToken() == null) {
                return "redirect:/login";
            }

            HttpEntity<Void> req = new HttpEntity<>(authHeaders(session));
            rest.exchange(API_BASE + "/" + id, HttpMethod.DELETE, req, Void.class);

            return "redirect:/admin/mensajes";

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/admin/mensajes?error=eliminacion";
        }
    }
}