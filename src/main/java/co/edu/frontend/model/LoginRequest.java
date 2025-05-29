package co.edu.frontend.model;

public class LoginRequest {
    private String usuario;
    private String clave;

    public String getUsername() { return usuario; }
    public void setUsername(String usuario) { this.usuario = usuario; }
    public String getPassword() { return clave; }
    public void setPassword(String clave) { this.clave = clave; }
}
