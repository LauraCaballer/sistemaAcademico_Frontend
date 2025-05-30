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
                      http://localhost:3000/admin/programas/${programa.id}
                  </c:when>
                  <c:otherwise>
                      http://localhost:3000/admin/programas
                  </c:otherwise>
              </c:choose>"
              method="post">

            <label>Nombre:</label><br/>
            <input type="text" name="nombre" value="${programa.nombre}" required/><br/><br/>

            <label>C�digo:</label><br/>
            <input type="number" name="codigo" value="${programa.codigo}" required/><br/><br/>

            <label>Acreditado:</label><br/>

            <select name="acreditado" required>
                <option value="true"  <c:if test="${programa.acreditado}">selected</c:if>>S�</option>
                <option value="false" <c:if test="${!programa.acreditado}">selected</c:if>>No</option>
                </select>
                <br/><br/>

                <label>Facultad:</label><br/>
                <input type="text" name="facultad" value="${programa.facultad}" required/><br/><br/>

            <button type="submit">Guardar</button>
            <a href="http://localhost:3000/admin/programas">Cancelar</a>
        </form>
    </body>
</html>
