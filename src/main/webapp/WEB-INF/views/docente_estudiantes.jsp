<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Estudiantes del Curso</title>
    <link rel="stylesheet" href="<c:url value='/css/docente_cursos.css' />" />
</head>
<body>
<div class="sidebar">
    <h4>MENU DOCENTE</h4>
    <ul>
        <li><a href="<c:url value='/docente/informacion'/>">Datos Personales</a></li>
        <li><a href="<c:url value='/docente/cursos'/>" style="font-weight:bold;">Mis Cursos</a></li>
        <li><a href="<c:url value='/logout'/>" class="logout-button">Cerrar sesión</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="header-section">
        <h3>Estudiantes del Curso</h3>
    </div>

    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>

    <c:choose>
        <c:when test="${not empty estudiantes}">
            <div class="table-container">
                <table>
                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Modalidad</th>
                        <th>Jornada</th>
                        <th>Estado</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ec" items="${estudiantes}">
                        <tr>
                            <td><c:out value="${ec.estudiante.persona.nombre}"/></td>
                            <td><c:out value="${ec.estudiante.persona.correoElectronico}"/></td>
                            <td><c:out value="${ec.estudiante.modalidad}"/></td>
                            <td><c:out value="${ec.estudiante.jornada}"/></td>
                            <td><c:out value="${ec.estado}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <div class="empty-state">No se encontraron estudiantes inscritos.</div>
        </c:otherwise>
    </c:choose>

    <div style="margin: 2rem;">
        <a href="<c:url value='/docente/cursos'/>" class="action-button">← Volver a Cursos</a>
    </div>
</div>
</body>
</html>
