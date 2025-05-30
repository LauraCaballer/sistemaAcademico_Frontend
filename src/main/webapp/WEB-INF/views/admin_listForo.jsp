<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="http://localhost:3000/css/admin-styles.css" rel="stylesheet">
    <title>Administrar Foros</title>
</head>
<body>
<h1>Listado de Foros</h1>
<a href="http://localhost:3000/admin/foros/nuevo">Nuevo Foro</a>
<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>ID</th>
            <th>Tema</th>
            <th>Descripci�n</th>
            <th>Fecha Creaci�n</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
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
        <c:forEach var="f" items="${foros}">
            <tr>
                <td>${f.id}</td>
                <td>${f.tema}</td>
                <td>${f.descripcion}</td>
                <td>${f.fechaCreacion}</td>
                <td>
                    <a href="http://localhost:3000/admin/foros/${f.id}/editar">Editar</a>
                    |
                    <form action="http://localhost:3000/admin/foros/${f.id}/eliminar"
                          method="post" style="display:inline">
                        <button type="submit"
                                onclick="return confirm('�Eliminar este foro?');">
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
