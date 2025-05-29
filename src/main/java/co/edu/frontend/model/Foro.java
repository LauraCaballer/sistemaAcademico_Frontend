// src/main/java/co/edu/frontend/model/Foro.java
package co.edu.frontend.model;

import java.time.OffsetDateTime;

public class Foro {
    private Long id;
    private String tema;
    private String descripcion;
    private OffsetDateTime fechaCreacion;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getTema() {
        return tema;
    }
    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public OffsetDateTime getFechaCreacion() {
        return fechaCreacion;
    }
    public void setFechaCreacion(OffsetDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}
