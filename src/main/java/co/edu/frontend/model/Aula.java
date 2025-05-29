package co.edu.frontend.model;

public class Aula {
    private Long id;
    private Integer capacidad;
    private String ubicacion;
    private Integer dimensiones;
    private String tipo;    // Teórica, Práctica, Multimedia, Laboratorio
    private String estado;  // Disponible, Reservado, Mantenimiento, Explotao
    private Boolean esExamen;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Integer getCapacidad() { return capacidad; }
    public void setCapacidad(Integer capacidad) { this.capacidad = capacidad; }

    public String getUbicacion() { return ubicacion; }
    public void setUbicacion(String ubicacion) { this.ubicacion = ubicacion; }

    public Integer getDimensiones() { return dimensiones; }
    public void setDimensiones(Integer dimensiones) { this.dimensiones = dimensiones; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public Boolean getEsExamen() { return esExamen; }
    public void setEsExamen(Boolean esExamen) { this.esExamen = esExamen; }
}