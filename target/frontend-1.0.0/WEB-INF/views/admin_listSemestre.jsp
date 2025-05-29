<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Administrar Semestres</title>
</head>
<body>
<h1>Listado de Semestres</h1>
<a href="${pageContext.request.contextPath}/admin/semestres/nuevo">Nuevo Semestre</a>
<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>ID</th>
            <th>Inicio</th>
            <th>Fin</th>
            <th>Año</th>
            <th>Periodo</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="s" items="${semestres}">
            <tr>
                <td>${s.id}</td>
                <td>${s.fechaInicio}</td>
                <td>${s.fechaFin}</td>
                <td>${s.anio}</td>
                <td>${s.periodo}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/semestres/${s.id}/editar">Editar</a>
                    |
                    <form action="${pageContext.request.contextPath}/admin/semestres/${s.id}/eliminar"
                          method="post" style="display:inline">
                        <button type="submit" onclick="return confirm('¿Eliminar este semestre?');">
                            Eliminar
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
