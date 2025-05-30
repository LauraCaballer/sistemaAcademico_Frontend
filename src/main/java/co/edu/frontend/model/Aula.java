package co.edu.frontend.model;

public class Aula {
    private Integer id;
    private Integer capacidad;
    private Integer dimensiones;
    private String tipo;
    private String estado;
    private Boolean esExamen;

    // getters y setters

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
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
