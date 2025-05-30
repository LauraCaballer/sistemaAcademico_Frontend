<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${semestre.id != null}">Editar Semestre</c:when>
            <c:otherwise>Nuevo Semestre</c:otherwise>
        </c:choose>
    </title>
</head>
<body>
<h1>
    <c:choose>
        <c:when test="${semestre.id != null}">Editar Semestre</c:when>
        <c:otherwise>Nuevo Semestre</c:otherwise>
    </c:choose>
</h1>

<form action="<c:choose>
        <c:when test='${semestre.id != null}'>
            http://localhost:3000/admin/semestres/${semestre.id}
        </c:when>
        <c:otherwise>
            http://localhost:3000/admin/semestres
        </c:otherwise>
    </c:choose>"
      method="post">

    <label>Fecha Inicio:</label><br/>
    <input type="text"
           name="fechaInicio"
           value="${semestre.fechaInicio != null ? semestre.fechaInicio : ''}"
           placeholder="yyyy-MM-dd HH:mm:ss"
           required/><br/><br/>

    <label>Fecha Fin:</label><br/>
    <input type="text"
           name="fechaFin"
           value="${semestre.fechaFin != null ? semestre.fechaFin : ''}"
           placeholder="yyyy-MM-dd HH:mm:ss"
           required/><br/><br/>

    <label>A�o:</label><br/>
    <input type="number" name="anio" value="${semestre.anio}" required/><br/><br/>

    <label>Periodo:</label><br/>
    <select name="periodo" required>
        <option value="1" <c:if test="${semestre.periodo == 1}">selected</c:if>>1</option>
        <option value="2" <c:if test="${semestre.periodo == 2}">selected</c:if>>2</option>
        <option value="0" <c:if test="${semestre.periodo == 0}">selected</c:if>>Especial</option>
    </select>
    <br/><br/>

    <button type="submit">Guardar</button>
    <a href="http://localhost:3000/admin/semestres">Cancelar</a>
</form>
</body>
</html>
