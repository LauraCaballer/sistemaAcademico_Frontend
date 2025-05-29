<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title><c:choose>
                <c:when test="${programa.id != null}">Editar Programa</c:when>
                <c:otherwise>Nuevo Programa</c:otherwise>
            </c:choose></title>
    </head>
    <body>
        <h1>
            <c:choose>
                <c:when test="${programa.id != null}">Editar Programa</c:when>
                <c:otherwise>Nuevo Programa</c:otherwise>
            </c:choose>
        </h1>

        <form action="<c:choose>
                  <c:when test='${programa.id != null}'>
                      ${pageContext.request.contextPath}/admin/programas/${programa.id}
                  </c:when>
                  <c:otherwise>
                      ${pageContext.request.contextPath}/admin/programas
                  </c:otherwise>
              </c:choose>"
              method="post">

            <label>Nombre:</label><br/>
            <input type="text" name="nombre" value="${programa.nombre}" required/><br/><br/>

            <label>Código:</label><br/>
            <input type="number" name="codigo" value="${programa.codigo}" required/><br/><br/>

            <label>Acreditado:</label><br/>

            <select name="acreditado" required>
                <option value="true"  <c:if test="${programa.acreditado}">selected</c:if>>Sí</option>
                <option value="false" <c:if test="${!programa.acreditado}">selected</c:if>>No</option>
                </select>
                <br/><br/>

                <label>Facultad:</label><br/>
                <input type="text" name="facultad" value="${programa.facultad}" required/><br/><br/>

            <button type="submit">Guardar</button>
            <a href="${pageContext.request.contextPath}/admin/programas">Cancelar</a>
        </form>
    </body>
</html>
