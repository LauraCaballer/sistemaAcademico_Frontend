package co.edu.frontend.model;

import java.util.Date;

public class Mensajeria {

    private Long id;
    private Persona remitente;
    private Persona destinatario;
    private String contenido;
    private Date fechaEnvio;
    private Boolean leido;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Persona getRemitente() { return remitente; }
    public void setRemitente(Persona remitente) { this.remitente = remitente; }

    public Persona getDestinatario() { return destinatario; }
    public void setDestinatario(Persona destinatario) { this.destinatario = destinatario; }

    public String getContenido() { return contenido; }
    public void setContenido(String contenido) { this.contenido = contenido; }

    public Date getFechaEnvio() { return fechaEnvio; }
    public void setFechaEnvio(Date fechaEnvio) { this.fechaEnvio = fechaEnvio; }

    public Boolean getLeido() { return leido; }
    public void setLeido(Boolean leido) { this.leido = leido; }

}
