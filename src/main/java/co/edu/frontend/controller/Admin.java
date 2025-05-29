package co.edu.frontend.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class Admin {

    @GetMapping("/monda")
    public String estudianteDashboard(HttpSession session, Model model){
        return "navbar-admin";
    }
}
