<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="http://localhost:3000/css/admin_listMaterial.css" rel="stylesheet">
    <title>Listado de Materiales</title>

</head>
<body>
<nav>
    <h2>Admin Panel</h2>
    <ul>
        <li><a href="http://localhost:3000/admin/docentes">Docentes</a></li>
        <li><a href="http://localhost:3000/admin/estudiantes">Estudiantes</a></li>
        <li><a href="http://localhost:3000/admin/foros">Foros</a></li>
        <li><a href="http://localhost:3000/admin/personas">Personas</a></li>
        <li><a href="http://localhost:3000/admin/programas">Programas</a></li>
        <li><a href="http://localhost:3000/admin/semestres">Semestres</a></li>
        <li><a href="http://localhost:3000/admin/mensajes">mensajeria</a></li>
        <li><a href="http://localhost:3000/admin/materiales">Informe Materiales</a></li>
        <li><a href="http://localhost:3000/admin/asignaturas">Asignatura</a></li>

    </ul>
</nav>

<div id="contenido">
    <div class="header-section">
        <div class="header-content">
            <h1 class="page-title">
                <i class="fas fa-box"></i>
                Gestión de Materiales
            </h1>
            <p class="page-subtitle">Administra y supervisa todos los materiales educativos</p>
        </div>
    </div>

    <div class="main-content">
        <div class="action-bar">
            <div class="stats-info">
                <i class="fas fa-archive"></i>
                Total de materiales registrados: <strong>${materiales.size()}</strong>
            </div>
            <a href="${pageContext.request.contextPath}/admin/materiales/nuevo" class="btn-nuevo">
                <i class="fas fa-plus"></i>
                Crear Nuevo Material
            </a>
        </div>

        <div class="table-container">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr>
                        <th><i class="fas fa-hashtag me-2"></i>ID</th>
                        <th><i class="fas fa-tag me-2"></i>Nombre</th>
                        <th><i class="fas fa-layer-group me-2"></i>Tipo</th>
                        <th><i class="fas fa-toggle-on me-2"></i>Estado</th>
                        <th><i class="fas fa-cogs me-2"></i>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty materiales}">
                            <tr>
                                <td colspan="5" class="empty-state">
                                    <i class="fas fa-box-open"></i>
                                    <h5>No hay materiales registrados</h5>
                                    <p>Comienza agregando el primer material al sistema</p>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="m" items="${materiales}">
                                <tr>
                                    <td>
                                        <span class="id-badge">#${m.id}</span>
                                    </td>
                                    <td>
                                        <span class="material-info">
                                            <i class="fas fa-file-alt me-1"></i>
                                            <!-- Buscar el nombre del recurso correspondiente -->
                                            <c:set var="nombreRecurso" value="Sin nombre"/>
                                            <c:forEach var="r" items="${recursos}">
                                                <c:if test="${r.id == m.id}">
                                                    <c:set var="nombreRecurso" value="${r.nombre}"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:out value="${nombreRecurso}"/>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="tipo-badge">
                                            <c:out value="${m.tipo}"/>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="estado-badge ${m.estado.toLowerCase() == 'disponible' ? 'estado-activo' : 'estado-inactivo'}">
                                            <c:out value="${m.estado}"/>
                                        </span>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-editar"
                                           href="${pageContext.request.contextPath}/admin/materiales/${m.id}/editar">
                                            <i class="fas fa-edit me-1"></i>
                                            Editar
                                        </a>
                                        <form action="${pageContext.request.contextPath}/admin/materiales/${m.id}/eliminar"
                                              method="post"
                                              style="display:inline">
                                            <button type="submit"
                                                    class="btn btn-sm btn-eliminar"
                                                    onclick="return confirm('¿Estás seguro de que deseas eliminar este material?');">
                                                <i class="fas fa-trash me-1"></i>
                                                Eliminar
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
</div>
</body>
</html>