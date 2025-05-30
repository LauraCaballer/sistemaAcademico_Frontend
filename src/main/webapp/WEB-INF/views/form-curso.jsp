<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title><c:choose><c:when test="${curso.id != null}">Editar Curso</c:when><c:otherwise>Nuevo Curso</c:otherwise></c:choose></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <style>
    .custom-card {
      border: none;
      border-radius: 20px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      padding: 30px;
      background: #fff;
    }
    .btn-gradient {
      background: linear-gradient(to right, #ff0000, #cc0000);
      color: white;
      border-radius: 30px;
      padding: 10px 20px;
      font-weight: bold;
      box-shadow: 0 5px 15px rgba(255, 0, 0, 0.4);
    }
    .btn-cancel {
      background: #6c757d;
      color: white;
      border-radius: 30px;
      padding: 10px 20px;
    }
    .form-label {
      font-weight: bold;
      color: #333;
    }
  </style>
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="custom-card">
    <h3 class="mb-4">
      <i class="fas fa-book"></i>
      <c:choose>
        <c:when test="${curso.id != null}">Editar Curso</c:when>
        <c:otherwise>Crear Curso</c:otherwise>
      </c:choose>
    </h3>

    <form action="${pageContext.request.contextPath}/admin/cursos<c:choose><c:when test='${curso.id != null}'>/${curso.id}</c:when><c:otherwise/></c:choose>" method="post">

      <div class="mb-3">
        <label class="form-label">Nombre:</label>
        <input type="text" class="form-control" name="nombre" value="${curso.nombre}" required/>
      </div>

      <div class="mb-3">
        <label class="form-label">Descripción:</label>
        <textarea class="form-control" name="descripcion" required>${curso.descripcion}</textarea>
      </div>

      <div class="mb-3">
        <label class="form-label">Contenido:</label>
        <textarea class="form-control" name="contenido">${curso.contenido}</textarea>
      </div>

      <div class="mb-3">
        <label class="form-label">Objetivos:</label>
        <textarea class="form-control" name="objetivos">${curso.objetivos}</textarea>
      </div>

      <div class="mb-3">
        <label class="form-label">Competencias:</label>
        <textarea class="form-control" name="competencias">${curso.competencias}</textarea>
      </div>

      <div class="mb-3">
        <label class="form-label">Cupo Máximo:</label>
        <input type="number" class="form-control" name="cupoMaximo" value="${curso.cupoMaximo}" required/>
      </div>

      <div class="mb-3">
        <label class="form-label">Asignatura:</label>
        <select class="form-select" name="asignatura.id" required>
          <option value="">--Seleccione--</option>
          <c:forEach var="a" items="${asignaturas}">
            <option value="${a.id}" <c:if test="${curso.asignatura != null and curso.asignatura.id eq a.id}">selected</c:if>>${a.nombre}</option>
          </c:forEach>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label">Programa:</label>
        <select class="form-select" name="programa.id" required>
          <option value="">--Seleccione--</option>
          <c:forEach var="p" items="${programas}">
            <option value="${p.id}" <c:if test="${curso.programa != null and curso.programa.id eq p.id}">selected</c:if>>${p.nombre}</option>
          </c:forEach>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label">Semestre:</label>
        <select class="form-select" name="semestre.id" required>
          <option value="">--Seleccione--</option>
          <c:forEach var="s" items="${semestres}">
            <option value="${s.id}" <c:if test="${curso.semestre != null and curso.semestre.id eq s.id}">selected</c:if>>${s.periodo} - ${s.anio}</option>
          </c:forEach>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label">Grupo:</label>
        <input type="text" class="form-control" name="grupo" maxlength="1" value="${curso.grupo}"/>
      </div>

      <div class="mb-3">
        <label class="form-label">Jornada:</label>
        <input type="text" class="form-control" name="jornada" value="${curso.jornada}"/>
      </div>

      <div class="mb-3">
        <label class="form-label">Modalidad:</label>
        <input type="text" class="form-control" name="modalidad" value="${curso.modalidad}"/>
      </div>

      <div class="form-check mb-4">
        <input class="form-check-input" type="checkbox" name="vacacional" value="true" <c:if test="${curso.vacacional}">checked</c:if>/>
        <label class="form-check-label">Curso Vacacional</label>
      </div>

      <div class="d-flex gap-3">
        <button type="submit" class="btn btn-gradient"><i class="fas fa-save me-2"></i>Guardar</button>
        <a href="${pageContext.request.contextPath}/admin/cursos" class="btn btn-cancel"><i class="fas fa-times me-2"></i>Cancelar</a>
      </div>
    </form>
  </div>
</div>

</body>
</html>
