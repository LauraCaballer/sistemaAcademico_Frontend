<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Cursos Asignados - Docente</title>
    <link rel="stylesheet" href="<c:url value='/css/docente_cursos.css' />" />
</head>
<body>
<div class="sidebar">
    <h4>MENU DOCENTE</h4>
    <ul>
        <li>Información Docente
            <ul>
                <li><a href="<c:url value='/docente/informacion'/>">Datos Personales</a></li>
            </ul>
        </li>
        <li>Gestión Académica
            <ul>
                <li><a href="<c:url value='/docente/cursos'/>" style="font-weight:bold;">Mis Cursos</a></li>
                <li><a href="#">Calificaciones</a></li>
                <li><a href="#">Horarios</a></li>
                <li><a href="#">Asistencias</a></li>
            </ul>
        </li>
        <li><a href="<c:url value='/logout'/>" class="logout-button">Cerrar sesión</a></li>
    </ul>
</div>

<div class="main-content">
    <div class="header-section">
        <h3>Cursos Asignados</h3>
    </div>

    <c:if test="${not empty error}">
        <div class="error-message">
            <strong>Error:</strong> <c:out value="${error}"/>
        </div>
    </c:if>

    <c:choose>
        <c:when test="${not empty cursos}">
            <div class="table-container">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Grupo</th>
                        <th>Modalidad</th>
                        <th>Vacacional</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="curso" items="${cursos}">
                        <tr>
                            <td><c:out value="${curso.id}"/></td>
                            <td><c:out value="${curso.nombre}"/></td>
                            <td><c:out value="${curso.grupo}"/></td>
                            <td><c:out value="${curso.modalidad}"/></td>
                            <td><c:out value="${curso.vacacional ? 'Sí' : 'No'}"/></td>
                            <td>
                                <a href="<c:url value='/docente/curso/${curso.id}/estudiantes'/>" class="action-button">
                                    Ver Estudiantes
                                </a>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <div class="empty-state">
                <p>No tienes cursos asignados.</p>
            </div>
        </c:otherwise>
    </c:choose>

    <div style="margin-top: var(--spacing-lg);">
        <a href="<c:url value='/docente/informacion'/>" class="action-button">Volver a Información</a>
    </div>
</div>
</body>
</html>
