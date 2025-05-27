<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sistema Académico - Notas</title>
  <link rel="stylesheet" href="<c:url value='/css/RegistroNotas.css' />" />
</head>
<body>
<!-- Barra superior -->
<div class="top-bar">
  <div class="menu-title">ESTUDIANTES</div>
  <div class="top-right">
    <div class="notification">
      <i class="fas fa-bell">🔔</i>
      <span class="badge">3</span>
    </div>
    <div class="user-profile">
      <div class="user-avatar">
        <img src="/api/placeholder/30/30" alt="User" width="30" height="30">
      </div>
      <span>Juan David</span>
    </div>
    <i class="fas fa-power-off">⏻</i>
  </div>
</div>

<main>
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

  <!-- Contenido principal -->
  <div class="content">
    <div class="breadcrumb">
      <a href="#">Inicio</a>
      <span class="separator">/</span>
      <a href="#">Información Académica</a>
      <span class="separator">/</span>
      <span>Notas</span>
    </div>

    <div class="page-title">
      <h1>Información Académica: Notas</h1>
      <div class="date">Martes 06 de Mayo de 2025</div>
    </div>

    <div class="semester-summary">
      <div class="summary-card" style="border-top-color: #3498db;">
        <div class="summary-label">Promedio General</div>
        <div class="summary-value">4.2</div>
        <div class="progress-container">
          <div class="progress-bar">
            <div class="progress-fill" style="width: 84%;"></div>
          </div>
          <div class="progress-text">84%</div>
        </div>
      </div>

      <div class="summary-card" style="border-top-color: #2ecc71;">
        <div class="summary-label">Créditos Aprobados (Pensum)</div>
        <div class="summary-value">80</div>
        <div class="progress-container">
          <div class="progress-bar">
            <div class="progress-fill" style="width: 47%; background-color: #2ecc71;"></div>
          </div>
          <div class="progress-text">47%</div>
        </div>
      </div>

      <div class="summary-card" style="border-top-color: #9b59b6;">
        <div class="summary-label">Total Créditos Aprobados</div>
        <div class="summary-value">88</div>
      </div>
    </div>

    <div class="card">
      <div class="card-header">
        <div class="card-title">Notas Semestrales</div>
        <button class="btn btn-primary">
          <i class="fas fa-file-pdf">📄</i> Reporte de Notas
        </button>
      </div>

      <div class="card-body">
        <div class="info-text">
          Oprima sobre el bloque correspondiente al periodo académico del cual desea conocer sus notas. Utilice el botón "Reporte de notas" para generar un reporte detallado en formato pdf con las notas de toda su carrera.
        </div>

        <div class="semester-header">
          Segundo periodo de 2022
        </div>

        <div class="table-responsive">
          <table>
            <thead>
            <tr>
              <th>Código</th>
              <th>Materia</th>
              <th>Tipo Nota</th>
              <th>Definitiva</th>
              <th>Habilitación</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1155101</td>
              <td>CÁLCULO DIFERENCIAL</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.3</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155102</td>
              <td>MATEMÁTICAS DISCRETAS</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.0</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155104</td>
              <td>FUNDAMENTOS DE PROGRAMACIÓN</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.5</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155105</td>
              <td>INTRODUCCIÓN ING SISTEMAS</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">3.9</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155106</td>
              <td>COMUNICACIÓN I</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.2</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155108</td>
              <td>INTRO VIDA UNIVERSITARIA</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.8</td>
              <td>-</td>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="matricula-honor">
          <div class="matricula-honor-title">Matrícula de honor</div>
          <div>MATRÍCULA DE HONOR (46-01)</div>
          <div class="honor-badge">¡Felicidades!</div>
        </div>

        <div class="semester-header" style="margin-top: 30px;">
          Primer periodo de 2023
        </div>

        <div class="table-responsive">
          <table>
            <thead>
            <tr>
              <th>Código</th>
              <th>Materia</th>
              <th>Tipo Nota</th>
              <th>Definitiva</th>
              <th>Habilitación</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1155201</td>
              <td>CÁLCULO INTEGRAL</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">3.8</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155202</td>
              <td>ÁLGEBRA LINEAL</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.1</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155203</td>
              <td>FÍSICA MECÁNICA</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">3.7</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155204</td>
              <td>PROGRAMACIÓN ORIENTADA A OBJETOS</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.6</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155206</td>
              <td>COMUNICACIÓN II</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.3</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155209</td>
              <td>SEMINARIO INTEGRADOR I</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.5</td>
              <td>-</td>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="semester-header" style="margin-top: 30px;">
          Segundo periodo de 2023
        </div>

        <div class="table-responsive">
          <table>
            <thead>
            <tr>
              <th>Código</th>
              <th>Materia</th>
              <th>Tipo Nota</th>
              <th>Definitiva</th>
              <th>Habilitación</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1155301</td>
              <td>CÁLCULO VECTORIAL</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">3.9</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155303</td>
              <td>FÍSICA ELECTROMAGNÉTICA</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">3.5</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155304</td>
              <td>ESTRUCTURAS DE DATOS</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.3</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155305</td>
              <td>PROGRAMACIÓN ORIENTADA A EVENTOS</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.4</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155306</td>
              <td>SEMINARIO DE INVESTIGACIÓN I</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.0</td>
              <td>-</td>
            </tr>
            </tbody>
          </table>
        </div>

        <div class="semester-header" style="margin-top: 30px;">
          Primer periodo de 2024
        </div>

        <div class="table-responsive">
          <table>
            <thead>
            <tr>
              <th>Código</th>
              <th>Materia</th>
              <th>Tipo Nota</th>
              <th>Definitiva</th>
              <th>Habilitación</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1155401</td>
              <td>ECUACIONES DIFERENCIALES</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">3.6</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155402</td>
              <td>PROBABILIDAD Y ESTADÍSTICA</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.1</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155403</td>
              <td>ONDAS Y PARTÍCULAS</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">3.8</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155404</td>
              <td>ANÁLISIS DE ALGORITMOS</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.2</td>
              <td>-</td>
            </tr>
            <tr>
              <td>1155405</td>
              <td>TEORÍA DE LA COMPUTACIÓN</td>
              <td>Definitiva</td>
              <td class="grade grade-passed">4.0</td>
              <td>-</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</main>

<script>
  // JavaScript para manejar la expansión de los menús
  document.querySelectorAll('.nav-menu-title').forEach(item => {
    item.addEventListener('click', event => {
      const parent = item.closest('.nav-item');
      parent.classList.toggle('expanded');
    });
  });
</script>
</body>
</html>