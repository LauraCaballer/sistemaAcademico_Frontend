<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Administrar Foros</title>
</head>
<body>
<h1>Listado de Foros</h1>
<a href="${pageContext.request.contextPath}/admin/foros/nuevo">Nuevo Foro</a>
<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>ID</th>
            <th>Tema</th>
            <th>Descripción</th>
            <th>Fecha Creación</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="f" items="${foros}">
            <tr>
                <td>${f.id}</td>
                <td>${f.tema}</td>
                <td>${f.descripcion}</td>
                <td>${f.fechaCreacion}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/foros/${f.id}/editar">Editar</a>
                    |
                    <form action="${pageContext.request.contextPath}/admin/foros/${f.id}/eliminar"
                          method="post" style="display:inline">
                        <button type="submit"
                                onclick="return confirm('¿Eliminar este foro?');">
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
