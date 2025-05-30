<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- Necesario para formatear el número --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Historial Académico del Estudiante</title>
  <link rel="stylesheet" href="<c:url value='/css/historial_estudiante.css' />" />
  <style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; }
    .sidebar { width: 250px; background-color: #f4f4f4; padding: 15px; height: 100vh; position: fixed; /* Para que no se mueva con el scroll */ top: 0; left: 0; overflow-y: auto; /* Scroll si el contenido es mucho */ }
    .main-content { flex-grow: 1; padding: 20px; margin-left: 250px; /* Espacio para el sidebar fijo */ }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 0.9em; }
    th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
    th { background-color: #e9ecef; color: #495057; }
    tr:nth-child(even) { background-color: #f8f9fa; }
    .estado-APROBADO { color: green; font-weight: bold; } /* Ajustado para coincidir con valores comunes de estado */
    .estado-REPROBADO { color: red; font-weight: bold; }
    .estado-CURSANDO { color: blue; }
    .estado-CANCELADO { color: orange; }
    .summary-section { margin-top: 30px; padding: 15px; border: 1px solid #007bff; background-color: #e7f3ff; border-radius: 5px; }
    .summary-section h4 { margin-top: 0; color: #0056b3; }

    /* Estilos para el botón de retroalimentación */
    .feedback-btn {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 5px 10px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 0.8em;
      transition: background-color 0.3s;
    }
    .feedback-btn:hover {
      background-color: #0056b3;
    }
    .feedback-btn:disabled {
      background-color: #6c757d;
      cursor: not-allowed;
    }

    /* Estilos para el modal */
    .modal {
      display: none;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.5);
    }
    .modal-content {
      background-color: #fefefe;
      margin: 10% auto;
      padding: 20px;
      border: none;
      border-radius: 8px;
      width: 60%;
      max-width: 600px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      position: relative;
    }
    .modal-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    .modal-header h4 {
      margin: 0;
      color: #333;
    }
    .close {
      color: #aaa;
      font-size: 28px;
      font-weight: bold;
      cursor: pointer;
      line-height: 1;
    }
    .close:hover,
    .close:focus {
      color: #000;
    }
    .modal-body {
      line-height: 1.6;
      color: #555;
    }
    .course-info {
      background-color: #f8f9fa;
      padding: 10px;
      border-radius: 4px;
      margin-bottom: 15px;
      font-size: 0.9em;
    }
    .feedback-content {
      background-color: #fff;
      border: 1px solid #ddd;
      padding: 15px;
      border-radius: 4px;
      white-space: pre-wrap;
      font-family: inherit;
    }
    .no-feedback {
      color: #6c757d;
      font-style: italic;
      text-align: center;
      padding: 20px;
    }
  </style>
</head>
<body>
<div class="sidebar">
  <h4>NAVEGACIÓN PRINCIPAL</h4>
  <ul>
    <li>Información Estudiantil
      <ul>
        <li><a href="<c:url value='/estudiante/informacion'/>">Datos Personales</a></li>
      </ul>
    </li>
    <li>Información Académica
      <ul>
        <li><a href="<c:url value='/estudiante/historial'/>" style="font-weight:bold;">Historial Académico</a></li>
        <li><a href="#">Materias</a></li>
        <li><a href="#">Horario</a></li>
        <li><a href="#">Notas</a></li>
        <li><a href="#">Pensum</a></li>
      </ul>
    </li>
    <li><a href="<c:url value='/logout'/>" class="logout-button">Cerrar sesión</a></li>
  </ul>
</div>

<div class="main-content">
  <h3>Historial Académico</h3>

  <c:if test="${not empty error}">
    <p style="color:red; border: 1px solid red; padding: 10px; background-color: #ffebeb;">
      <strong>Error:</strong> <c:out value="${error}"/>
    </p>
  </c:if>

  <c:if test="${empty error}">
    <c:choose>
      <c:when test="${not empty historialCursos}">
        <table>
          <thead>
          <tr>
            <th>Código Asignatura</th>
            <th>Nombre Asignatura</th>
            <th>Semestre (Curso)</th>
            <th>Grupo</th>
            <th>Modalidad</th>
            <th>Jornada</th>
            <th>Estado</th>
            <th>¿Vacacional?</th>
            <th>P1</th>
            <th>P2</th>
            <th>P3</th>
            <th>EX</th>
            <th>Habilitación</th>
            <th>Definitiva</th>
            <th>Retroalimentación</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="ec" items="${historialCursos}" varStatus="status">
            <tr>
              <td><c:out value="${ec.curso.asignatura.codigo}"/></td>
              <td><c:out value="${ec.curso.asignatura.nombre}"/></td>
              <td>
                <c:out value="${ec.curso.semestre.periodo}"/>-<c:out value="${ec.curso.semestre.anio}"/>
              </td>
              <td><c:out value="${ec.curso.grupo}"/></td>
              <td><c:out value="${ec.curso.modalidad}"/></td>
              <td><c:out value="${ec.curso.jornada}"/></td>
                <%-- Asegúrate que el valor de ec.estado coincida con los nombres de las clases CSS --%>
                <%-- Ej: si ec.estado es "APROBADO", la clase será "estado-APROBADO" --%>
              <td class="estado-${fn:toUpperCase(ec.estado)}"><c:out value="${ec.estado}"/></td>
              <td><c:out value="${ec.curso.vacacional ? 'Sí' : 'No'}"/></td>
              <td>
                <c:choose>
                  <c:when test="${not empty ec.p1}">
                    <fmt:formatNumber value="${ec.p1}" type="number" minFractionDigits="1" maxFractionDigits="2"/>
                  </c:when>
                  <c:otherwise>
                    N/A
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${not empty ec.p2}">
                    <fmt:formatNumber value="${ec.p2}" type="number" minFractionDigits="1" maxFractionDigits="2"/>
                  </c:when>
                  <c:otherwise>
                    N/A
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${not empty ec.p3}">
                    <fmt:formatNumber value="${ec.p3}" type="number" minFractionDigits="1" maxFractionDigits="2"/>
                  </c:when>
                  <c:otherwise>
                    N/A
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${not empty ec.EX}">
                    <fmt:formatNumber value="${ec.EX}" type="number" minFractionDigits="1" maxFractionDigits="2"/>
                  </c:when>
                  <c:otherwise>
                    N/A
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${not empty ec.h}">
                    <fmt:formatNumber value="${ec.h}" type="number" minFractionDigits="1" maxFractionDigits="2"/>
                  </c:when>
                  <c:otherwise>
                    N/A
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${not empty ec.definitiva}">
                    <fmt:formatNumber value="${ec.definitiva}" type="number" minFractionDigits="1" maxFractionDigits="2"/>
                  </c:when>
                  <c:otherwise>
                    N/A
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${not empty ec.retroalimentacion and fn:trim(ec.retroalimentacion) != ''}">
                    <button class="feedback-btn" onclick="showFeedback('${status.index}')">
                      Ver Comentarios
                    </button>
                  </c:when>
                  <c:otherwise>
                    <button class="feedback-btn" disabled>
                      Sin Comentarios
                    </button>
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>

      </c:when>
      <c:otherwise>
        <p>No se encontraron cursos matriculados.</p>
      </c:otherwise>
    </c:choose>
  </c:if>
  <div style="margin-top:20px;">
    <a href="<c:url value='/estudiante/informacion'/>" class="action-button" style="text-decoration:none; background-color: #6c757d; color: white; padding: 10px 15px; border-radius: 4px;">Volver a Información</a>
  </div>
</div>

<!-- Modal para mostrar retroalimentación -->
<div id="feedbackModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <h4>Retroalimentación del Curso</h4>
      <span class="close" onclick="closeFeedbackModal()">&times;</span>
    </div>
    <div class="modal-body">
      <div class="course-info">
        <strong>Curso:</strong> <span id="modalCourseName"></span><br>
        <strong>Código:</strong> <span id="modalCourseCode"></span><br>
        <strong>Definitiva:</strong> <span id="modalDefinitiva"></span>
      </div>
      <div class="feedback-content" id="modalFeedbackContent">
        <!-- El contenido se llenará dinámicamente -->
      </div>
    </div>
  </div>
</div>

<script>
  // Array con los datos de retroalimentación (se llena desde el servidor)
  var feedbackData = [
    <c:forEach var="ec" items="${historialCursos}" varStatus="status">
    {
      courseName: "<c:out value='${ec.curso.asignatura.nombre}' escapeXml='true'/>",
      courseCode: "<c:out value='${ec.curso.asignatura.codigo}' escapeXml='true'/>",
      definitiva: "<c:choose><c:when test='${not empty ec.definitiva}'><fmt:formatNumber value='${ec.definitiva}' type='number' minFractionDigits='1' maxFractionDigits='2'/></c:when><c:otherwise>N/A</c:otherwise></c:choose>",
      feedback: "<c:out value='${ec.retroalimentacion}' escapeXml='true'/>"
    }<c:if test="${!status.last}">,</c:if>
    </c:forEach>
  ];

  function showFeedback(index) {
    var data = feedbackData[index];

    // Llenar la información del modal
    document.getElementById('modalCourseName').textContent = data.courseName;
    document.getElementById('modalCourseCode').textContent = data.courseCode;
    document.getElementById('modalDefinitiva').textContent = data.definitiva;

    var feedbackContent = document.getElementById('modalFeedbackContent');
    if (data.feedback && data.feedback.trim() !== '') {
      feedbackContent.textContent = data.feedback;
      feedbackContent.className = 'feedback-content';
    } else {
      feedbackContent.innerHTML = '<div class="no-feedback">No hay retroalimentación disponible para este curso.</div>';
    }

    // Mostrar el modal
    document.getElementById('feedbackModal').style.display = 'block';
  }

  function closeFeedbackModal() {
    document.getElementById('feedbackModal').style.display = 'none';
  }

  // Cerrar modal al hacer clic fuera de él
  window.onclick = function(event) {
    var modal = document.getElementById('feedbackModal');
    if (event.target == modal) {
      modal.style.display = 'none';
    }
  }

  // Cerrar modal con la tecla Escape
  document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
      closeFeedbackModal();
    }
  });
</script>

</body>
</html>