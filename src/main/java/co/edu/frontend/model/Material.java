package co.edu.frontend.model;

public class Material {
    private Long id;
    private String nombre;
    private String tipo;    // Didáctico, Tecnologico, Mobiliario, Laboratorio, Deportivo
    private String estado;  // Disponible, Reservado, Mantenimiento, Explotao

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
}