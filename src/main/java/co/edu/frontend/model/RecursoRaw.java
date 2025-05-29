package co.edu.frontend.model;

public class RecursoRaw {
    private Long id;

    // Campos comunes (unos nulos según tipo)
    private String nombre;
    private String ubicacion;
    private String estado;      // “Disponible”, “Reservado”, etc.
    private String tipo;        // “Laboratorio”, “Didáctico”, etc.
    private Boolean esExamen;

    // Campos de aula
    private Integer capacidad;
    private Integer dimensiones;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getUbicacion() { return ubicacion; }
    public void setUbicacion(String ubicacion) { this.ubicacion = ubicacion; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public Boolean getEsExamen() { return esExamen; }
    public void setEsExamen(Boolean esExamen) { this.esExamen = esExamen; }

    public Integer getCapacidad() { return capacidad; }
    public void setCapacidad(Integer capacidad) { this.capacidad = capacidad; }

    public Integer getDimensiones() { return dimensiones; }
    public void setDimensiones(Integer dimensiones) { this.dimensiones = dimensiones; }
}
