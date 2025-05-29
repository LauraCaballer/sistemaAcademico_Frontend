<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- Necesario para formatear el número --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial Académico del Estudiante</title>
    <link rel="stylesheet" href="<c:url value='/css/historial_estudiante.css' />" />
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; }
        .sidebar { width: 250px; background-color: #f4f4f4; padding: 15px; height: 100vh; position: fixed; /* Para que no se mueva con el scroll */ top: 0; left: 0; overflow-y: auto; /* Scroll si el contenido es mucho */ }
        .main-content { flex-grow: 1; padding: 20px; margin-left: 250px; /* Espacio para el sidebar fijo */ }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 0.9em; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #e9ecef; color: #495057; }
        tr:nth-child(even) { background-color: #f8f9fa; }
        .estado-APROBADO { color: green; font-weight: bold; } /* Ajustado para coincidir con valores comunes de estado */
        .estado-REPROBADO { color: red; font-weight: bold; }
        .estado-CURSANDO { color: blue; }
        .estado-CANCELADO { color: orange; }
        .summary-section { margin-top: 30px; padding: 15px; border: 1px solid #007bff; background-color: #e7f3ff; border-radius: 5px; }
        .summary-section h4 { margin-top: 0; color: #0056b3; }
    </style>
</head>
<body>
<div class="sidebar">
    <h4>NAVEGACIÓN PRINCIPAL</h4>
    <ul>
        <li>Información Estudiantil
            <ul>
                <li><a href="<c:url value='/estudiante/informacion'/>">Datos Personales</a></li>
            </ul>
        </li>
        <li>Información Académica
            <ul>
                <li><a href="<c:url value='/estudiante/historial'/>" style="font-weight:bold;">Historial Académico</a></li>
                <li><a href="#">Materias</a></li>
                <li><a href="#">Horario</a></li>
                <li><a href="#">Notas</a></li>
                <li><a href="#">Pensum</a></li>
            </ul>
        </li>
        <li><a href="<c:url value='/logout'/>" class="logout-button">Cerrar sesión</a></li>
    </ul>
</div>

<div class="main-content">
    <h3>Historial Académico</h3>

    <c:if test="${not empty error}">
        <p style="color:red; border: 1px solid red; padding: 10px; background-color: #ffebeb;">
            <strong>Error:</strong> <c:out value="${error}"/>
        </p>
    </c:if>

    <c:if test="${empty error}">
        <c:choose>
            <c:when test="${not empty historialCursos}">
                <table>
                    <thead>
                    <tr>
                        <th>Código Asignatura</th>
                        <th>Nombre Asignatura</th>
                        <th>Semestre (Curso)</th>
                        <th>Grupo</th>
                        <th>Modalidad</th>
                        <th>Jornada</th>
                        <th>Estado</th>
                        <th>¿Vacacional?</th>
                        <th>Definitiva</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ec" items="${historialCursos}">
                        <tr>
                            <td><c:out value="${ec.curso.asignatura.codigo}"/></td>
                            <td><c:out value="${ec.curso.asignatura.nombre}"/></td>
                            <td>
                                <c:out value="${ec.curso.semestre.periodo}"/>-<c:out value="${ec.curso.semestre.anio}"/>
                            </td>
                            <td><c:out value="${ec.curso.grupo}"/></td>
                            <td><c:out value="${ec.curso.modalidad}"/></td>
                            <td><c:out value="${ec.curso.jornada}"/></td>
                                <%-- Asegúrate que el valor de ec.estado coincida con los nombres de las clases CSS --%>
                                <%-- Ej: si ec.estado es "APROBADO", la clase será "estado-APROBADO" --%>
                            <td class="estado-${fn:toUpperCase(ec.estado)}"><c:out value="${ec.estado}"/></td>
                            <td><c:out value="${ec.curso.vacacional ? 'Sí' : 'No'}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty ec.definitiva}">
                                        <fmt:formatNumber value="${ec.definitiva}" type="number" minFractionDigits="1" maxFractionDigits="2"/>
                                    </c:when>
                                    <c:otherwise>
                                        N/A
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <c:if test="${not empty promedioPonderadoAcumulado}">
                    <div class="summary-section">
                        <h4>Promedio Ponderado Acumulado:
                            <fmt:formatNumber value="${promedioPonderadoAcumulado}" type="number" minFractionDigits="2" maxFractionDigits="3"/>
                        </h4>
                    </div>
                </c:if>

            </c:when>
            <c:otherwise>
                <p>No se encontraron cursos en el historial académico.</p>
            </c:otherwise>
        </c:choose>
    </c:if>
    <div style="margin-top:20px;">
        <a href="<c:url value='/estudiante/informacion'/>" class="action-button" style="text-decoration:none; background-color: #6c757d; color: white; padding: 10px 15px; border-radius: 4px;">Volver a Información</a>
    </div>
</div>
</body>
</html>