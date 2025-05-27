<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Matrícula Académica - Inclusión de Materias</title>
  <link rel="stylesheet" href="<c:url value='/css/InclusionMaterias.css' />" />
</head>
<body>
<!-- Header -->
<header class="top-header">
  <div class="app-title">ESTUDIANTES</div>
  <div class="header-controls">
    <div class="notifications">
      <span>🔔</span>
      <span class="notification-badge">2</span>
    </div>
    <div class="user-menu">
      <div class="user-avatar">
        <img src="/api/placeholder/32/32" alt="Juan David">
      </div>
      <span>Juan David</span>
      <span>🔄</span>
    </div>
  </div>
</header>

<!-- Main Container -->
<div class="main-container">
  <!-- Barra lateral de navegación -->
  <aside class="sidebar">
    <div class="user-info">
      <div class="user-avatar-lg">
        <img src="/api/placeholder/60/60" alt="User" width="60" height="60">
      </div>
      <div>
        <div>Juan David</div>
      </div>
    </div>

    <div class="navigation-label">NAVEGACIÓN PRINCIPAL</div>

    <ul class="nav-menu">
      <!-- Información Estudiantil -->
      <li class="nav-item">
        <div class="nav-menu-container">
          <div class="nav-link nav-menu-title">
            <i class="fas fa-user">👤</i>
            <span>Información Estudiantil</span>
            <span class="arrow">▶</span>
          </div>
          <ul class="nav-submenu">
            <li><a href="#" class="submenu-link">Datos Personales</a></li>
          </ul>
        </div>
      </li>

      <!-- Información Académica -->
      <li class="nav-item active expanded">
        <div class="nav-menu-container">
          <div class="nav-link nav-menu-title">
            <i class="fas fa-graduation-cap">🎓</i>
            <span>Información Académica</span>
            <span class="arrow">▶</span>
          </div>
          <ul class="nav-submenu">
            <li><a href="#" class="submenu-link">Materias</a></li>
            <li><a href="#" class="submenu-link">Horario</a></li>
            <li><a href="#" class="submenu-link active">Notas</a></li>
            <li><a href="#" class="submenu-link">Pensum</a></li>
          </ul>
        </div>
      </li>

      <!-- Matrícula Académica -->
      <li class="nav-item">
        <div class="nav-menu-container">
          <div class="nav-link nav-menu-title">
            <i class="fas fa-edit">📝</i>
            <span>Matrícula Académica</span>
            <span class="arrow">▶</span>
          </div>
          <ul class="nav-submenu">
            <li><a href="#" class="submenu-link">Horario</a></li>
            <li><a href="#" class="submenu-link">Inclusiones</a></li>
            <li><a href="#" class="submenu-link">Cancelar Curso</a></li>
          </ul>
        </div>
      </li>

      <!-- Recursos -->
      <li class="nav-item">
        <div class="nav-menu-container">
          <div class="nav-link nav-menu-title">
            <i class="fas fa-folder">📁</i>
            <span>Recursos</span>
            <span class="arrow">▶</span>
          </div>
          <ul class="nav-submenu">
            <li><a href="#" class="submenu-link">Aulas</a></li>
            <li><a href="#" class="submenu-link">Materiales</a></li>
          </ul>
        </div>
      </li>

      <!-- Comunicación -->
      <li class="nav-item">
        <div class="nav-menu-container">
          <div class="nav-link nav-menu-title">
            <i class="fas fa-comments">💬</i>
            <span>Comunicación</span>
            <span class="arrow">▶</span>
          </div>
          <ul class="nav-submenu">
            <li><a href="#" class="submenu-link">Foros</a></li>
            <li><a href="#" class="submenu-link">Mensajes</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </aside>

  <!-- Content Area -->
  <div class="content">
    <div class="page-header">
      <div class="page-title">
        <h1>Matrícula Académica</h1>
        <span class="page-subtitle">Inclusión de Materias</span>
      </div>
      <div class="date-display">
        Martes 05 de Mayo de 2025
      </div>
    </div>

    <!-- Periodo académico selection -->
    <div class="content-card">
      <div class="card-header">
        <i>📅</i> Selección de Periodo Académico
      </div>
      <div class="card-body">
        <div class="form-group">
          <label class="form-label">Periodo Académico</label>
          <select class="form-control">
            <option selected>2025-1</option>
            <option>2024-2</option>
            <option>2024-1</option>
          </select>
        </div>
      </div>
    </div>

    <!-- Materias disponibles -->
    <div class="content-card">
      <div class="card-header">
        <i>📚</i> Materias Disponibles para Inclusión
      </div>
      <div class="card-body">
        <!-- Filtros y búsqueda -->
        <div class="filters-container">
          <div class="filter-group">
            <label class="form-label">Facultad</label>
            <select class="form-control">
              <option selected>Todas las facultades</option>
              <option>Ingeniería</option>
              <option>Ciencias</option>
              <option>Ciencias Económicas</option>
              <option>Artes</option>
            </select>
          </div>
          <div class="filter-group">
            <label class="form-label">Tipo de Materia</label>
            <select class="form-control">
              <option selected>Todos los tipos</option>
              <option>Obligatoria</option>
              <option>Electiva</option>
              <option>Libre elección</option>
            </select>
          </div>
          <div class="search-group">
            <label class="form-label">Buscar</label>
            <div style="position: relative;">
              <span class="search-icon">🔍</span>
              <input type="text" class="form-control search-input" placeholder="Buscar por nombre, código o profesor...">
            </div>
          </div>
        </div>

        <!-- Tabs -->
        <div class="tabs">
          <div class="tab active">Todas las materias</div>
          <div class="tab">Recomendadas</div>
          <div class="tab">Materias del pensum</div>
        </div>

        <!-- Tabla de materias -->
        <div class="table-container">
          <table class="table">
            <thead>
            <tr>
              <th>Código</th>
              <th>Nombre</th>
              <th>Grupo</th>
              <th>Créditos</th>
              <th>Horario</th>
              <th>Profesor</th>
              <th>Cupos</th>
              <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>MAT1103</td>
              <td>Cálculo Vectorial</td>
              <td>01</td>
              <td>4</td>
              <td>LU-MI-VI 8:00-10:00</td>
              <td>Pedro García</td>
              <td><span class="status-badge status-available">15 cupos</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-btn add-btn">Incluir</button>
                  <button class="action-btn info-btn">Detalles</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>FIS1018</td>
              <td>Física Moderna</td>
              <td>02</td>
              <td>3</td>
              <td>MA-JU 10:00-12:00</td>
              <td>Laura Ramírez</td>
              <td><span class="status-badge status-limited">3 cupos</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-btn add-btn">Incluir</button>
                  <button class="action-btn info-btn">Detalles</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>CBCC1035</td>
              <td>Algoritmos Avanzados</td>
              <td>01</td>
              <td>4</td>
              <td>MA-JU 14:00-16:00</td>
              <td>Carlos Mendoza</td>
              <td><span class="status-badge status-full">Lleno</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-btn add-btn" disabled>Lista espera</button>
                  <button class="action-btn info-btn">Detalles</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>ECO2056</td>
              <td>Microeconomía</td>
              <td>03</td>
              <td>3</td>
              <td>LU-MI 16:00-18:00</td>
              <td>Ana Martínez</td>
              <td><span class="status-badge status-available">8 cupos</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-btn add-btn">Incluir</button>
                  <button class="action-btn info-btn">Detalles</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>IND3024</td>
              <td>Gestión de Proyectos</td>
              <td>02</td>
              <td>3</td>
              <td>VI 8:00-12:00</td>
              <td>Roberto Gómez</td>
              <td><span class="status-badge status-available">12 cupos</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-btn add-btn">Incluir</button>
                  <button class="action-btn info-btn">Detalles</button>
                </div>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Horario Actual -->
    <div class="content-card">
      <div class="card-header">
        <i>🕒</i> Tu Horario Actual
      </div>
      <div class="card-body">
        <div class="schedule-grid">
          <div class="schedule-header">Hora</div>
          <div class="schedule-header">Lunes</div>
          <div class="schedule-header">Martes</div>
          <div class="schedule-header">Miércoles</div>
          <div class="schedule-header">Jueves</div>
          <div class="schedule-header">Viernes</div>

          <!-- 8:00 - 10:00 -->
          <div class="time-slot">8:00 - 10:00</div>
          <div class="schedule-cell">
            <div class="course-block" style="background-color: #e3f2fd;">
              <div class="course-code">MAT1103</div>
              <div class="course-name">Cálculo Vectorial</div>
              <div class="course-room">Aula 201</div>
            </div>
          </div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell">
            <div class="course-block" style="background-color: #e3f2fd;">
              <div class="course-code">MAT1103</div>
              <div class="course-name">Cálculo Vectorial</div>
              <div class="course-room">Aula 201</div>
            </div>
          </div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell">
            <div class="course-block" style="background-color: #e3f2fd;">
              <div class="course-code">MAT1103</div>
              <div class="course-name">Cálculo Vectorial</div>
              <div class="course-room">Aula 201</div>
            </div>
          </div>

          <!-- 10:00 - 12:00 -->
          <div class="time-slot">10:00 - 12:00</div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell">
            <div class="course-block" style="background-color: #fff8e1;">
              <div class="course-code">FIS1018</div>
              <div class="course-name">Física Moderna</div>
              <div class="course-room">Lab Física</div>
            </div>
          </div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell">
            <div class="course-block" style="background-color: #fff8e1;">
              <div class="course-code">FIS1018</div>
              <div class="course-name">Física Moderna</div>
              <div class="course-room">Lab Física</div>
            </div>
          </div>
          <div class="schedule-cell"></div>

          <!-- 12:00 - 14:00 -->
          <div class="time-slot">12:00 - 14:00</div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell"></div>

          <!-- 14:00 - 16:00 -->
          <div class="time-slot">14:00 - 16:00</div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell"></div>

          <!-- 16:00 - 18:00 -->
          <div class="time-slot">16:00 - 18:00</div>
          <div class="schedule-cell">
            <div class="course-block" style="background-color: #f3e5f5;">
              <div class="course-code">ECO2056</div>
              <div class="course-name">Microeconomía</div>
              <div class="course-room">Aula 305</div>
            </div>
          </div>
          <div class="schedule-cell"></div>
          <div class="schedule-cell">
            <div class="course-block" style="background-color: #f3e5f5;">
              <div class="course-code">ECO2056</div>
              <div class="course-name">Microeconomía</div>
              <div class="course-room">Aula 305</div>
            </div>
          </div>
          <div class="schedule-cell"></div>
        </div>
      </div>
    </div>

    <!-- Materias incluidas -->
    <div class="content-card">
      <div class="card-header">
        <i>✅</i> Materias Incluidas
      </div>
      <div class="card-body">
        <div class="table-container">
          <table class="table">
            <thead>
            <tr>
              <th>Código</th>
              <th>Nombre</th>
              <th>Grupo</th>
              <th>Créditos</th>
              <th>Horario</th>
              <th>Profesor</th>
              <th>Estado</th>
              <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>MAT1103</td>
              <td>Cálculo Vectorial</td>
              <td>01</td>
              <td>4</td>
              <td>LU-MI-VI 8:00-10:00</td>
              <td>Pedro García</td>
              <td><span class="status-badge status-available">Inscrito</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-btn" style="background-color: var(--danger-color); color: white;">Cancelar</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>FIS1018</td>
              <td>Física Moderna</td>
              <td>02</td>
              <td>3</td>
              <td>MA-JU 10:00-12:00</td>
              <td>Laura Ramírez</td>
              <td><span class="status-badge status-available">Inscrito</span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-btn" style="background-color: var(--danger-color); color: white;">Cancelar</button>
                </div>
              </td>
            </tr>
            </tbody>
          </table>
        </div>

        <div style="display: flex; justify-content: flex-end; margin-top: 1rem;">
          <button class="btn btn-primary">Confirmar Matrícula</button>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  // Script para manejar el comportamiento de los menús desplegables
  document.querySelectorAll('.nav-menu-title').forEach(item => {
    item.addEventListener('click', event => {
      const parent = event.currentTarget.closest('.nav-item');
      parent.classList.toggle('expanded');
      parent.classList.toggle('active');
    });
  });

  // Script para manejar las pestañas
  document.querySelectorAll('.tab').forEach(tab => {
    tab.addEventListener('click', () => {
      document.querySelector('.tab.active').classList.remove('active');
      tab.classList.add('active');
      // Aquí iría la lógica para cambiar el contenido de las pestañas
    });
  });

  // Script para los botones de inclusión
  document.querySelectorAll('.add-btn').forEach(btn => {
    btn.addEventListener('click', event => {
      const row = event.currentTarget.closest('tr');
      // Lógica para agregar la materia al horario y a la lista de incluidas
      alert('Materia agregada con éxito');
    });
  });
</script>

</body>
</html>