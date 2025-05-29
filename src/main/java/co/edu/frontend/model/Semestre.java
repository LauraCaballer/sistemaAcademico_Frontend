// src/main/java/co/edu/frontend/model/Semestre.java
package co.edu.frontend.model;

public class Semestre {
    private Long id;

    // Lo tratamos como String plano
    private String fechaInicio;
    private String fechaFin;

    private Integer anio;
    private Integer periodo;

    // Getters y setters

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }
    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }
    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Integer getAnio() {
        return anio;
    }
    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    public Integer getPeriodo() {
        return periodo;
    }
    public void setPeriodo(Integer periodo) {
        this.periodo = periodo;
    }
}
