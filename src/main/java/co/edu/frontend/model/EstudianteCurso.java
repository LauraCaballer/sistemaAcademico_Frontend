package co.edu.frontend.model;

public class EstudianteCurso {

    private Long id;

    private Curso curso;
    private Float P1;
    private Float P2;
    private Float P3;
    private Float EX;
    private Float H;
    private Float definitiva;
    private String retroalimentacion;

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

    public Float getP1() {
        return P1;
    }

    public void setP1(Float p1) {
        P1 = p1;
    }

    public Float getP2() {
        return P2;
    }

    public void setP2(Float p2) {
        P2 = p2;
    }

    public Float getP3() {
        return P3;
    }

    public void setP3(Float p3) {
        P3 = p3;
    }

    public Float getEX() {
        return EX;
    }

    public void setEX(Float EX) {
        this.EX = EX;
    }

    public Float getH() {
        return H;
    }

    public void setH(Float h) {
        H = h;
    }

    public String getRetroalimentacion() {
        return retroalimentacion;
    }

    public void setRetroalimentacion(String retroalimentacion) {
        this.retroalimentacion = retroalimentacion;
    }
}
