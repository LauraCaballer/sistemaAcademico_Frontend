<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${foro.id != null}">Editar Foro</c:when>
            <c:otherwise>Nuevo Foro</c:otherwise>
        </c:choose>
    </title>
</head>
<body>
<h1>
    <c:choose>
        <c:when test="${foro.id != null}">Editar Foro</c:when>
        <c:otherwise>Nuevo Foro</c:otherwise>
    </c:choose>
</h1>

<form action="<c:choose>
        <c:when test='${foro.id != null}'>
            ${pageContext.request.contextPath}/admin/foros/${foro.id}
        </c:when>
        <c:otherwise>
            ${pageContext.request.contextPath}/admin/foros
        </c:otherwise>
    </c:choose>"
      method="post">

    <label>Tema:</label><br/>
    <input type="text" name="tema" value="${foro.tema}" required/><br/><br/>

    <label>Descripción:</label><br/>
    <textarea name="descripcion" rows="4" cols="50" required>${foro.descripcion}</textarea>
    <br/><br/>

    <label>Fecha Creación:</label><br/>
    <input type="datetime-local"
           name="fechaCreacion"
           value="${foro.fechaCreacion != null ? foro.fechaCreacion.toString().replace('Z','') : ''}"
           required/>
    <br/><br/>

    <button type="submit">Guardar</button>
    <a href="${pageContext.request.contextPath}/admin/foros">Cancelar</a>
</form>
</body>
</html>
