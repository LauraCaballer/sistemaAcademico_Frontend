package co.edu.frontend.model;

public class Estudiante {
    private Long id;
    private Long codigoEstudiante;
    private Programa programa; // Asumiendo que Programa es otra clase modelo
    private Persona persona;   // Asumiendo que Persona es otra clase modelo
    private String modalidad;
    private String jornada;

    public Long getCodigoEstudiante() {
        return codigoEstudiante;
    }

    public void setCodigoEstudiante(Long codigoEstudiante) {
        this.codigoEstudiante = codigoEstudiante;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Programa getPrograma() {
        return programa;
    }

    public void setPrograma(Programa programa) {
        this.programa = programa;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public String getJornada() {
        return jornada;
    }

    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

}
