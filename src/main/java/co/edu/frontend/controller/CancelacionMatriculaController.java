package co.edu.frontend.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CancelacionMatriculaController {

    // Mostrar la página de cancelación de matrícula
    @GetMapping("/cancelacion-matricula")
    public String mostrarFormularioCancelacion(Model model, HttpSession session) {
        // Verifica si el usuario está autenticado
        if (session.getAttribute("usuario") == null) {
            return "redirect:/login";
        }

        // Agregar datos necesarios al modelo para la pantalla (por ejemplo, materias inscritas)
        model.addAttribute("materias", obtenerMateriasEstudiante());
        return "RegistroNotas";
    }

    // Procesar la cancelación de una materia
    @PostMapping("/cancelar-materia")
    public String procesarCancelacion(
            @RequestParam String codigoMateria,
            HttpSession session,
            Model model) {

        // Verifica si el usuario está autenticado
        if (session.getAttribute("usuario") == null) {
            return "redirect:/login";
        }

        // Lógica para cancelar la materia (esto podría conectarse con un servicio REST o base de datos)
        boolean cancelada = cancelarMateria(codigoMateria);

        // Agregar un mensaje de éxito o error al modelo
        if (cancelada) {
            model.addAttribute("mensaje", "La materia fue cancelada con éxito.");
        } else {
            model.addAttribute("error", "Hubo un problema al cancelar la materia.");
        }

        // Redirigir o mostrar nuevamente el formulario de cancelación
        model.addAttribute("materias", obtenerMateriasEstudiante());
        return "cancelacion_matricula";
    }

    // Método de ejemplo para obtener materias del estudiante
    private Object obtenerMateriasEstudiante() {
        // Simulación de materias (esto normalmente vendría de un servicio o API)
        return new String[]{"Matemáticas", "Programación", "Física"};
    }

    // Método de ejemplo para cancelar una materia
    private boolean cancelarMateria(String codigoMateria) {
        // Simulación de cancelación (la lógica real podría involucrar bases de datos o APIs)
        System.out.println("Cancelando materia con código: " + codigoMateria);
        return true; // Suponer que siempre es exitoso
    }
}