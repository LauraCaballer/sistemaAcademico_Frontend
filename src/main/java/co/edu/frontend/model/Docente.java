package co.edu.frontend.model;

public class Docente {
    private Long id;
    private Integer codigoDocente;
    private String experiencia;
    private Programa programa;
    private Persona persona;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Integer getCodigoDocente() { return codigoDocente; }
    public void setCodigoDocente(Integer codigoDocente) { this.codigoDocente = codigoDocente; }

    public String getExperiencia() { return experiencia; }
    public void setExperiencia(String experiencia) { this.experiencia = experiencia; }

    public Programa getPrograma() { return programa; }
    public void setPrograma(Programa programa) { this.programa = programa; }

    public Persona getPersona() { return persona; }
    public void setPersona(Persona persona) { this.persona = persona; }
}
