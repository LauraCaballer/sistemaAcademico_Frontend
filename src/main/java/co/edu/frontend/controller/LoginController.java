package co.edu.frontend.controller;

import co.edu.frontend.model.LoginRequest;
import co.edu.frontend.model.LoginResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException; // Catch broader RestTemplate errors
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Controller
public class LoginController {
    private final String AUTH_URL = "https://c568-181-33-168-160.ngrok-free.app/api/auth/login";

    @GetMapping("/login")
    public String mostrarFormularioLogin(Model model) {
        // If your login form uses th:object, you might want to add an empty LoginRequest here:
        // model.addAttribute("loginRequest", new LoginRequest());
        return "login";
    }

    @PostMapping("/login")
    public String procesarLogin(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        RestTemplate restTemplate = new RestTemplate();
        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setUsername(username);
        loginRequest.setPassword(password);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<LoginRequest> requestEntity = new HttpEntity<>(loginRequest, headers);

        try {
            ResponseEntity<LoginResponse> response = restTemplate.exchange(
                    AUTH_URL,
                    HttpMethod.POST,
                    requestEntity,
                    LoginResponse.class

            );

            if (response.getStatusCode() == HttpStatus.OK) {
                session.setAttribute("username", response.getBody());

                LoginResponse body = response.getBody();
                List<String> roles = body.getRoles();

                if (roles != null && roles.contains("Admin")) {
                    return "redirect:/admin/monda";
                } else if(roles != null && roles.contains("Estudiante")){
                    return "redirect:/estudiante/informacion";
                } else if(roles != null && roles.contains("Docente")){
                    // Redirige al controlador de Docente
                    return "redirect:/docente/informacion";
                } else if(roles != null && roles.contains("PersonalAdministrativo")){

                }

                return "redirect:/dashboard";

            }
        } catch (HttpClientErrorException.Unauthorized e) {
            model.addAttribute("error", "Usuario o clave incorrectos");
        } catch (Exception e) {
                model.addAttribute("error", "Error al contactar el microservicio");
        }

        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        LoginResponse user = (LoginResponse) session.getAttribute("username");
        if (user == null) return "redirect:/login";

        model.addAttribute("username", user.getUsername());
        model.addAttribute("token", user.getToken());
        model.addAttribute("roles", user.getRoles());
        return "dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}