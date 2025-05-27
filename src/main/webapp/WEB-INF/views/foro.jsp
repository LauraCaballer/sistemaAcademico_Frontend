<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Foros - UFPS</title>
    <link rel="stylesheet" href="<c:url value='/css/foro.css' />" />

</head>
<body>
<!-- Header -->
<header>
    <div class="logo">ESTUDIANTES</div>
    <div class="header-actions">
        <div class="notification-icon">
            <span>🔔</span>
            <span class="notification-badge">8</span>
        </div>
        <div class="user-info">
            <span>Juan David</span>
            <div class="user-avatar">
                <img src="/api/placeholder/32/32" alt="User">
            </div>
        </div>
        <div>🔄</div>
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

    <!-- Content Area -->
    <div class="content">
        <div class="page-header">
            <h1 class="page-title">Foros de Discusión</h1>
            <div class="date-display">Martes 06 de Mayo de 2025</div>
        </div>

        <div class="forum-container">
            <!-- Forum Categories Sidebar -->
            <div class="forum-sidebar">
                <div class="forum-category active">
                    <div class="forum-category-title">Programación Orientada a Objetos</div>
                    <div class="forum-category-desc">Discusiones sobre principios y conceptos de POO</div>
                    <div class="category-stats">
                        <span>21 temas</span>
                        <span>85 mensajes</span>
                    </div>
                </div>

                <div class="forum-category">
                    <div class="forum-category-title">Estructura de Datos</div>
                    <div class="forum-category-desc">Análisis y aplicación de estructuras de datos</div>
                    <div class="category-stats">
                        <span>15 temas</span>
                        <span>64 mensajes</span>
                    </div>
                </div>

                <div class="forum-category">
                    <div class="forum-category-title">Bases de Datos</div>
                    <div class="forum-category-desc">Discusiones sobre SQL y gestión de BBDD</div>
                    <div class="category-stats">
                        <span>18 temas</span>
                        <span>72 mensajes</span>
                    </div>
                </div>

                <div class="forum-category">
                    <div class="forum-category-title">Sistemas Operativos</div>
                    <div class="forum-category-desc">Conceptos y prácticas sobre SO</div>
                    <div class="category-stats">
                        <span>12 temas</span>
                        <span>47 mensajes</span>
                    </div>
                </div>

                <div class="forum-category">
                    <div class="forum-category-title">Ingeniería de Software</div>
                    <div class="forum-category-desc">Metodologías y prácticas de desarrollo</div>
                    <div class="category-stats">
                        <span>16 temas</span>
                        <span>59 mensajes</span>
                    </div>
                </div>

                <div class="forum-category">
                    <div class="forum-category-title">Anuncios Generales</div>
                    <div class="forum-category-desc">Comunicados importantes para estudiantes</div>
                    <div class="category-stats">
                        <span>8 temas</span>
                        <span>24 mensajes</span>
                    </div>
                </div>
            </div>

            <!-- Topic List Container -->
            <div class="topic-list-container" id="topicListContainer">
                <div class="topic-list-header">
                    <div class="category-navigation">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Foros</a></li>
                            <li class="breadcrumb-item breadcrumb-current">Programación Orientada a Objetos</li>
                        </ul>
                    </div>
                    <div class="topic-actions">
                        <input type="text" class="topic-search" placeholder="Buscar en este foro...">
                        <button class="action-button" id="newTopicButton">Nuevo tema</button>
                    </div>
                </div>

                <div class="topic-filters">
                    <div class="filter-group">
                        <span class="filter-label">Ordenar por:</span>
                        <select class="filter-select">
                            <option value="recent">Más recientes</option>
                            <option value="popular">Más populares</option>
                            <option value="replies">Más respuestas</option>
                            <option value="views">Más vistas</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <span class="filter-label">Mostrar:</span>
                        <select class="filter-select">
                            <option value="all">Todos los temas</option>
                            <option value="unread">No leídos</option>
                            <option value="solved">Resueltos</option>
                            <option value="unsolved">Sin resolver</option>
                        </select>
                    </div>
                </div>

                <div class="topic-list">
                    <!-- Topic Items -->
                    <div class="topic-item unread" data-topic="1">
                        <div class="topic-status">
                            <span class="topic-status-icon">📢</span>
                        </div>
                        <div class="topic-main">
                            <div class="topic-title">Consulta sobre herencia múltiple en Java</div>
                            <div class="topic-preview">Estoy intentando implementar un sistema con herencia múltiple pero tengo problemas con la implementación...</div>
                            <div class="topic-meta">
                                <div class="topic-author">
                                    <div class="author-avatar">
                                        <img src="/api/placeholder/20/20" alt="Author">
                                    </div>
                                    <span>Laura Gómez</span>
                                </div>
                            </div>
                        </div>
                        <div class="topic-stats">
                            <div class="stats-replies">12 Respuestas</div>
                            <div>243 Vistas</div>
                        </div>
                        <div class="topic-last-post">
                            <div>Por: Prof. Carlos Méndez</div>
                            <div class="last-post-time">Hoy, 10:45 AM</div>
                        </div>
                    </div>

                    <div class="topic-item" data-topic="2">
                        <div class="topic-status">
                            <span class="topic-status-icon">✅</span>
                        </div>
                        <div class="topic-main">
                            <div class="topic-title">Polimorfismo y su aplicación en proyectos reales</div>
                            <div class="topic-preview">Me gustaría conocer ejemplos concretos donde el polimorfismo sea realmente útil en el desarrollo...</div>
                            <div class="topic-meta">
                                <div class="topic-author">
                                    <div class="author-avatar">
                                        <img src="/api/placeholder/20/20" alt="Author">
                                    </div>
                                    <span>Miguel Ángel Torres</span>
                                </div>
                            </div>
                        </div>
                        <div class="topic-stats">
                            <div class="stats-replies">8 Respuestas</div>
                            <div>156 Vistas</div>
                        </div>
                        <div class="topic-last-post">
                            <div>Por: Ana Martínez</div>
                            <div class="last-post-time">Ayer, 16:30 PM</div>
                        </div>
                    </div>

                    <div class="topic-item" data-topic="3">
                        <div class="topic-status">
                            <span class="topic-status-icon">❓</span>
                        </div>
                        <div class="topic-main">
                            <div class="topic-title">¿Cuándo usar interfaces en lugar de clases abstractas?</div>
                            <div class="topic-preview">Tengo dudas sobre cuándo es más conveniente usar una interfaz en vez de una clase abstracta en Java...</div>
                            <div class="topic-meta">
                                <div class="topic-author">
                                    <div class="author-avatar">
                                        <img src="/api/placeholder/20/20" alt="Author">
                                    </div>
                                    <span>Andrés Pérez</span>
                                </div>
                            </div>
                        </div>
                        <div class="topic-stats">
                            <div class="stats-replies">5 Respuestas</div>
                            <div>98 Vistas</div>
                        </div>
                        <div class="topic-last-post">
                            <div>Por: Prof. Sandra Ríos</div>
                            <div class="last-post-time">Hace 2 días</div>
                        </div>
                    </div>
                </div> <!-- topic-list -->
            </div> <!-- topic-list-container -->
        </div> <!-- forum-container -->
    </div> <!-- content -->
</div> <!-- container -->

<!-- Footer opcional -->
<footer class="footer">
    <div class="footer-content">
        <span>&copy; 2025 Universidad Francisco de Paula Santander. Todos los derechos reservados.</span>
    </div>
</footer>
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