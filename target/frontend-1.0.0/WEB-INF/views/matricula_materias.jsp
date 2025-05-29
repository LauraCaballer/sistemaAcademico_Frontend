<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matrícula Académica - Cancelación de Materias</title>
    <link rel="stylesheet" href="<c:url value='/css/matricula_materias.css' />" />

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
                <span class="page-subtitle">Cancelación de Materias</span>
            </div>
            <div class="date-display">
                Martes 05 de Mayo de 2025
            </div>
        </div>

        <!-- Información importante -->
        <div class="content-card">
            <div class="card-header">
                <i>⚠</i> Información sobre Cancelación de Materias
            </div>
            <div class="card-body">
                <div class="warning-box">
                    <h4 class="warning-title">Información importante sobre cancelaciones</h4>
                    <ul class="warning-list">
                        <li>Tienes hasta el <strong>15 de Mayo de 2025</strong> para cancelar materias sin afectación académica.</li>
                        <li>La cancelación de materias puede afectar tu promedio y estado académico, te recomendamos consultar con tu asesor académico.</li>
                        <li>Recuerda que debes mantener matriculados al menos 8 créditos para conservar tu estado como estudiante activo.</li>
                        <li>Si cancelas una materia prerequerida para otras, no podrás matricular las dependientes en el siguiente semestre.</li>
                    </ul>
                </div>

                <div class="progress-tracker">
                    <div class="progress-steps">
                        <div class="step completed">1</div>
                        <div class="step active">2</div>
                        <div class="step">3</div>
                        <div class="step">4</div>
                    </div>
                    <div class="step-labels">
                        <div class="step-label">Selección</div>
                        <div class="step-label active">Cancelación</div>
                        <div class="step-label">Confirmación</div>
                        <div class="step-label">Completado</div>
                    </div>
                </div>

                <div class="info-box">
                    <h4 class="info-title">Estado actual de tu matrícula</h4>
                    <div style="display: flex; flex-wrap: wrap; gap: 2rem; margin-top: 1rem;">
                        <div>
                            <span style="font-weight: 500;">Materias inscritas:</span>
                            <span style="margin-left: 0.5rem; font-weight: 600;">5</span>
                        </div>
                        <div>
                            <span style="font-weight: 500;">Total créditos:</span>
                            <span style="margin-left: 0.5rem; font-weight: 600;">17 / 21</span>
                        </div>
                        <div>
                            <span style="font-weight: 500;">Periodo:</span>
                            <span style="margin-left: 0.5rem; font-weight: 600;">2025-1</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Filtros -->
        <div class="content-card">
            <div class="card-header">
                <i>🔍</i> Filtrar Materias
            </div>
            <div class="card-body">
                <div class="filters-container">
                    <div class="filter-group">
                        <label class="form-label">Estado</label>
                        <select class="form-control">
                            <option selected>Todas</option>
                            <option>Activas</option>
                            <option>En proceso de cancelación</option>
                            <option>Canceladas</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label class="form-label">Tipo</label>
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
                            <input type="text" class="form-control search-input" placeholder="Buscar por nombre o código...">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Listado de materias -->
        <div class="content-card">
            <div class="card-header">
                <i>📚</i> Materias Actualmente Matriculadas
            </div>
            <div class="card-body">
                <div class="course-item">
                    <div class="course-header">
                        <div>
                            <div class="course-title">Cálculo Vectorial</div>
                            <div class="course-code">MAT1103 - Grupo 01</div>
                        </div>
                        <span class="status-badge status-active">Activa</span>
                    </div>
                    <div class="course-details">
                        <div class="detail-item">
                            <span class="detail-label">Profesor</span>
                            <span class="detail-value">Pedro García</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Créditos</span>
                            <span class="detail-value">4</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Horario</span>
                            <span class="detail-value">LU-MI-VI 8:00-10:00</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Tipo</span>
                            <span class="detail-value">Obligatoria</span>
                        </div>
                    </div>
                    <div class="course-actions">
                        <label class="checkbox-group">
                            <input type="checkbox" class="custom-checkbox">
                            <span>Seleccionar para cancelar</span>
                        </label>
                        <button class="btn btn-danger" onclick="openCancelModal('MAT1103')">Cancelar materia</button>
                    </div>
                </div>

                <div class="course-item">
                    <div class="course-header">
                        <div>
                            <div class="course-title">Física Moderna</div>
                            <div class="course-code">FIS1018 - Grupo 02</div>
                        </div>
                        <span class="status-badge status-active">Activa</span>
                    </div>
                    <div class="course-details">
                        <div class="detail-item">
                            <span class="detail-label">Profesor</span>
                            <span class="detail-value">Laura Ramírez</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Créditos</span>
                            <span class="detail-value">3</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Horario</span>
                            <span class="detail-value">MA-JU 10:00-12:00</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Tipo</span>
                            <span class="detail-value">Obligatoria</span>
                        </div>
                    </div>
                    <div class="course-actions">
                        <label class="checkbox-group">
                            <input type="checkbox" class="custom-checkbox">
                            <span>Seleccionar para cancelar</span>
                        </label>
                        <button class="btn btn-danger" onclick="openCancelModal('FIS1018')">Cancelar materia</button>
                    </div>
                </div>
                <!-- Puedes añadir más materias aquí si lo deseas -->
            </div>
        </div>
    </div> <!-- Fin de content -->
</div> <!-- Fin de main-container -->

<!-- Modal de cancelación -->
<div id="cancelModal" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close" onclick="closeCancelModal()">&times;</span>
        <h3>Confirmar Cancelación</h3>
        <p>¿Estás seguro de que deseas cancelar esta materia?</p>
        <div class="modal-actions">
            <button class="btn btn-secondary" onclick="closeCancelModal()">Cancelar</button>
            <button class="btn btn-danger">Confirmar</button>
        </div>
    </div>
</div>

<!-- Scripts -->
<script>
    function openCancelModal(code) {
        document.getElementById("cancelModal").style.display = "block";
        // Puedes pasar el código si necesitas usarlo
        console.log("Cancelando materia:", code);
    }

    function closeCancelModal() {
        document.getElementById("cancelModal").style.display = "none";
    }

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
