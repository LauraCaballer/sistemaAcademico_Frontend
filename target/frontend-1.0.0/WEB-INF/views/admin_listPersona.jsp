<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/admin-styles.css" rel="stylesheet">
    <title>Listado de Personas</title>
</head>
<body class="personas">
<nav>
    <h2>Admin Panel</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/docentes">Docentes</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/estudiantes">Estudiantes</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/foros">Foros</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/admin/personas">Personas</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/programas">Programas</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/semestres">Semestres</a></li>
    </ul>
</nav>

<div id="contenido">
    <div class="header-section">
        <div class="header-content">
            <h1 class="page-title">
                <i class="fas fa-users"></i>
                Gestión de Personas
            </h1>
            <p class="page-subtitle">Administra la información personal de todos los usuarios del sistema</p>
        </div>
    </div>

    <div class="main-content">
        <div class="action-bar">
            <div class="stats-info">
                <i class="fas fa-users"></i>
                Total de personas registradas: <strong>${personas.size()}</strong>
            </div>
            <a href="${pageContext.request.contextPath}/admin/personas/nuevo" class="btn-nuevo">
                <i class="fas fa-plus"></i>
                Crear Nueva Persona
            </a>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th><i class="fas fa-hashtag me-2"></i>ID</th>
                    <th><i class="fas fa-id-card me-2"></i>Cédula</th>
                    <th><i class="fas fa-user me-2"></i>Nombre</th>
                    <th><i class="fas fa-phone me-2"></i>Teléfono</th>
                    <th><i class="fas fa-cogs me-2"></i>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty personas}">
                        <tr>
                            <td colspan="5" class="empty-state">
                                <i class="fas fa-users"></i>
                                <h5>No hay personas registradas</h5>
                                <p>Comienza agregando la primera persona al sistema</p>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${personas}" var="p">
                            <tr>
                                <td><span class="id-badge">#${p.id}</span></td>
                                <td><span class="cedula-badge">${p.cedula}</span></td>
                                <td><span class="persona-info"><i class="fas fa-user-circle me-1"></i><c:out value="${p.nombre}" /></span></td>
                                <td><span class="telefono-info"><i class="fas fa-phone me-1"></i><c:out value="${p.telefono}" /></span></td>
                                <td>
                                    <a class="btn-editar" href="${pageContext.request.contextPath}/admin/personas/${p.id}/editar">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                    <form action="${pageContext.request.contextPath}/admin/personas/${p.id}/eliminar" method="post" style="display:inline">
                                        <button type="submit" class="btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar a ${p.nombre}?');">
                                            <i class="fas fa-trash"></i> Eliminar
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>