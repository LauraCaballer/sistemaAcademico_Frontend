/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.frontend.model;

public class Pensum {
    private Long id;
    private String nombre;
    private int creditosTotales;
    private Programa programa;
    private int duracion;
    private int anio;

    // Getters y setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getCreditosTotales() { return creditosTotales; }
    public void setCreditosTotales(int creditosTotales) { this.creditosTotales = creditosTotales; }

    public Programa getPrograma() { return programa; }
    public void setPrograma(Programa programa) { this.programa = programa; }

    public int getDuracion() { return duracion; }
    public void setDuracion(int duracion) { this.duracion = duracion; }

    public int getAnio() { return anio; }
    public void setAnio(int anio) { this.anio = anio; }
}
