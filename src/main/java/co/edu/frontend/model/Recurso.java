package co.edu.frontend.model;

public class Recurso {
    private Long id;
    private String nombre;
    private String ubicacion;
    private String estadoMateria;
    private Integer capacidad;
    private Integer dimensiones;
    private String tipo;
    private String estado;
    private Boolean esExamen;

    // getters y setters

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the ubicacion
     */
    public String getUbicacion() {
        return ubicacion;
    }

    /**
     * @param ubicacion the ubicacion to set
     */
    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    /**
     * @return the estadoMateria
     */
    public String getEstadoMateria() {
        return estadoMateria;
    }

    /**
     * @param estadoMateria the estadoMateria to set
     */
    public void setEstadoMateria(String estadoMateria) {
        this.estadoMateria = estadoMateria;
    }

    /**
     * @return the capacidad
     */
    public Integer getCapacidad() {
        return capacidad;
    }

    /**
     * @param capacidad the capacidad to set
     */
    public void setCapacidad(Integer capacidad) {
        this.capacidad = capacidad;
    }

    /**
     * @return the dimensiones
     */
    public Integer getDimensiones() {
        return dimensiones;
    }

    /**
     * @param dimensiones the dimensiones to set
     */
    public void setDimensiones(Integer dimensiones) {
        this.dimensiones = dimensiones;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return the esExamen
     */
    public Boolean getEsExamen() {
        return esExamen;
    }

    /**
     * @param esExamen the esExamen to set
     */
    public void setEsExamen(Boolean esExamen) {
        this.esExamen = esExamen;
    }
}
