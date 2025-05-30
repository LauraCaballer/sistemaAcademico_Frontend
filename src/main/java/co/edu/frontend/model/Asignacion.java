package co.edu.frontend.model;

public class Asignacion {
    private Long id; // Identificador único de la asignación
    private Docente docente; // Objeto Docente que se asignará
    private Curso curso; // Objeto Curso al que se asignará el docente

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Docente getDocente() {
        return docente;
    }

    public void setDocente(Docente docente) {
        this.docente = docente;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
}
