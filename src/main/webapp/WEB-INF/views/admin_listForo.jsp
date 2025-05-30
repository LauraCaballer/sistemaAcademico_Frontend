<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/admin-styles.css" rel="stylesheet">
    <title>Listado de Foros</title>
</head>
<body class="foros">
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
                <i class="fas fa-comments"></i>
                Gesti�n de Foros
            </h1>
            <p class="page-subtitle">Administra y supervisa todos los foros de discusi�n</p>
        </div>
    </div>

    <div class="main-content">
        <div class="action-bar">
            <div class="stats-info">
                <i class="fas fa-comments"></i>
                Total de foros registrados: <strong>${foros.size()}</strong>
            </div>
            <a href="${pageContext.request.contextPath}/admin/foros/nuevo" class="btn-nuevo">
                <i class="fas fa-plus"></i>
                Crear Nuevo Foro
            </a>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th><i class="fas fa-hashtag me-2"></i>ID</th>
                    <th><i class="fas fa-tag me-2"></i>Tema</th>
                    <th><i class="fas fa-align-left me-2"></i>Descripci�n</th>
                    <th><i class="fas fa-calendar me-2"></i>Fecha Creaci�n</th>
                    <th><i class="fas fa-cogs me-2"></i>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty foros}">
                        <tr>
                            <td colspan="5" class="empty-state">
                                <i class="fas fa-comments"></i>
                                <h5>No hay foros registrados</h5>
                                <p>Comienza creando el primer foro de discusi�n</p>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${foros}" var="f">
                            <tr>
                                <td><span class="id-badge">#${f.id}</span></td>
                                <td><span class="tema-info"><i class="fas fa-tag me-1"></i>${f.tema}</span></td>
                                <td><span class="descripcion-text">${f.descripcion}</span></td>
                                <td><span class="fecha-badge">${f.fechaCreacion}</span></td>
                                <td>
                                    <a class="btn-editar" href="${pageContext.request.contextPath}/admin/foros/${f.id}/editar">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                    <form action="${pageContext.request.contextPath}/admin/foros/${f.id}/eliminar" method="post" style="display:inline">
                                        <button type="submit" class="btn-eliminar" onclick="return confirm('�Est�s seguro de que deseas eliminar este foro?');">
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