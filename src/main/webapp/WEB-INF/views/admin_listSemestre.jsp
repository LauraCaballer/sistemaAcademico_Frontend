<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/admin-styles.css" rel="stylesheet">
    <title>Listado de Semestres</title>
</head>
<body class="semestres">
<nav>
    <h2>Admin Panel</h2>
    <ul>
        <li><a href="http://localhost:3000/admin/docentes">Docentes</a></li>
        <li class="active"><a href="http://localhost:3000/admin/estudiantes">Estudiantes</a></li>
        <li><a href="http://localhost:3000/admin/foros">Foros</a></li>
        <li><a href="http://localhost:3000/admin/personas">Personas</a></li>
        <li><a href="http://localhost:3000/admin/programas">Programas</a></li>
        <li><a href="http://localhost:3000/admin/semestres">Semestres</a></li>
    </ul>
</nav>

<div id="contenido">
    <div class="header-section">
        <div class="header-content">
            <h1 class="page-title">
                <i class="fas fa-calendar-alt"></i>
                Gesti�n de Semestres Acad�micos
            </h1>
            <p class="page-subtitle">Administra los per�odos acad�micos y calendario universitario</p>
        </div>
    </div>

    <div class="main-content">
        <div class="action-bar">
            <div class="stats-info">
                <i class="fas fa-calendar"></i>
                Total de semestres registrados: <strong>${semestres.size()}</strong>
            </div>
            <a href="${pageContext.request.contextPath}/admin/semestres/nuevo" class="btn-nuevo">
                <i class="fas fa-plus"></i>
                Crear Nuevo Semestre
            </a>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th><i class="fas fa-hashtag me-2"></i>ID</th>
                    <th><i class="fas fa-play me-2"></i>Fecha Inicio</th>
                    <th><i class="fas fa-stop me-2"></i>Fecha Fin</th>
                    <th><i class="fas fa-calendar-year me-2"></i>A�o</th>
                    <th><i class="fas fa-clock me-2"></i>Per�odo</th>
                    <th><i class="fas fa-cogs me-2"></i>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty semestres}">
                        <tr>
                            <td colspan="6" class="empty-state">
                                <i class="fas fa-calendar-alt"></i>
                                <h5>No hay semestres registrados</h5>
                                <p>Comienza agregando el primer per�odo acad�mico</p>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${semestres}" var="s">
                            <tr>
                                <td><span class="id-badge">#${s.id}</span></td>
                                <td><span class="fecha-badge"><i class="fas fa-calendar me-1"></i>${s.fechaInicio}</span></td>
                                <td><span class="fecha-badge"><i class="fas fa-calendar me-1"></i>${s.fechaFin}</span></td>
                                <td><span class="anio-badge">${s.anio}</span></td>
                                <td>
                                                <span class="periodo-badge badge bg-info">
                                                    <i class="fas fa-clock me-1"></i>${s.periodo}
                                                </span>
                                </td>
                                <td>
                                    <a class="btn-editar" href="${pageContext.request.contextPath}/admin/semestres/${s.id}/editar">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                    <form action="${pageContext.request.contextPath}/admin/semestres/${s.id}/eliminar" method="post" style="display:inline">
                                        <button type="submit" class="btn-eliminar" onclick="return confirm('�Est�s seguro de que deseas eliminar este semestre?');">
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