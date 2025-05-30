<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/admin-styles.css" rel="stylesheet">
    <title>Listado de Programas</title>
</head>
<body class="programas">
<nav>
    <h2>Admin Panel</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/docentes">Docentes</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/estudiantes">Estudiantes</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/foros">Foros</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/personas">Personas</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/admin/programas">Programas</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/semestres">Semestres</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/mensajes">mensajes</a></li>
        <li><a href="http://localhost:3000/admin/cursos">Cursos</a></li>
    </ul>
</nav>

<div id="contenido">
    <div class="header-section">
        <div class="header-content">
            <h1 class="page-title">
                <i class="fas fa-graduation-cap"></i>
                Gesti�n de Programas Acad�micos
            </h1>
            <p class="page-subtitle">Administra todos los programas acad�micos de la instituci�n</p>
        </div>
    </div>

    <div class="main-content">
        <div class="action-bar">
            <div class="stats-info">
                <i class="fas fa-book"></i>
                Total de programas registrados: <strong>${programas.size()}</strong>
            </div>
            <a href="${pageContext.request.contextPath}/admin/programas/nuevo" class="btn-nuevo">
                <i class="fas fa-plus"></i>
                Crear Nuevo Programa
            </a>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th><i class="fas fa-hashtag me-2"></i>ID</th>
                    <th><i class="fas fa-book me-2"></i>Nombre</th>
                    <th><i class="fas fa-barcode me-2"></i>C�digo</th>
                    <th><i class="fas fa-award me-2"></i>Acreditado</th>
                    <th><i class="fas fa-university me-2"></i>Facultad</th>
                    <th><i class="fas fa-cogs me-2"></i>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty programas}">
                        <tr>
                            <td colspan="6" class="empty-state">
                                <i class="fas fa-graduation-cap"></i>
                                <h5>No hay programas registrados</h5>
                                <p>Comienza agregando el primer programa acad�mico</p>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${programas}" var="prog">
                            <tr>
                                <td><span class="id-badge">#${prog.id}</span></td>
                                <td><span class="programa-info"><i class="fas fa-book me-1"></i>${prog.nombre}</span></td>
                                <td><span class="codigo-badge">${prog.codigo}</span></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${prog.acreditado}">
                                                        <span class="badge bg-success">
                                                            <i class="fas fa-check me-1"></i>Acreditado
                                                        </span>
                                        </c:when>
                                        <c:otherwise>
                                                        <span class="badge bg-warning">
                                                            <i class="fas fa-clock me-1"></i>Sin Acreditar
                                                        </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><span class="facultad-info"><i class="fas fa-university me-1"></i>${prog.facultad}</span></td>
                                <td>
                                    <a class="btn-editar" href="${pageContext.request.contextPath}/admin/programas/${prog.id}/editar">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                    <form action="${pageContext.request.contextPath}/admin/programas/${prog.id}/eliminar" method="post" style="display:inline">
                                        <button type="submit" class="btn-eliminar" onclick="return confirm('�Est�s seguro de que deseas eliminar este programa?');">
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