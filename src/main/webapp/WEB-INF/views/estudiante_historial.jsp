<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial Académico del Estudiante</title>
    <link rel="stylesheet" href="<c:url value='/css/historial_estudiante.css' />" /> <%-- Reutiliza o crea estilos --%>
    <%-- Puedes incluir Bootstrap u otro framework CSS para un mejor diseño --%>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; }
        .sidebar { width: 250px; background-color: #f4f4f4; padding: 15px; height: 100vh; /* Considere position: fixed si es necesario */ }
        .main-content { flex-grow: 1; padding: 20px; margin-left: 250px; /* Si el sidebar es fixed o absolute */ }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 0.9em; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #e9ecef; color: #495057; }
        tr:nth-child(even) { background-color: #f8f9fa; }
        .estado-Aprobado { color: green; font-weight: bold; }
        .estado-Reprobado { color: red; font-weight: bold; }
        .estado-Cursando { color: blue; }
        .estado-Cancelado { color: orange; }
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
                <li><a href="#">Materias</a></li> <%-- Enlaces futuros --%>
                <li><a href="#">Horario</a></li>
                <li><a href="#">Notas</a></li>
                <li><a href="#">Pensum</a></li>
            </ul>
        </li>
        <%-- Más elementos del menú --%>
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
                            <td class="estado-${ec.estado}"><c:out value="${ec.estado}"/></td>
                            <td><c:out value="${ec.curso.vacacional ? 'Sí' : 'No'}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>No se encontraron cursos en el historial académico.</p>
            </c:otherwise>
        </c:choose>
    </c:if>
    <div style="margin-top:20px;">
        <a href="<c:url value='/estudiante/informacion'/>" class="action-button" style="text-decoration:none; background-color: #6c757d;">Volver a Información</a>
    </div>
</div>
</body>
</html>