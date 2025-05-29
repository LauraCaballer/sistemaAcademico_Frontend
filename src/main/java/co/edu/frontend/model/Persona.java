package co.edu.frontend.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.time.OffsetDateTime;

public class Persona {
    private Long id;
    private Long cedula;
    private String nombre;
    private Long telefono;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX")
    private OffsetDateTime fechaNacimiento;

    private String correoElectronico;
    private String correoInstitucional;
    private String direccion;
    private String sexo;

    // Getters & Setters

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getCedula() { return cedula; }
    public void setCedula(Long cedula) { this.cedula = cedula; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public Long getTelefono() { return telefono; }
    public void setTelefono(Long telefono) { this.telefono = telefono; }

    public OffsetDateTime getFechaNacimiento() { return fechaNacimiento; }
    public void setFechaNacimiento(OffsetDateTime fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getCorreoElectronico() { return correoElectronico; }
    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getCorreoInstitucional() { return correoInstitucional; }
    public void setCorreoInstitucional(String correoInstitucional) {
        this.correoInstitucional = correoInstitucional;
    }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getSexo() { return sexo; }
    public void setSexo(String sexo) { this.sexo = sexo; }
}

