<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Académico</title>
    <link rel="stylesheet" href="<c:url value='/css/start.css' />" />
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
        <li class="nav-item open">
            <a href="#" class="nav-link">
                <i class="fas fa-user"></i>
                Información Estudiantil
                <span class="submenu-toggle">▼</span>
            </a>
            <ul class="submenu" style="max-height: 500px;">
                <li class="submenu-item">
                    <a href="#" class="submenu-link active">Datos Personales</a>
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link">
                <i class="fas fa-graduation-cap"></i>
                Información Académica
                <span class="submenu-toggle">▼</span>
            </a>
            <ul class="submenu">
                <li class="submenu-item">
                    <a href="#" class="submenu-link">Materias</a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">Horario</a>
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
    </ul>
</div>

<!-- Contenido principal -->
<div class="main-content">
    <div class="page-header">
        <h2>Información estudiantil</h2>
        <p>Consulte su información personal, registro académico y datos de contacto</p>
    </div>

    <div class="profile-container">
        <!-- Carnet de estudiante -->
        <div class="student-card">
            <div class="card-corner"></div>
            <div class="card-header">
                <img src="https://via.placeholder.com/150x50/d9392b/ffffff?text=UFPS" alt="Logo Universidad" class="card-logo">
            </div>
            <div class="card-photo-container">
                <img src="https://via.placeholder.com/120" alt="Foto Estudiante" class="card-photo">
            </div>
            <div class="card-details">
                <h3 class="card-name">Juan David Rodriguez Perez</h3>
                <p class="card-info"><strong>C.C.:</strong> 1152436789</p>
                <p class="card-info"><strong>Código:</strong> 1161022</p>
                <p class="card-info"><strong>GS RH:</strong> A+</p>
            </div>
            <div class="card-role">
                Estudiante
            </div>
            <div class="card-corner-bottom"></div>
        </div>

        <!-- Detalles del perfil -->
        <div class="profile-details">
            <div class="tab-container">
                <div class="tab active" onclick="openTab('personal')">Información Personal</div>
                <div class="tab" onclick="openTab('academic')">Información Estudiante</div>
            </div>

            <!-- Contenido de Información Personal -->
            <div id="personal" class="tab-content active">
                <div class="info-row">
                    <div class="info-label">Teléfono:</div>
                    <div class="info-value">3214567890</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Fecha de Nacimiento:</div>
                    <div class="info-value">15/07/1998</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Edad:</div>
                    <div class="info-value">26</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Correo Electrónico:</div>
                    <div class="info-value">juandavid@gmail.com</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Correo Institucional:</div>
                    <div class="info-value">juandavidrp@ufps.edu.co</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Dirección:</div>
                    <div class="info-value">Calle 10 #15-23, Barrio Los Pinos</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Sexo:</div>
                    <div class="info-value">Masculino</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Teléfono Alterno:</div>
                    <div class="info-value">3015846974</div>
                </div>

                <div class="action-buttons">
                    <button class="action-btn btn-primary">
                        <i class="fas fa-edit"></i> Actualizar datos de contacto
                    </button>
                </div>
            </div>

            <!-- Contenido de Información Académica -->
            <div id="academic" class="tab-content">
                <div class="info-row">
                    <div class="info-label">Programa:</div>
                    <div class="info-value">Ingeniería de Sistemas</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Créditos Aprobados:</div>
                    <div class="info-value">112</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Promedio Ponderado:</div>
                    <div class="info-value">4.25</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Semestre Actual:</div>
                    <div class="info-value">8</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Estado:</div>
                    <div class="info-value">Activo</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Fecha de Ingreso:</div>
                    <div class="info-value">01/02/2021</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Porcentaje Avance:</div>
                    <div class="info-value">70%</div>
                </div>

                <div class="action-buttons">
                    <button class="action-btn btn-primary">
                        <i class="fas fa-sync"></i> Restablecer contraseña
                    </button>
                    <button class="action-btn btn-secondary">
                        <i class="fas fa-envelope"></i> Restablecer acceso Email Institucional
                    </button>
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