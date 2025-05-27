<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
pensum <!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sistema Académico</title>
  <link rel="stylesheet" href="<c:url value='/css/pensum.css' />" />
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
      <li class="nav-item expanded">
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
            <li><a href="#" class="submenu-link">Notas</a></li>
            <li><a href="#" class="submenu-link active">Pensum</a></li>
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
      <span>Pensum</span>
    </div>

    <div class="page-title">
      <h1>Información Académica: Pensum</h1>
      <div class="date">Martes 06 de Mayo de 2025</div>
    </div>

    <div class="card">
      <div class="card-header">
        <div class="card-title">Estado de Pensum Académico (115-03)</div>
        <div class="status-legend">
          <div class="legend-item">
            <div class="legend-color" style="background-color: #e6f7e6; border: 1px solid #c8e6c9;"></div>
            <span>Materia cursada</span>
          </div>
          <div class="legend-item">
            <div class="legend-color" style="background-color: #e6f3f9; border: 1px solid #bbdefb;"></div>
            <span>Materia matriculada</span>
          </div>
          <div class="legend-item">
            <div class="legend-color" style="background-color: #feeae6; border: 1px solid #ffccbc;"></div>
            <span>Materia no matriculada</span>
          </div>
          <div class="legend-item">
            <div class="legend-color" style="background-color: #fff3e0; border: 1px solid #ffe0b2;"></div>
            <span>Electiva</span>
          </div>
        </div>
      </div>

      <div class="card-body">
        <!-- Primer Semestre -->
        <div class="semester-section">
          <div class="semester-header">
            <h3 class="semester-name">PRIMER SEMESTRE</h3>
          </div>

          <div class="semester-grid">
            <div class="course-card materia-cursada">
              <div class="course-header">1155101 - Cálculo diferencial</div>
              <div class="course-info">
                horas:4 Cred:4<br>
                2022-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155102 - Matemáticas discretas</div>
              <div class="course-info">
                horas:3 Cred:3<br>
                2022-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155104 - Fundamentos de programación</div>
              <div class="course-info">
                horas:4 Cred:3<br>
                2022-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155105 - Introducción Ing. Sistemas</div>
              <div class="course-info">
                horas:3 Cred:3<br>
                2022-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155106 - Comunicación I</div>
              <div class="course-info">
                horas:2 Cred:2<br>
                2022-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155108 - Intro vida universitaria</div>
              <div class="course-info">
                horas:1 Cred:1<br>
                2022-2
              </div>
              <div class="status completed">Cursada</div>
            </div>
          </div>
        </div>

        <!-- Segundo Semestre -->
        <div class="semester-section">
          <div class="semester-header">
            <h3 class="semester-name">SEGUNDO SEMESTRE</h3>
          </div>

          <div class="semester-grid">
            <div class="course-card materia-cursada">
              <div class="course-header">1155201 - Cálculo integral</div>
              <div class="course-info">
                horas:4 Cred:4<br>
                2023-1
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155202 - Álgebra lineal</div>
              <div class="course-info">
                horas:3 Cred:3<br>
                2023-1
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155203 - Física mecánica</div>
              <div class="course-info">
                horas:4 Cred:4<br>
                2023-1
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155204 - Programación orientada a objetos</div>
              <div class="course-info">
                horas:4 Cred:3<br>
                2023-1
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155206 - Comunicación II</div>
              <div class="course-info">
                horas:2 Cred:2<br>
                2023-1
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155209 - Seminario integrador I</div>
              <div class="course-info">
                horas:1 Cred:1<br>
                2023-1
              </div>
              <div class="status completed">Cursada</div>
            </div>
          </div>
        </div>

        <!-- Tercer Semestre -->
        <div class="semester-section">
          <div class="semester-header">
            <h3 class="semester-name">TERCER SEMESTRE</h3>
          </div>

          <div class="semester-grid">
            <div class="course-card materia-cursada">
              <div class="course-header">1155301 - Cálculo vectorial</div>
              <div class="course-info">
                horas:4 Cred:4<br>
                2023-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155303 - Física electromagnética</div>
              <div class="course-info">
                horas:4 Cred:4<br>
                2023-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155304 - Estructuras de datos</div>
              <div class="course-info">
                horas:4 Cred:3<br>
                2023-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155305 - Programación orientada a eventos</div>
              <div class="course-info">
                horas:4 Cred:3<br>
                2023-2
              </div>
              <div class="status completed">Cursada</div>
            </div>

            <div class="course-card materia-cursada">
              <div class="course-header">1155306 - Seminario de investigación I</div>
              <div class="course-info">
                horas:2 Cred:2<br>
                2023-2
              </div>
              <div class="status completed">Cursada</div>
            </div>
          </div>
        </div>

        <!-- Cuarto Semestre -->
        <div class="semester-section">
          <div class="semester-header">
            <h3 class="semester-name">CUARTO SEMESTRE</h3>
          </div>

          <div class="semester-grid">
            <div class="course-card materia-matriculada">
              <div class="course-header">1155401 - Ecuaciones diferenciales</div>
              <div class="course-info">
                horas:4 Cred:4<br>
                2024-1
              </div>
              <div class="status in-progress">Matriculada</div>
            </div>

            <div class="course-card materia-matriculada">
              <div class="course-header">1155402 - Probabilidad y estadística</div>
              <div class="course-info">
                horas:4 Cred:3<br>
                2024-1
              </div>
              <div class="status in-progress">Matriculada</div>
            </div>

            <div class="course-card materia-matriculada">
              <div class="course-header">1155403 - Ondas y partículas</div>
              <div class="course-info">
                horas:4 Cred:3<br>
                2024-1
              </div>
              <div class="status in-progress">Matriculada</div>
            </div>

            <div class="course-card materia-matriculada">
              <div class="course-header">1155404 - Análisis de algoritmos</div>
              <div class="course-info">
                horas:3 Cred:3<br>
                2024-1
              </div>
              <div class="status in-progress">Matriculada</div>
            </div>

            <div class="course-card materia-matriculada">
              <div class="course-header">1155405 - Teoría de la computación</div>
              <div class="course-info">
                horas:3 Cred:3<br>
                2024-1
              </div>
              <div class="status in-progress">Matriculada</div>
            </div>

            <div class="course-card materia-no-matriculada">
              <div class="course-header">1155406 - Descubriendo negocios basados en TI</div>
              <div class="course-info">
                horas:2 Cred:2<br>
                Electiva
              </div>
              <div class="status not-started">No matriculada</div>
            </div>
          </div>
        </div>

        <!-- Quinto Semestre -->
        <div class="semester-section">
          <div class="semester-header">
            <h3 class="semester-name">QUINTO SEMESTRE</h3>
          </div>

          <div class="semester-grid">
            <div class="course-card materia-no-matriculada">
              <div class="course-header">1155501 - Análisis numérico</div>
              <div class="course-info">
                horas:3 Cred:3<br>
                2024-2
              </div>
              <div class="status not-started">No matriculada</div>
            </div>

            <div class="course-card materia-no-matriculada">
              <div class="course-header">1155502 - Investigación de operaciones</div>
              <div class="course-info">
                horas:3 Cred:3<br>
                2024-2
              </div>
              <div class="status not-started">No matriculada</div>
            </div>

            <div class="course-card materia-no-matriculada">
              <div class="course-header">1155503 - Electrónica</div>
              <div class="course-info">
                horas:4 Cred:3<br>
                2024-2
              </div>
              <div class="status not-started">No matriculada</div>
            </div>

            <div class="course-card materia-no-matriculada">
              <div class="course-header">1155504 - Arquitectura de computadores</div>
              <div class="course-info">
                horas:3 Cred:3<br>
                2024-2
              </div>
              <div class="status not-started">No matriculada</div>
            </div>

            <div class="course-card materia-no-matriculada">
              <div class="course-header">1155506 - Seminario de investigación II</div>
              <div class="course-info">
                horas:2 Cred:2<br>
                2024-2
              </div>
              <div class="status not-started">No matriculada</div>
            </div>

            <div class="course-card materia-no-matriculada">
              <div class="course-header">1155511 - Problemas sociales de...</div>
              <div class="course-info">
                horas:2 Cred:2<br>
                Electiva
              </div>
              <div class="status not-started">No matriculada</div>
            </div>
          </div>
        </div>

        <!-- Los siguientes semestres siguen la misma estructura pero están colapsados por defecto -->
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
