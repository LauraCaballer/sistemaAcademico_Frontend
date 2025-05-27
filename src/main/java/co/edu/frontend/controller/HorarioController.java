package co.edu.frontend.controller;

import co.edu.frontend.model.LoginResponse; // Asumiendo que esta clase existe
//import co.edu.frontend.model.horario.ClaseInfo;
//import co.edu.frontend.model.horario.FilaHorario;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/estudiante") // Mantenemos la ruta base para consistencia
public class HorarioController {

    @GetMapping("/horario")
    public String mostrarHorarioEstudiante(HttpSession session, Model model) {
        LoginResponse loggedInUser = (LoginResponse) session.getAttribute("usuario");

        if (loggedInUser == null) {
            // Si no hay usuario en sesión, redirigir a la página de login
            return "redirect:/login";
        }

        // Atributos comunes para el layout (barra superior, menú lateral)
        // El JSP usa "Juan David" de forma estática, pero pasamos el de sesión por si se actualiza el JSP
        model.addAttribute("sessionUserName", loggedInUser.getNombre());
        // model.addAttribute("sessionUserRol", loggedInUser.getRol()); // Si fuera necesario

        // Para mantener la visualización actual del JSP que tiene "Juan David" hardcodeado
        model.addAttribute("displayUserName", "Juan David");


        // Título específico de la página
        model.addAttribute("pageTitle", "Sistema Académico - Horario de Clases");

        // Preparar los datos del horario
        /*List<FilaHorario> horarioFilas = new ArrayList<>();

        // --- Poblamos el horario según el JSP ---
        // Nota: En una aplicación real, estos datos vendrían de una base de datos o servicio.

        // Fila 06:00-07:00
        FilaHorario fila06 = new FilaHorario("06:00-07:00");
        fila06.setMartes(new ClaseInfo("Sistemas operativos - B", "SB404", "border-sistemas"));
        fila06.setJueves(new ClaseInfo("Programación web - A", "SA402", "border-programacion"));
        fila06.setViernes(new ClaseInfo("Programación web - A", "SA401", "border-programacion"));
        horarioFilas.add(fila06);

        // Fila 07:00-08:00
        FilaHorario fila07 = new FilaHorario("07:00-08:00");
        fila07.setLunes(new ClaseInfo("Sistemas operativos - B", "SB404", "border-sistemas"));
        fila07.setMartes(new ClaseInfo("Sistemas operativos - B", "SB404", "border-sistemas"));
        fila07.setJueves(new ClaseInfo("Programación web - A", "SA402", "border-programacion"));
        fila07.setViernes(new ClaseInfo("Programación web - A", "SA401", "border-programacion"));
        horarioFilas.add(fila07);

        // Fila 08:00-09:00
        FilaHorario fila08 = new FilaHorario("08:00-09:00");
        fila08.setLunes(new ClaseInfo("Seminario integrador II - A", "SA414", "border-seminario"));
        fila08.setMartes(new ClaseInfo("Bases de datos - A", "SA402", "border-bases"));
        fila08.setMiercoles(new ClaseInfo("Planeación estratégica de sistemas de inf - A", "SB401", "border-planeacion"));
        fila08.setJueves(new ClaseInfo("Problemas sociales de frontera - A", "SA202", "border-problemas"));
        fila08.setViernes(new ClaseInfo("Bases de datos - A", "SA414", "border-bases"));
        horarioFilas.add(fila08);

        // Fila 09:00-10:00
        FilaHorario fila09 = new FilaHorario("09:00-10:00");
        fila09.setLunes(new ClaseInfo("Seminario integrador II - A", "SA414", "border-seminario"));
        fila09.setMartes(new ClaseInfo("Bases de datos - A", "SA402", "border-bases"));
        fila09.setJueves(new ClaseInfo("Problemas sociales de frontera - A", "SA202", "border-problemas"));
        fila09.setViernes(new ClaseInfo("Bases de datos - A", "SA414", "border-bases"));
        horarioFilas.add(fila09);

        // Fila 10:00-11:00
        FilaHorario fila10 = new FilaHorario("10:00-11:00");
        fila10.setLunes(new ClaseInfo("Planeación estratégica de sistemas de inf - A", "SA411", "border-planeacion"));
        horarioFilas.add(fila10);

        // Fila 11:00-12:00
        FilaHorario fila11 = new FilaHorario("11:00-12:00");
        fila11.setLunes(new ClaseInfo("Planeación estratégica de sistemas de inf - A", "SA411", "border-planeacion"));
        fila11.setMiercoles(new ClaseInfo("Constitución y civismo - A", "AG404", "border-constitucion"));
        horarioFilas.add(fila11);

        // Fila 12:00-13:00
        FilaHorario fila12 = new FilaHorario("12:00-13:00");
        fila12.setMiercoles(new ClaseInfo("Constitución y civismo - A", "AG404", "border-constitucion"));
        horarioFilas.add(fila12);

        // Filas vacías restantes según el JSP (de 13:00 a 22:00)
        String[] franjasVacias = {
                "13:00-14:00", "14:00-15:00", "15:00-16:00", "16:00-17:00",
                "17:00-18:00", "18:00-19:00", "19:00-20:00", "20:00-21:00", "21:00-22:00"
        };
        for (String franja : franjasVacias) {
            horarioFilas.add(new FilaHorario(franja)); // Se añaden vacías
        }*/
        // --- Fin de la población del horario ---

        //model.addAttribute("horarioFilas", horarioFilas);

        return "horario";
    }
}
