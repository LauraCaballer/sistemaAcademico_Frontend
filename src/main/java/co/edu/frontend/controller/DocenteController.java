package co.edu.frontend.controller;

import co.edu.frontend.model.Docente;
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/docente")
public class DocenteController {

    private final String DOCENTE_API_URL = "https://c568-181-33-168-160.ngrok-free.app/docentes";

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/informacion")
    public String mostrarInformacionDocente(HttpSession session, Model model) {
        System.out.println("=== DEBUG: Iniciando método informacion ===");

        LoginResponse loginData = (LoginResponse) session.getAttribute("username");
        System.out.println("LoginData: " + (loginData != null ? "OK" : "NULL"));


        // 1. Validar sesión
        if (loginData == null || loginData.getToken() == null) {
            return "redirect:/login";
        }

        if (loginData.getPersonaId() == null) {
            System.out.println("PersonaId es null");
            model.addAttribute("error", "No se pudo obtener el ID de persona para el profesor.");
            return "docente_informacion";
        }

        // 2. Construir URL usando personaId como código de docente
        Long codigoDocente = loginData.getPersonaId();
        String url = DOCENTE_API_URL + "/" + codigoDocente;

        try {
            // 3. Preparar encabezados con Bearer token
            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(loginData.getToken());
            HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

            // 4. Llamar al backend
            ResponseEntity<Docente> response = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    requestEntity,
                    Docente.class
            );

            System.out.println("Status response: " + response.getStatusCode());


            // 5. Procesar respuesta
            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                Docente docente = response.getBody();
                model.addAttribute("docente", docente);
            } else {
                model.addAttribute("error", "No se encontró información del docente. Estado: " + response.getStatusCode());
            }

        } catch (HttpClientErrorException.NotFound e) {
            model.addAttribute("error", "Docente no registrado en el sistema.");
        } catch (Exception e) {
            model.addAttribute("error", "Error al obtener la información del docente: " + e.getMessage());
        }

        return "docente_informacion";
    }
}
