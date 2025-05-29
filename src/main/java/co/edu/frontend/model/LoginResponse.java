package co.edu.frontend.model;

import java.util.List;

public class LoginResponse {
    private String token;
    private String username;
    private Long personaId; // ← Cambiar de persona_id a personaId
    private String nombre;
    private List<String> roles; // Nota: backend usa Set<RolEnum>, frontend List<String>

    // Getters y Setters
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Long getPersonaId() { // ← Cambiar metodo
        return personaId;
    }

    public void setPersonaId(Long personaId) { // ← Cambiar metodo
        this.personaId = personaId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
}