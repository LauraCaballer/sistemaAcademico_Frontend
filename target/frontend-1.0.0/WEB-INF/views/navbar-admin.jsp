<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
            </ul>
        </nav>
        <div id="contenido">
            <div class="welcome">
                <h1>Bienvenido al Panel de Administración</h1>
                <p>Selecciona una opción del menú lateral para comenzar.</p>
            </div>
        </div>
    </body>
</html>