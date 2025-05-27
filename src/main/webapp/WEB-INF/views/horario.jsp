<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sistema Académico - Horario de Clases</title>
  <link rel="stylesheet" href="<c:url value='/css/horario.css' />" />
</head>
<body>
<!-- Barra superior -->
<div class="top-bar">
  <h1>ESTUDIANTES</h1>
  <div class="user-info">
    <div class="notification">
      <i class="fas fa-bell"></i>
      <span class="notification-badge">2</span>
    </div>
    <span class="user-name">Juan David</span>
    <i class="fas fa-power-off"></i>
  </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
  <div class="profile-small">
    <img src="https://via.placeholder.com/40" alt="Foto de perfil">
    <div>Juan David</div>
  </div>
  <div class="nav-title">NAVEGACIÓN PRINCIPAL</div>
  <ul class="nav-menu">
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="fas fa-user"></i>
        Información Estudiantil
        <span class="submenu-toggle">▼</span>
      </a>
      <ul class="submenu">
        <li class="submenu-item">
          <a href="#" class="submenu-link">Datos Personales</a>
        </li>
      </ul>
    </li>
    <li class="nav-item open">
      <a href="#" class="nav-link active">
        <i class="fas fa-graduation-cap"></i>
        Información Académica
        <span class="submenu-toggle">▼</span>
      </a>
      <ul class="submenu" style="max-height: 500px;">
        <li class="submenu-item">
          <a href="#" class="submenu-link">Materias</a>
        </li>
        <li class="submenu-item">
          <a href="#" class="submenu-link active">Horario</a>
        </li>
        <li class="submenu-item">
          <a href="#" class="submenu-link">Notas</a>
        </li>
        <li class="submenu-item">
          <a href="#" class="submenu-link">Pensum</a>
        </li>
      </ul>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="fas fa-edit"></i>
        Matrícula Académica
        <span class="submenu-toggle">▼</span>
      </a>
      <ul class="submenu">
        <li class="submenu-item">
          <a href="#" class="submenu-link">Horario Inclusiones</a>
        </li>
        <li class="submenu-item">
          <a href="#" class="submenu-link">Cancelar Curso</a>
        </li>
      </ul>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="fas fa-book"></i>
        Recursos
        <span class="submenu-toggle">▼</span>
      </a>
      <ul class="submenu">
        <li class="submenu-item">
          <a href="#" class="submenu-link">Aulas</a>
        </li>
        <li class="submenu-item">
          <a href="#" class="submenu-link">Materiales</a>
        </li>
      </ul>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="fas fa-comments"></i>
        Comunicación
        <span class="submenu-toggle">▼</span>
      </a>
      <ul class="submenu">
        <li class="submenu-item">
          <a href="#" class="submenu-link">Foros</a>
        </li>
        <li class="submenu-item">
          <a href="#" class="submenu-link">Mensajes</a>
        </li>
      </ul>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="fas fa-poll-h"></i>
        Encuesta MEN
      </a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="fas fa-file-alt"></i>
        Documentos
        <span class="submenu-toggle">▼</span>
      </a>
      <ul class="submenu">
        <li class="submenu-item">
          <a href="#" class="submenu-link">Ver Documentos</a>
        </li>
      </ul>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="fas fa-receipt"></i>
        Recibos de Pago
        <span class="submenu-toggle">▼</span>
      </a>
      <ul class="submenu">
        <li class="submenu-item">
          <a href="#" class="submenu-link">Ver Recibos</a>
        </li>
      </ul>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="fas fa-hands-helping"></i>
        Servicios Bienestar
        <span class="submenu-toggle">▼</span>
      </a>
      <ul class="submenu">
        <li class="submenu-item">
          <a href="#" class="submenu-link">Ver Servicios</a>
        </li>
      </ul>
    </li>
  </ul>
</div>

<!-- Contenido principal -->
<div class="main-content">
  <div class="page-header">
    <h2>Información Académica</h2>
    <p>Consulte su horario de clases</p>
  </div>

  <div class="schedule-container">
    <div class="schedule-header">
      <i class="fas fa-calendar-alt"></i>
      <h3>Horario de Clases</h3>
      <button class="download-button">
        <i class="fas fa-download"></i> Descargar Horario de Clases
      </button>
    </div>

    <div style="overflow-x: auto;">
      <table class="schedule-table">
        <thead>
        <tr>
          <th>HORA</th>
          <th>LUNES</th>
          <th>MARTES</th>
          <th>MIÉRCOLES</th>
          <th>JUEVES</th>
          <th>VIERNES</th>
          <th>SÁBADO</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>06:00-07:00</td>
          <td class="empty-cell">.</td>
          <td>
            <div class="class-block border-sistemas">
              <div class="class-title">Sistemas operativos - B</div>
              <div class="class-code">SB404 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
          <td>
            <div class="class-block border-programacion">
              <div class="class-title">Programación web - A</div>
              <div class="class-code">SA402 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-programacion">
              <div class="class-title">Programación web - A</div>
              <div class="class-code">SA401 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>07:00-08:00</td>
          <td>
            <div class="class-block border-sistemas">
              <div class="class-title">Sistemas operativos - B</div>
              <div class="class-code">SB404 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-sistemas">
              <div class="class-title">Sistemas operativos - B</div>
              <div class="class-code">SB404 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
          <td>
            <div class="class-block border-programacion">
              <div class="class-title">Programación web - A</div>
              <div class="class-code">SA402 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-programacion">
              <div class="class-title">Programación web - A</div>
              <div class="class-code">SA401 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>08:00-09:00</td>
          <td>
            <div class="class-block border-seminario">
              <div class="class-title">Seminario integrador II - A</div>
              <div class="class-code">SA414 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-bases">
              <div class="class-title">Bases de datos - A</div>
              <div class="class-code">SA402 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-planeacion">
              <div class="class-title">Planeación estratégica de sistemas de inf - A</div>
              <div class="class-code">SB401 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-problemas">
              <div class="class-title">Problemas sociales de frontera - A</div>
              <div class="class-code">SA202 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-bases">
              <div class="class-title">Bases de datos - A</div>
              <div class="class-code">SA414 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>09:00-10:00</td>
          <td>
            <div class="class-block border-seminario">
              <div class="class-title">Seminario integrador II - A</div>
              <div class="class-code">SA414 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-bases">
              <div class="class-title">Bases de datos - A</div>
              <div class="class-code">SA402 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
          <td>
            <div class="class-block border-problemas">
              <div class="class-title">Problemas sociales de frontera - A</div>
              <div class="class-code">SA202 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td>
            <div class="class-block border-bases">
              <div class="class-title">Bases de datos - A</div>
              <div class="class-code">SA414 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>10:00-11:00</td>
          <td>
            <div class="class-block border-planeacion">
              <div class="class-title">Planeación estratégica de sistemas de inf - A</div>
              <div class="class-code">SA411 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>11:00-12:00</td>
          <td>
            <div class="class-block border-planeacion">
              <div class="class-title">Planeación estratégica de sistemas de inf - A</div>
              <div class="class-code">SA411 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
          <td>
            <div class="class-block border-constitucion">
              <div class="class-title">Constitución y civismo - A</div>
              <div class="class-code">AG404 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>12:00-13:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td>
            <div class="class-block border-constitucion">
              <div class="class-title">Constitución y civismo - A</div>
              <div class="class-code">AG404 <i class="fas fa-info-circle"></i></div>
            </div>
          </td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>13:00-14:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>14:00-15:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>15:00-16:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>16:00-17:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>17:00-18:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>18:00-19:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>19:00-20:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>20:00-21:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        <tr>
          <td>21:00-22:00</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
          <td class="empty-cell">.</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

<script>
  // Font Awesome (reemplaza con una CDN real en producción)
  document.write('<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">');

  // Toggle para submenús
  document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function(e) {
      if (this.querySelector('.submenu-toggle')) {
        e.preventDefault();
        const parent = this.parentElement;
        if (parent.classList.contains('open')) {
          parent.classList.remove('open');
        } else {
          document.querySelectorAll('.nav-item').forEach(item => {
            item.classList.remove('open');
          });
          parent.classList.add('open');
        }
      }
    });
  });
</script>
</body>
</html>
