<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Administrar Programas</title>
</head>
<body>
<h1>Listado de Programas</h1>
<a href="${pageContext.request.contextPath}/admin/programas/nuevo">Nuevo Programa</a>
<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Código</th>
            <th>Acreditado</th>
            <th>Facultad</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="prog" items="${programas}">
            <tr>
                <td>${prog.id}</td>
                <td>${prog.nombre}</td>
                <td>${prog.codigo}</td>
                <td><c:out value="${prog.acreditado ? 'Sí' : 'No'}"/></td>
                <td>${prog.facultad}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/programas/${prog.id}/editar">Editar</a>
                    |
                    <form action="${pageContext.request.contextPath}/admin/programas/${prog.id}/eliminar"
                          method="post" style="display:inline">
                        <button type="submit" onclick="return confirm('¿Eliminar este programa?');">
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
