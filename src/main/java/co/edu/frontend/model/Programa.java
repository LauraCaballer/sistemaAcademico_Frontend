// src/main/java/co/edu/frontend/model/Programa.java
package co.edu.frontend.model;

public class Programa {
    private Long id;
    private String nombre;
    private Integer codigo;
    private Boolean acreditado;
    private String facultad;

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

    public Integer getCodigo() {
        return codigo;
    }
    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Boolean getAcreditado() {
        return acreditado;
    }
    public void setAcreditado(Boolean acreditado) {
        this.acreditado = acreditado;
    }

    public String getFacultad() {
        return facultad;
    }
    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }
}
