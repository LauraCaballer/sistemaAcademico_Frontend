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
    <link href="http://localhost:3000/css/admin_listAsignaturas.css" rel="stylesheet">
    <title>Listado de Asignaturas</title>
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
        <li><a href="http://localhost:3000/admin/mensajes">Mensajería</a></li>
        <li><a href="http://localhost:3000/admin/materiales">Informe Materiales</a></li>
        <li><a href="http://localhost:3000/admin/asignaturas" class="active">Asignaturas</a></li>
    </ul>
</nav>

<div id="contenido">
    <div class="header-section">
        <div class="header-content">
            <h1 class="page-title">
                <i class="fas fa-book-open"></i>
                Gestión de Asignaturas
            </h1>
            <p class="page-subtitle">Administra y supervisa todas las asignaturas académicas</p>
        </div>
    </div>

    <div class="main-content">
        <div class="action-bar">
            <div class="stats-info">
                <i class="fas fa-graduation-cap"></i>
                Total de asignaturas registradas: <strong>${asignaturas.size()}</strong>
            </div>
            <a href="${pageContext.request.contextPath}/admin/asignaturas/nuevo" class="btn-nuevo">
                <i class="fas fa-plus"></i>
                Crear Nueva Asignatura
            </a>
        </div>

        <div class="table-container">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                    <tr>
                        <th><i class="fas fa-hashtag me-2"></i>ID</th>
                        <th><i class="fas fa-code me-2"></i>Código</th>
                        <th><i class="fas fa-book me-2"></i>Nombre</th>
                        <th><i class="fas fa-calendar-alt me-2"></i>Semestre</th>
                        <th><i class="fas fa-star me-2"></i>Créditos</th>
                        <th><i class="fas fa-tag me-2"></i>Tipo</th>
                        <th><i class="fas fa-cogs me-2"></i>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty asignaturas}">
                            <tr>
                                <td colspan="7" class="empty-state">
                                    <i class="fas fa-book-open"></i>
                                    <h5>No hay asignaturas registradas</h5>
                                    <p>Comienza agregando la primera asignatura al sistema</p>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="a" items="${asignaturas}">
                                <tr>
                                    <td>
                                        <span class="id-badge">#${a.id}</span>
                                    </td>
                                    <td>
                                        <span class="codigo-badge">
                                            <c:out value="${a.codigo}"/>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="asignatura-info">
                                            <i class="fas fa-book me-1"></i>
                                            <c:out value="${a.nombre}"/>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="semestre-badge">
                                            Semestre <c:out value="${a.semestre}"/>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="creditos-badge">
                                            ${a.creditos} créditos
                                        </span>
                                    </td>
                                    <td>
                                        <span class="tipo-badge ${a.tipoAsignatura.toLowerCase() == 'obligatoria' ? 'tipo-obligatoria' : a.tipoAsignatura.toLowerCase() == 'electiva' ? 'tipo-electiva' : 'tipo-practica'}">
                                            <c:out value="${a.tipoAsignatura}"/>
                                        </span>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-editar"
                                           href="${pageContext.request.contextPath}/admin/asignaturas/${a.id}/editar">
                                            <i class="fas fa-edit me-1"></i>
                                            Editar
                                        </a>
                                        <form action="${pageContext.request.contextPath}/admin/asignaturas/${a.id}/eliminar"
                                              method="post"
                                              style="display:inline">
                                            <button type="submit"
                                                    class="btn btn-sm btn-eliminar"
                                                    onclick="return confirm('¿Estás seguro de que deseas eliminar esta asignatura?');">
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