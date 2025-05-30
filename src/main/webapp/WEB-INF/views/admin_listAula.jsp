<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Listado de Aulas</title></head>
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
<h2>Listado de Aulas</h2>
<a href="${pageContext.request.contextPath}/admin/aulas/nuevo">Nueva Aula</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Capacidad</th>
        <th>Ubicaci�n</th>
        <th>Dimensiones</th>
        <th>Tipo</th>
        <th>Estado</th>
        <th>Es Examen</th>
        <th>Acciones</th>
    </tr>
    <c:forEach var="a" items="${aulas}">
        <tr>
            <td><c:out value="${a.id}"/></td>
            <td><c:out value="${a.capacidad}"/></td>
            <td><c:out value="${a.ubicacion}" default="-"/></td>
            <td><c:out value="${a.dimensiones}"/></td>
            <td><c:out value="${a.tipo}"/></td>
            <td><c:out value="${a.estado}"/></td>
            <td><c:out value="${a.esExamen ? 'S�' : 'No'}"/></td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/aulas/${a.id}/editar">Editar</a>
                <form action="${pageContext.request.contextPath}/admin/aulas/${a.id}/eliminar" method="post" style="display:inline">
                    <button type="submit">Eliminar</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>