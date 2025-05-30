<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
  <link
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/admin-styles.css" rel="stylesheet">
  <title>Listado de Cursos</title>
  <style>
    .btn-asignar {
      background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
      border: none;
      color: white;
      padding: 8px 16px;
      border-radius: 20px;
      font-size: 0.85rem;
      font-weight: 500;
      transition: all 0.3s ease;
      margin-right: 8px;
    }
    .btn-asignar:hover {
      background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
      transform: translateY(-1px);
      box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
    }
    .docente-card {
      border: 1px solid rgba(0,0,0,0.1);
      border-radius: 15px;
      padding: 1rem;
      margin-bottom: 1rem;
      transition: all 0.3s ease;
      cursor: pointer;
    }
    .docente-card:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      border-color: rgba(220, 38, 38, 0.3);
    }
    .docente-card.selected {
      background: linear-gradient(135deg, rgba(220, 38, 38, 0.05) 0%, transparent 100%);
      border: 2px solid #dc2626;
    }
    .docente-name {
      font-weight: 600;
      color: #1e293b;
    }
    .docente-experiencia {
      font-size: 0.9rem;
      color: #64748b;
    }
    .docente-programa {
      font-size: 0.85rem;
      background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%);
      color: #dc2626;
      padding: 4px 10px;
      border-radius: 20px;
      display: inline-block;
      margin-top: 0.5rem;
    }
    .modal-content {
      border-radius: 20px;
      overflow: hidden;
      border: none;
      box-shadow: 0 20px 60px rgba(0,0,0,0.2);
    }
    .modal-header {
      background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
      color: white;
      border-bottom: none;
    }
    .modal-title {
      font-weight: 600;
    }
    .modal-footer {
      border-top: 1px solid rgba(0,0,0,0.1);
    }
    .btn-confirmar {
      background: linear-gradient(135deg, #10b981 0%, #059669 100%);
      border: none;
      color: white;
      padding: 8px 20px;
      border-radius: 20px;
      font-weight: 500;
    }
    .btn-confirmar:hover {
      background: linear-gradient(135deg, #059669 0%, #047857 100%);
      color: white;
    }
  </style>
</head>
<body class="cursos">
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
    <li class="active"><a href="${pageContext.request.contextPath}/admin/cursos">Cursos</a></li>
  </ul>
</nav>

<div id="contenido">
  <div class="header-section">
    <div class="header-content">
      <h1 class="page-title">
        <i class="fas fa-book-open"></i>
        Gestión de Cursos
      </h1>
      <p class="page-subtitle">Administra y supervisa la información de todos los cursos</p>
    </div>
  </div>

  <div class="main-content">
    <div class="action-bar">
      <div class="stats-info">
        <i class="fas fa-book"></i>
        Total de cursos registrados: <strong>${cursos.size()}</strong>
      </div>
      <a href="${pageContext.request.contextPath}/admin/cursos/nuevo" class="btn-nuevo">
        <i class="fas fa-plus"></i>
        Crear Nuevo Curso
      </a>
    </div>

    <div class="table-container">
      <table class="table">
        <thead>
        <tr>
          <th><i class="fas fa-hashtag me-2"></i>ID</th>
          <th><i class="fas fa-book me-2"></i>Nombre</th>
          <th><i class="fas fa-align-left me-2"></i>Descripción</th>
          <th><i class="fas fa-graduation-cap me-2"></i>Programa</th>
          <th><i class="fas fa-calendar me-2"></i>Semestre</th>
          <th><i class="fas fa-chalkboard-teacher me-2"></i>Docente Asignado</th>
          <th><i class="fas fa-cogs me-2"></i>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
          <c:when test="${empty cursos}">
            <tr>
              <td colspan="7" class="empty-state">
                <i class="fas fa-book-open"></i>
                <h5>No hay cursos registrados</h5>
                <p>Comienza agregando el primer curso al sistema</p>
              </td>
            </tr>
          </c:when>
          <c:otherwise>
            <c:forEach items="${cursos}" var="curso">
              <tr>
                <td><span class="id-badge">#${curso.id}</span></td>
                <td><span class="curso-info">${curso.nombre}</span></td>
                <td>${curso.descripcion}</td>
                <td>
                  <span class="programa-info">
                    <i class="fas fa-graduation-cap me-1"></i>
                    ${curso.programa.nombre}
                  </span>
                </td>
                <td>
                  <span class="semestre-info">
                    ${curso.semestre.anio}-${curso.semestre.periodo}
                  </span>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${curso.docente != null}">
                      <span class="persona-info">
                        <i class="fas fa-user-circle me-1"></i>
                        ${curso.docente.persona.nombre}
                      </span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge bg-warning">Sin asignar</span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <!-- Editar: utiliza ruta relativa al contexto -->
                  <a class="btn-editar"
                     href="${pageContext.request.contextPath}/admin/cursos/${curso.id}/editar">
                    <i class="fas fa-edit"></i> Editar
                  </a>

                  <!-- Asignar Docente (modal) -->
                  <button class="btn-asignar" data-bs-toggle="modal"
                          data-bs-target="#asignarDocenteModal"
                          data-curso-id="${curso.id}"
                          data-curso-nombre="${curso.nombre}">
                    <i class="fas fa-user-plus"></i> Asignar Docente
                  </button>

                  <!-- Eliminar: apunta al controller frontend -->
                  <form action="${pageContext.request.contextPath}/admin/cursos/${curso.id}/eliminar"
                        method="post" style="display:inline">
                    <button type="submit" class="btn-eliminar"
                            onclick="return confirm('¿Estás seguro de que deseas eliminar este curso?');">
                      <i class="fas fa-trash"></i> Eliminar
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </c:otherwise>
        </c:choose>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- Modal para asignar docentes -->
<div class="modal fade" id="asignarDocenteModal" tabindex="-1"
     aria-labelledby="asignarDocenteModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="asignarDocenteModalLabel">Asignar Docente al Curso</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h6 id="cursoSeleccionado" class="mb-4">Seleccionando docente para: <strong></strong></h6>

        <div class="docentes-container">
          <c:forEach items="${docentes}" var="docente">
            <div class="docente-card" data-docente-id="${docente.id}">
              <div class="d-flex align-items-center">
                <div class="me-3">
                  <i class="fas fa-user-circle fa-2x text-primary"></i>
                </div>
                <div>
                  <div class="docente-name">${docente.persona.nombre}</div>
                  <div class="docente-experiencia">${docente.experiencia} años</div>
                  <div class="docente-programa">${docente.programa.nombre}</div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn-confirmar" id="btnAsignarDocente">Asignar Docente</button>
      </div>
    </div>
  </div>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const asignarDocenteButtons = document.querySelectorAll('.btn-asignar');
    const modal = document.getElementById('asignarDocenteModal');
    const cursoSeleccionado = document.getElementById('cursoSeleccionado');
    const docenteCards = document.querySelectorAll('.docente-card');
    const btnAsignarDocente = document.getElementById('btnAsignarDocente');

    let selectedCursoId = null;
    let selectedDocenteId = null;

    asignarDocenteButtons.forEach(button => {
      button.addEventListener('click', function() {
        selectedCursoId = this.getAttribute('data-curso-id');
        const cursoNombre = this.getAttribute('data-curso-nombre');
        cursoSeleccionado.querySelector('strong').textContent = cursoNombre;
        selectedDocenteId = null;

        docenteCards.forEach(c => c.classList.remove('selected'));
        btnAsignarDocente.disabled = true;
      });
    });

    docenteCards.forEach(card => {
      card.addEventListener('click', function() {
        docenteCards.forEach(c => c.classList.remove('selected'));
        this.classList.add('selected');
        selectedDocenteId = this.getAttribute('data-docente-id');
        btnAsignarDocente.disabled = false;
      });
    });

    btnAsignarDocente.addEventListener('click', function() {
      if (selectedCursoId && selectedDocenteId) {
        fetch(`${pageContext.request.contextPath}/admin/cursos/asignar-docente?cursoId=${selectedCursoId}&docenteId=${selectedDocenteId}`, {
          method: 'POST'
        })
                .then(response => {
                  if (response.ok) {
                    alert('Docente asignado correctamente');
                    const modalInstance = bootstrap.Modal.getInstance(modal);
                    modalInstance.hide();
                    location.reload();
                  } else {
                    return response.json().then(err => {
                      throw new Error(err.message || 'Error inesperado');
                    });
                  }
                })
                .catch(error => {
                  console.error('Error:', error);
                  alert('Error al asignar docente');
                });
      }
    });
  });
</script>
<!-- Modal para crear curso -->
<div class="modal fade" id="crearCursoModal" tabindex="-1" aria-labelledby="crearCursoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">

      </div>
      <div class="modal-body">
        <form id="formCrearCurso">
          <div class="mb-3">
            <label class="form-label">Nombre del Curso</label>
            <input type="text" class="form-control" name="nombre" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Descripción</label>
            <textarea class="form-control" name="descripcion" required></textarea>
          </div>
          <div class="mb-3">
            <label class="form-label">Programa</label>
            <select class="form-select" name="programaId" required>
              <c:forEach items="${programas}" var="programa">
                <option value="${programa.id}">${programa.nombre}</option>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label">Semestre</label>
            <select class="form-select" name="semestreId" required>
              <c:forEach items="${semestres}" var="semestre">
                <option value="${semestre.id}">${semestre.anio} - ${semestre.periodo}</option>
              </c:forEach>
            </select>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn-confirmar" form="formCrearCurso">Guardar Curso</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Lógica existente asignar docente...

    // Lógica para crear curso vía AJAX
    const formCrearCurso = document.getElementById('formCrearCurso');
    formCrearCurso.addEventListener('submit', function(e) {
      e.preventDefault();
      const formData = new FormData(formCrearCurso);
      fetch(`${pageContext.request.contextPath}/admin/cursos/crear`, {
        method: 'POST',
        body: new URLSearchParams(formData)
      })
              .then(response => {
                if (response.ok) {
                  alert('Curso creado exitosamente');
                  const modalInstance = bootstrap.Modal.getInstance(document.getElementById('crearCursoModal'));
                  modalInstance.hide();
                  location.reload();
                } else {
                  return response.json().then(err => { throw new Error(err.message || 'Error al crear curso'); });
                }
              })
              .catch(error => {
                console.error('Error:', error);
                alert('Error al crear el curso');
              });
    });
  });
</script>
</body>
</html>
