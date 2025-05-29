package co.edu.frontend.model;

public class EstudianteCurso {

    private Long id;

    private Curso curso;
    private Float definitiva;

    private Estudiante estudiante;

    private String estado;
    private Boolean habilitacion;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Boolean getHabilitacion() {
        return habilitacion;
    }

    public void setHabilitacion(Boolean habilitacion) {
        this.habilitacion = habilitacion;
    }

    public Float getDefinitiva() {
        return definitiva;
    }

    public void setDefinitiva(Float definitiva) {
        this.definitiva = definitiva;
    }
}
