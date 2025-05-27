<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal Académico - Calificaciones</title>
    <link rel="stylesheet" href="<c:url value='/css/calificaciones.css' />" />
</head>
<body>
<!-- Header principal -->
<header>
    <div class="logo">ESTUDIANTES</div>
    <div class="header-right">
        <div class="notification-icon">
            <span>🔔</span>
            <span class="notification-badge">1</span>
        </div>
        <div class="user-info-header">
            <span>Juan David</span>
            <div class="user-avatar">
                <img src="/api/placeholder/35/35" alt="User">
            </div>
        </div>
    </div>
</header>

<div class="container">
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
            <li class="nav-item active expanded">
                <div class="nav-menu-container">
                    <div class="nav-link nav-menu-title">
                        <i class="fas fa-comments">💬</i>
                        <span>Comunicación</span>
                        <span class="arrow">▶</span>
                    </div>
                    <ul class="nav-submenu">
                        <li><a href="#" class="submenu-link active">Foros</a></li>
                        <li><a href="#" class="submenu-link">Mensajes</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </aside>

    <!-- Contenido principal -->
    <main>
        <div class="content-header">
            <h1 class="page-title">Calificaciones del Semestre</h1>
            <div class="date-display">Martes 06 de Mayo de 2025</div>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="card-title">
                    <div class="material-icon">📊</div>
                    Materias Matriculadas con Calificaciones
                </div>
            </div>
            <div class="card-body">
                <table>
                    <thead>
                    <tr>
                        <th>Código</th>
                        <th>Materia</th>
                        <th>Profesor</th>
                        <th>1er Parcial</th>
                        <th>2do Parcial</th>
                        <th>3er Parcial</th>
                        <th>Definitiva</th>
                        <th>Estado</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1155511</td>
                        <td>PROBLEMAS SOCIALES DE FRONTERA</td>
                        <td>
                            <div>Wilson de Jesús</div>
                            <a href="mailto:wilsondejesuscm@ufps.edu.co" class="professor-email">wilsondejesuscm@ufps.edu.co</a>
                        </td>
                        <td class="centered"><span class="grade-pill grade-medium">3.8</span></td>
                        <td class="centered"><span class="grade-pill grade-high">4.5</span></td>
                        <td class="centered">-</td>
                        <td class="centered"><span class="grade-pill grade-medium">4.2</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="status-dot status-active"></span>
                                <span>En curso</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1155604</td>
                        <td>SISTEMAS OPERATIVOS</td>
                        <td>
                            <div>Miguel Fabianra</div>
                            <a href="mailto:miguelfabianra@ufps.edu.co" class="professor-email">miguelfabianra@ufps.edu.co</a>
                        </td>
                        <td class="centered"><span class="grade-pill grade-medium">3.5</span></td>
                        <td class="centered"><span class="grade-pill grade-medium">3.9</span></td>
                        <td class="centered">-</td>
                        <td class="centered"><span class="grade-pill grade-medium">3.7</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="status-dot status-active"></span>
                                <span>En curso</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1155605</td>
                        <td>BASES DE DATOS</td>
                        <td>
                            <div>Janet Peña</div>
                            <a href="mailto:janethpc@ufps.edu.co" class="professor-email">janethpc@ufps.edu.co</a>
                        </td>
                        <td class="centered"><span class="grade-pill grade-high">4.7</span></td>
                        <td class="centered"><span class="grade-pill grade-high">4.5</span></td>
                        <td class="centered">-</td>
                        <td class="centered"><span class="grade-pill grade-high">4.6</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="status-dot status-active"></span>
                                <span>En curso</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1155606</td>
                        <td>PROGRAMACION WEB</td>
                        <td>
                            <div>Jonathan Rolando</div>
                            <a href="mailto:jonathanrolandorc@ufps.edu.co" class="professor-email">jonathanrolandorc@ufps.edu.co</a>
                        </td>
                        <td class="centered"><span class="grade-pill grade-low">2.9</span></td>
                        <td class="centered"><span class="grade-pill grade-medium">3.8</span></td>
                        <td class="centered">-</td>
                        <td class="centered"><span class="grade-pill grade-medium">3.4</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="status-dot status-warning"></span>
                                <span>Alerta</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1155607</td>
                        <td>CONSTITUCION Y CIVISMO</td>
                        <td>
                            <div>Nestor Javier</div>
                            <a href="mailto:nestorjavierario@ufps.edu.co" class="professor-email">nestorjavierario@ufps.edu.co</a>
                        </td>
                        <td class="centered"><span class="grade-pill grade-high">4.8</span></td>
                        <td class="centered"><span class="grade-pill grade-high">4.6</span></td>
                        <td class="centered">-</td>
                        <td class="centered"><span class="grade-pill grade-high">4.7</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="status-dot status-active"></span>
                                <span>En curso</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1155608</td>
                        <td>PLANEACION ESTRATEGICA DE SISTEMAS DE INF</td>
                        <td>
                            <div>Nelly Rosana</div>
                            <a href="mailto:nellyrosanadi@ufps.edu.co" class="professor-email">nellyrosanadi@ufps.edu.co</a>
                        </td>
                        <td class="centered"><span class="grade-pill grade-medium">4.0</span></td>
                        <td class="centered"><span class="grade-pill grade-medium">3.8</span></td>
                        <td class="centered">-</td>
                        <td class="centered"><span class="grade-pill grade-medium">3.9</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="status-dot status-active"></span>
                                <span>En curso</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>1155609</td>
                        <td>SEMINARIO INTEGRADOR II</td>
                        <td>
                            <div>Carlos Pardo</div>
                            <a href="mailto:carlospardo@ufps.edu.co" class="professor-email">carlospardo@ufps.edu.co</a>
                        </td>
                        <td class="centered"><span class="grade-pill grade-high">4.3</span></td>
                        <td class="centered"><span class="grade-pill grade-medium">4.0</span></td>
                        <td class="centered">-</td>
                        <td class="centered"><span class="grade-pill grade-high">4.2</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="status-dot status-active"></span>
                                <span>En curso</span>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="semester-average">
                    <div class="average-label">Promedio del semestre actual (18 créditos matriculados)</div>
                    <div class="average-value">
                        <span class="grade-large">4.1</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="summary-grid">
            <div class="summary-card">
                <div class="summary-title">Promedio del semestre actual</div>
                <div class="summary-value">4.1</div>
                <div class="progress-bar-container">
                    <div class="progress-bar" style="width: 82%;"></div>
                </div>
            </div>
            <div class="summary-card">
                <div class="summary-title">Promedio ponderado acumulado</div>
                <div class="summary-value">4.46</div>
                <div class="badge badge-success">Sobresaliente</div>
            </div>
            <div class="summary-card">
                <div class="summary-title">Créditos matriculados</div>
                <div class="summary-value">18</div>
            </div>
            <div class="summary-card">
                <div class="summary-title">Créditos acumulados</div>
                <div class="summary-value">101</div>
                <div class="badge badge-success">60% completado</div>
            </div>
        </div>

        <div class="action-buttons">
            <a href="#" class="button btn-primary">Descargar Historial</a>
            <a href="#" class="button btn-outline">Solicitar Certificado</a>
        </div>
    </main>
</div>

<script>
    // Script para manejar la expansión de los menús desplegables
    document.querySelectorAll('.nav-menu-title').forEach(item => {
        item.addEventListener('click', event => {
            const parent = event.currentTarget.closest('.nav-item');
            parent.classList.toggle('expanded');
            parent.classList.toggle('active');
        });
    });

    // Script para manejar las pestañas (solo si existen en el DOM)
    const activeTab = document.querySelector('.tab.active');
    if (activeTab) {
        document.querySelectorAll('.tab').forEach(tab => {
            tab.addEventListener('click', () => {
                const current = document.querySelector('.tab.active');
                if (current) current.classList.remove('active');
                tab.classList.add('active');
                // Aquí iría la lógica para cambiar el contenido de las pestañas
            });
        });
    }
</script>
</body>
</html>