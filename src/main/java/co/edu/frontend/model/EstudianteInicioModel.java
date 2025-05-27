package co.edu.frontend.model; // O una ubicación similar para tus modelos/DTOs

public class EstudianteInicioModel {

    private String sessionUserName;
    private String sessionUserRol;

    private String cardFullName;
    private String cardCc;
    private String cardCode;
    private String cardGsRh;

    private String personalTelefono;
    private String personalFechaNacimiento;
    private String personalEdad;
    private String personalCorreoElectronico;
    private String personalCorreoInstitucional;
    private String personalDireccion;
    private String personalSexo;
    private String personalTelefonoAlterno;


    private String academicPrograma;
    private String academicCreditosAprobados;
    private String academicPromedioPonderado;
    private String academicSemestreActual;
    private String academicEstado;
    private String academicFechaIngreso;
    private String academicPorcentajeAvance;

    private String pageTitle;

    public String getSessionUserName() { return sessionUserName; }
    public void setSessionUserName(String sessionUserName) { this.sessionUserName = sessionUserName; }
    public String getSessionUserRol() { return sessionUserRol; }
    public void setSessionUserRol(String sessionUserRol) { this.sessionUserRol = sessionUserRol; }
    public String getCardFullName() { return cardFullName; }
    public void setCardFullName(String cardFullName) { this.cardFullName = cardFullName; }

}
