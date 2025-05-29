<!-- ============================================================
     ADMIN_LISTESTUDIANTE.JSP - SIMPLIFICADO
     ============================================================ -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/admin-styles.css" rel="stylesheet">
        <title>Listado de Estudiantes</title>
    </head>
    <body class="estudiantes">
        <nav>
            <h2>Admin Panel</h2>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/docentes">Docentes</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/admin/estudiantes">Estudiantes</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/foros">Foros</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/personas">Personas</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/programas">Programas</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/semestres">Semestres</a></li>
            </ul>
        </nav>
        
        <div id="contenido">
            <div class="header-section">
                <div class="header-content">
                    <h1 class="page-title">
                        <i class="fas fa-graduation-cap"></i>
                        Gestión de Estudiantes
                    </h1>
                    <p class="page-subtitle">Administra y supervisa la información de todos los estudiantes</p>
                </div>
            </div>
            
            <div class="main-content">
                <div class="action-bar">
                    <div class="stats-info">
                        <i class="fas fa-users"></i>
                        Total de estudiantes registrados: <strong>${estudiantes.size()}</strong>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/estudiantes/nuevo" class="btn-nuevo">
                        <i class="fas fa-plus"></i>
                        Crear Nuevo Estudiante
                    </a>
                </div>

                <div class="table-container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-hashtag me-2"></i>ID</th>
                                <th><i class="fas fa-barcode me-2"></i>Código</th>
                                <th><i class="fas fa-graduation-cap me-2"></i>Programa</th>
                                <th><i class="fas fa-user me-2"></i>Persona</th>
                                <th><i class="fas fa-desktop me-2"></i>Modalidad</th>
                                <th><i class="fas fa-clock me-2"></i>Jornada</th>
                                <th><i class="fas fa-cogs me-2"></i>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty estudiantes}">
                                    <tr>
                                        <td colspan="7" class="empty-state">
                                            <i class="fas fa-user-graduate"></i>
                                            <h5>No hay estudiantes registrados</h5>
                                            <p>Comienza agregando el primer estudiante al sistema</p>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${estudiantes}" var="e">
                                        <tr>
                                            <td><span class="id-badge">#${e.id}</span></td>
                                            <td><span class="codigo-badge">${e.codigoEstudiante}</span></td>
                                            <td><span class="programa-info"><i class="fas fa-graduation-cap me-1"></i>${e.programa.nombre}</span></td>
                                            <td><span class="persona-info"><i class="fas fa-user-circle me-1"></i>${e.persona.nombre}</span></td>
                                            <td><span class="badge bg-info">${e.modalidad}</span></td>
                                            <td><span class="badge bg-secondary">${e.jornada}</span></td>
                                            <td>
                                                <a class="btn-editar" href="${pageContext.request.contextPath}/admin/estudiantes/${e.id}/editar">
                                                    <i class="fas fa-edit"></i> Editar
                                                </a>
                                                <form action="${pageContext.request.contextPath}/admin/estudiantes/${e.id}/eliminar" method="post" style="display:inline">
                                                    <button type="submit" class="btn-eliminar" onclick="return confirm('¿Estás seguro de que deseas eliminar este estudiante?');">
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