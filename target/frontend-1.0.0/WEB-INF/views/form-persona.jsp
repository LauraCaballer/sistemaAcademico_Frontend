<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>
        <c:choose>
            <c:when test="${not empty persona.id}">Editar Persona</c:when>
            <c:otherwise>Crear Persona</c:otherwise>
        </c:choose>
    </title>
    <link rel="stylesheet" href="" />
</head>
<body>
<header>
    <h1>Mi Sistema Académico</h1>
    <nav>
        <a href="<c:url value='/'/>">Home</a> |
        <a href="<c:url value='/admin/personas'/>">Personas</a> |
        <a href="<c:url value='/logout'/>">Cerrar sesión</a>
    </nav>
</header>

<main>
    <h2>
        <c:out value="${persona.id != null ? 'Editar Persona' : 'Crear Persona'}" />
    </h2>

    <c:choose>
        <c:when test="${not empty persona.id}">
            <c:url var="formAction" value="/admin/personas/${persona.id}" />
        </c:when>
        <c:otherwise>
            <c:url var="formAction" value="/admin/personas" />
        </c:otherwise>
    </c:choose>

    <form action="${formAction}" method="post">
        <label for="cedula">Cédula:</label>
        <input type="number" id="cedula" name="cedula"
               value="${persona.cedula}" required />

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre"
               value="${persona.nombre}" required />

        <label for="telefono">Teléfono:</label>
        <input type="number" id="telefono" name="telefono"
               value="${persona.telefono}" />

        <label for="fechaNacimiento">Fecha de Nacimiento:</label>
        <input type="date" id="fechaNacimiento" name="fechaNacimiento"
               value="${persona.fechaNacimiento}" />

        <label for="correoElectronico">Correo Electrónico:</label>
        <input type="email" id="correoElectronico" name="correoElectronico"
               value="${persona.correoElectronico}" />

        <label for="correoInstitucional">Correo Institucional:</label>
        <input type="email" id="correoInstitucional" name="correoInstitucional"
               value="${persona.correoInstitucional}" />

        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion"
               value="${persona.direccion}" />

        <label for="sexo">Sexo:</label>
        <select id="sexo" name="sexo">
            <option value="Femenino"
                    <c:if test="${persona.sexo == 'Femenino'}">selected</c:if>>
                Femenino
            </option>
            <option value="Masculino"
                    <c:if test="${persona.sexo == 'Masculino'}">selected</c:if>>
                Masculino
            </option>
        </select>

        <button type="submit">Guardar</button>
        <a href="<c:url value='/admin/personas'/>">Cancelar</a>
    </form>
</main>

<footer>
    <p>&copy; 2025 Universidad de Ejemplo</p>
</footer>
</body>
</html>
