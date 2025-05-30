package co.edu.frontend.controller;

import co.edu.frontend.model.Estudiante;
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
@RequestMapping("/estudiante")
public class EstudianteController {
    // URL de tu API backend para obtener datos del estudiante por personaId
    // Asegúrate que este endpoint exista en tu backend (EstudianteController.java)
    private final String ESTUDIANTE_API_URL = "https://005b-2800-486-e78-6d00-48b9-32c2-f399-b856.ngrok-free.app/estudiantes"; // Asumiendo que tienes el backend en el puerto 8080

    @Autowired
    private RestTemplate restTemplate; // Asegúrate de tener configurado el bean de RestTemplate

    @GetMapping("/")
    public String estudianteDashboard(HttpSession session, Model model){
        return "estudiante_informacion";
    }

    @GetMapping("/informacion")
    public String mostrarInformacionEstudiante(HttpSession session, Model model) {
        System.out.println("=== DEBUG: Iniciando método informacion ===");

        LoginResponse loginData = (LoginResponse) session.getAttribute("username");
        System.out.println("LoginData: " + (loginData != null ? "OK" : "NULL"));

        if (loginData == null || loginData.getToken() == null) {
            System.out.println("Redirigiendo a login - no hay sesión");
            return "redirect:/login";
        }


        if (loginData.getPersonaId() == null) {
            System.out.println("PersonaId es null");
            model.addAttribute("error", "No se pudo obtener el ID de persona para el estudiante.");
            return "estudiante_informacion";
        }

        try {
            String url = ESTUDIANTE_API_URL + "/persona/" + loginData.getPersonaId();
            System.out.println("URL a llamar: " + url);

            HttpHeaders headers = new HttpHeaders();
            headers.setBearerAuth(loginData.getToken());
            HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

            ResponseEntity<Estudiante> response = restTemplate.exchange(
                    url,
                    HttpMethod.GET,
                    requestEntity,
                    Estudiante.class
            );

            System.out.println("Status response: " + response.getStatusCode());

            if (response.getStatusCode() == HttpStatus.OK && response.getBody() != null) {
                Estudiante estudiante = response.getBody();
                System.out.println("Estudiante obtenido: " + estudiante.getId());
                model.addAttribute("estudiante", estudiante);

                if (estudiante.getPersona() != null) {
                    model.addAttribute("persona", estudiante.getPersona());
                }
            } else {
                model.addAttribute("error", "No se pudo encontrar la información del estudiante. Estado: " + response.getStatusCode());
            }

        } catch (HttpClientErrorException.NotFound e) {
            System.out.println("Error 404: " + e.getMessage());
            model.addAttribute("error", "Estudiante no encontrado en el sistema.");
        } catch (Exception e) {
            System.out.println("Error general: " + e.getMessage());
            e.printStackTrace();
            model.addAttribute("error", "Error al obtener la información del estudiante: " + e.getMessage());
        }

        System.out.println("=== DEBUG: Retornando vista estudiante_informacion ===");
        return "estudiante_informacion";
    }
}
