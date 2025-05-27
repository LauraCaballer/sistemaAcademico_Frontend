package co.edu.frontend.controller;

import co.edu.frontend.model.LoginResponse; // Asegúrate que esta clase exista
//import co.edu.frontend.model.pensum.AsignaturaPensum;
//import co.edu.frontend.model.pensum.SemestrePensum;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/estudiante")
public class PensumController {

    @GetMapping("/pensum")
    public String mostrarPensumEstudiante(HttpSession session, Model model) {
        LoginResponse loggedInUser = (LoginResponse) session.getAttribute("usuario");

        if (loggedInUser == null) {
            // Redirigir a login si no hay sesión
            return "redirect:/login";
        }

        // Atributos comunes para la plantilla (barra superior, menú lateral)
        model.addAttribute("sessionUserName", loggedInUser.getNombre());
        // El JSP actualmente usa "Juan David" estático, lo pasamos por si se actualiza.
        model.addAttribute("displayUserName", "Juan David");

        // Título específico de la página
        //model.addAttribute("pageTitle", "Sistema Académico - Pensum");

        // --- Preparar datos del Pensum (Ejemplo) ---
        // En una aplicación real, estos datos vendrían de una base de datos o un servicio.
        /*List<SemestrePensum> pensumCompleto = new ArrayList<>();

        // Semestre I
        SemestrePensum semestre1 = new SemestrePensum("Semestre I");
        semestre1.addAsignatura(new AsignaturaPensum("1150401", "CÁLCULO DIFERENCIAL", 4, "OB", "Aprobada", "4.5"));
        semestre1.addAsignatura(new AsignaturaPensum("1150402", "GEOMETRÍA VECTORIAL Y ANALÍTICA", 3, "OB", "Aprobada", "3.8"));
        semestre1.addAsignatura(new AsignaturaPensum("1150403", "VIVENCIAS UNIVERSITARIAS", 1, "OB", "Aprobada", "AP")); // AP = Aprobado
        semestre1.addAsignatura(new AsignaturaPensum("1150404", "LECTOESCRITURA", 2, "OB", "Aprobada", "4.0"));
        semestre1.addAsignatura(new AsignaturaPensum("1150001", "INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS", 2, "OB", "Aprobada", "4.2"));
        pensumCompleto.add(semestre1);

        // Semestre II
        SemestrePensum semestre2 = new SemestrePensum("Semestre II");
        semestre2.addAsignatura(new AsignaturaPensum("1150405", "CÁLCULO INTEGRAL", 4, "OB", "Aprobada", "4.0"));
        semestre2.addAsignatura(new AsignaturaPensum("1150406", "ÁLGEBRA LINEAL", 3, "OB", "Aprobada", "3.5"));
        semestre2.addAsignatura(new AsignaturaPensum("1150002", "LÓGICA COMPUTACIONAL", 3, "OB", "Aprobada", "4.1"));
        semestre2.addAsignatura(new AsignaturaPensum("1150003", "PROGRAMACIÓN DE COMPUTADORES I", 3, "OB", "Aprobada", "4.3"));
        semestre2.addAsignatura(new AsignaturaPensum("1110101", "CULTURA Y DEPORTE", 1, "OB", "Aprobada", "AP"));
        pensumCompleto.add(semestre2);

        // Semestre III (Ejemplo con asignaturas en diferentes estados)
        SemestrePensum semestre3 = new SemestrePensum("Semestre III");
        semestre3.addAsignatura(new AsignaturaPensum("1150407", "CÁLCULO VECTORIAL", 4, "OB", "Cursando", ""));
        semestre3.addAsignatura(new AsignaturaPensum("1150004", "PROGRAMACIÓN DE COMPUTADORES II", 3, "OB", "Cursando", ""));
        semestre3.addAsignatura(new AsignaturaPensum("1150005", "ARQUITECTURA DE COMPUTADORES", 3, "OB", "Pendiente", ""));
        semestre3.addAsignatura(new AsignaturaPensum("1150006", "ESTRUCTURAS DE DATOS", 3, "OB", "Pendiente", ""));
        semestre3.addAsignatura(new AsignaturaPensum("1110202", "ELECTIVA SOCIOHUMANÍSTICA I", 2, "EL", "No Cursada", ""));
        pensumCompleto.add(semestre3);

        // Puedes añadir más semestres de la misma forma...
        // --- Fin de la preparación de datos del Pensum ---

        model.addAttribute("pensum", pensumCompleto);
        model.addAttribute("nombrePrograma", "Ingeniería de Sistemas"); // Dato adicional de ejemplo
        model.addAttribute("totalCreditosPrograma", 160); // Dato adicional de ejemplo*/

        // Nombre de la vista JSP (asume que tu JSP se llama "estudiante_pensum.jsp")
        return "pensum";
    }
}
