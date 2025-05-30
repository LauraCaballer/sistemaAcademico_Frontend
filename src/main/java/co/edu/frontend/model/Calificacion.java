package co.edu.frontend.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Calificacion {
    private Long id;
    private String nombre;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "UTC")
    private Date fecha;

    private String tipo;  // Enum idéntico al del backend: P1, P2, P3, EX, H

    private Float nota;

    private EstudianteCurso estudianteCurso;

    private String retroalimentacion;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Float getNota() {
        return nota;
    }

    public void setNota(Float nota) {
        this.nota = nota;
    }

    public String getRetroalimentacion() {
        return retroalimentacion;
    }

    public void setRetroalimentacion(String retroalimentacion) {
        this.retroalimentacion = retroalimentacion;
    }

    public EstudianteCurso getEstudianteCurso() {
        return estudianteCurso;
    }

    public void setEstudianteCurso(EstudianteCurso estudianteCurso) {
        this.estudianteCurso = estudianteCurso;
    }
}
