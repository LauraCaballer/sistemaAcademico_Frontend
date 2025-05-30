<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- Para formatear LocalTime si es necesario y posible --%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Mi Horario</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; }
    .sidebar { width: 250px; background-color: #f4f4f4; padding: 15px; height: 100vh; position: fixed; top: 0; left: 0; overflow-y: auto; }
    .main-content { flex-grow: 1; padding: 20px; margin-left: 250px; }
    .schedule-table { width: 100%; border-collapse: collapse; margin-top: 10px; font-size:0.9em; }
    .schedule-table th, .schedule-table td { border: 1px solid #ddd; padding: 8px; text-align: left; vertical-align: top; }
    .schedule-table th { background-color: #e9ecef; }
    .schedule-day-group { margin-bottom: 20px; }
    .schedule-day-group h4 { background-color: #f0f0f0; padding: 8px; border-top: 1px solid #ccc; margin-top:0; margin-bottom:0;}
    .error { color: red; border: 1px solid red; padding: 10px; background-color: #ffebeb; margin-bottom:15px;}
    .info { color: navy; border: 1px solid navy; padding: 10px; background-color: #e7f3ff; margin-bottom:15px;}
  </style>
</head>
<body>

<div class="main-content">
  <h3>Mi Horario Semanal</h3>
  <p>Estudiante: <strong><c:out value="${nombreEstudiante}"/></strong></p> <%-- Asegúrate de pasar nombreEstudiante desde el controlador --%>

  <c:if test="${not empty errorGlobal}"> <p class="error"><c:out value="${errorGlobal}"/></p> </c:if>
  <c:if test="${not empty errorHorario}"> <p class="error"><c:out value="${errorHorario}"/></p> </c:if>
  <c:if test="${not empty mensajeInfo}"> <p class="info"><c:out value="${mensajeInfo}"/></p> </c:if>

  <c:if test="${empty errorGlobal and empty errorHorario and empty mensajeInfo}">
    <c:choose>
      <c:when test="${not empty horarioAgrupado and not empty diasOrdenados}">
        <c:forEach var="diaStringKey" items="${diasOrdenados}"> <%-- Iterar sobre la lista de strings ordenados --%>
          <c:if test="${not empty horarioAgrupado[diaStringKey]}">
            <div class="schedule-day-group">
              <h4><c:out value="${diaStringKey}"/></h4>
              <table class="schedule-table">
                <thead>
                <tr>
                  <th>Hora Inicio</th>
                  <th>Hora Fin</th>
                  <th>Asignatura</th>
                  <th>Curso (Grupo)</th>
                  <th>Aula</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="h" items="${horarioAgrupado[diaStringKey]}">
                  <tr>
                      <%-- Para LocalTime, .toString() es lo más directo en JSTL estándar --%>
                      <%-- Ejemplo: "10:30" o "10:30:00" --%>
                    <td><c:out value="${h.horaInicio}"/></td>
                    <td><c:out value="${h.horaFin}"/></td>
                    <td><c:out value="${h.curso.asignatura.nombre}"/></td>
                    <td><c:out value="${h.curso.nombre}"/> (G<c:out value="${h.curso.grupo}"/>)</td>
                    <td><c:out value="${h.aula.nombre}"/></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </c:if>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <p class="info">No tienes un horario disponible para mostrar en este momento.</p>
      </c:otherwise>
    </c:choose>
  </c:if>
</div>
</body>
</html>