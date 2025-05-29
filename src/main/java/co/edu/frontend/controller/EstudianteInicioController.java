package co.edu.frontend.controller;

import co.edu.frontend.model.LoginResponse; // Ensure this class exists as per your LoginController
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/estudiante") // Base path for student-related pages
public class EstudianteInicioController {
    /**
     * Displays the student information page.
     * This page corresponds to the JSP you provided.
     *
     * @param session The HTTP session, used to check for a logged-in user.
     * @param model   The Spring model, used to pass data to the view.
     * @return The view name for the student dashboard/information page, or a redirect to login.
     */
    @GetMapping("/dashboard") // You can change "/dashboard" to "/informacion" or any preferred path
    public String mostrarPaginaEstudiante(HttpSession session, Model model) {
        LoginResponse loggedInUser = (LoginResponse) session.getAttribute("username");

        // Check if user is logged in, similar to LoginController's dashboard
        if (loggedInUser == null) {
            return "redirect:/login"; // Or redirect to "/" (home)
        }

        // Add basic user info from session to model
        // Your JSP currently hardcodes names like "Juan David".
        // If you update your JSP to use these model attributes, they will be dynamic.
        // For example, the top bar user name could use ${sessionUserName}
        //model.addAttribute("sessionUserName", loggedInUser.getNombre());
        //model.addAttribute("sessionUserRol", loggedInUser.getRol());

        // Add detailed student information to the model.
        // Your JSP has this data hardcoded. Providing it here allows for future dynamicity.

        // Sidebar and Top Bar Name (if different from sessionUserName or more specific)
        model.addAttribute("displayUserName", "Juan David"); // Used in sidebar and top bar in your JSP

        // Student Card Details
        model.addAttribute("cardFullName", "Juan David Rodriguez Perez");
        model.addAttribute("cardCc", "1152436789");
        model.addAttribute("cardCode", "1161022");
        model.addAttribute("cardGsRh", "A+");

        // Personal Information Tab
        model.addAttribute("personalTelefono", "3214567890");
        model.addAttribute("personalFechaNacimiento", "15/07/1998");
        model.addAttribute("personalEdad", "26"); // This could be calculated
        model.addAttribute("personalCorreoElectronico", "juandavid@gmail.com");
        model.addAttribute("personalCorreoInstitucional", "juandavidrp@ufps.edu.co");
        model.addAttribute("personalDireccion", "Calle 10 #15-23, Barrio Los Pinos");
        model.addAttribute("personalSexo", "Masculino");
        model.addAttribute("personalTelefonoAlterno", "3015846974");

        // Academic Information Tab
        model.addAttribute("academicPrograma", "Ingeniería de Sistemas");
        model.addAttribute("academicCreditosAprobados", "112");
        model.addAttribute("academicPromedioPonderado", "4.25");
        model.addAttribute("academicSemestreActual", "8");
        model.addAttribute("academicEstado", "Activo");
        model.addAttribute("academicFechaIngreso", "01/02/2021");
        model.addAttribute("academicPorcentajeAvance", "70%");

        // Title for the page if you want to set it from the controller
        model.addAttribute("pageTitle", "Sistema Académico - Estudiante");


        // Return the name of your JSP file (without .jsp extension)
        // For example, if your JSP is named "estudiante_dashboard.jsp", return "estudiante_dashboard"
        return "estudiante_dashboard";
    }
}
