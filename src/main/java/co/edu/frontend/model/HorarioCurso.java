package co.edu.frontend.model; // O tu paquete de modelos del frontend

import java.time.LocalTime;
// import com.fasterxml.jackson.annotation.JsonFormat; // Si necesitas formateo especial de hora

public class HorarioCurso {
    private Long id;
    private String dia; // Asumiendo que tienes un Enum DiaSemana en el frontend también
    // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss") // O HH:mm si no necesitas segundos
    private LocalTime horaInicio;
    // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
    private LocalTime horaFin;
    private Aula aula;     // Necesitas un modelo Aula.java en el frontend
    private Curso curso;    // Necesitas un modelo Curso.java en el frontend

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getDia() { return dia; }
    public void setDia(String dia) { this.dia = dia; }
    public LocalTime getHoraInicio() { return horaInicio; }
    public void setHoraInicio(LocalTime horaInicio) { this.horaInicio = horaInicio; }
    public LocalTime getHoraFin() { return horaFin; }
    public void setHoraFin(LocalTime horaFin) { this.horaFin = horaFin; }
    public Aula getAula() { return aula; }
    public void setAula(Aula aula) { this.aula = aula; }
    public Curso getCurso() { return curso; }
    public void setCurso(Curso curso) { this.curso = curso; }
}