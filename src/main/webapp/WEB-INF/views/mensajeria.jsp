<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Mensajería - UFPS</title>
    <link rel="stylesheet" href="<c:url value='/css/mensajeria.css' />" />

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
                        <li><a href="#" class="submenu-link">Foros</a></li>
                        <li><a href="#" class="submenu-link active">Mensajes</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </aside>

    <!-- Content Area -->
    <div class="content">
        <div class="page-header">
            <h1 class="page-title">Mensajería</h1>
            <div class="date-display">Martes 06 de Mayo de 2025</div>
        </div>

        <div class="messaging-container">
            <!-- Message List -->
            <div class="message-list">
                <div class="message-list-header">
                    <div class="filters">
                        <span>Mostrar:</span>
                        <select class="filter-dropdown">
                            <option value="all">Todos</option>
                            <option value="unread">No leídos</option>
                            <option value="important">Importantes</option>
                        </select>
                    </div>
                    <input type="text" class="message-search" placeholder="Buscar...">
                </div>

                <!-- Message Items -->
                <div class="message-item unread selected">
                    <div class="message-sender">Docente grupo 1155604-B</div>
                    <div class="message-subject">Confirmación presentación de baterías</div>
                    <div class="message-preview">Buenos días jóvenes, para confirmar por este medio que el previo será para el día martes 06 de mayo del 2025...</div>
                    <div class="message-date">28/04/2025</div>
                </div>

                <div class="message-item read">
                    <div class="message-sender">Docente grupo 1155604-B</div>
                    <div class="message-subject">Cambio en horario de clase</div>
                    <div class="message-preview">Buenas noches jóvenes, disculpen la hora pero el motivo del presente es para informar que por temas personales...</div>
                    <div class="message-date">06/04/2025</div>
                </div>

                <div class="message-item read">
                    <div class="message-sender">Vicerrectoría Bienestar Universitario UFPS</div>
                    <div class="message-subject">Solicitud de Restaurante UFPS</div>
                    <div class="message-preview">Su solicitud para acceder al servicio de Restaurante UFPS ha sido aceptada, a partir de este momento...</div>
                    <div class="message-date">23/02/2025</div>
                </div>

                <div class="message-item read">
                    <div class="message-sender">Divisist</div>
                    <div class="message-subject">Encuesta MEN</div>
                    <div class="message-preview">Deberá realizar la encuesta MEN para continuar consultando la información académica de manera normal...</div>
                    <div class="message-date">13/02/2025</div>
                </div>

                <div class="message-item read">
                    <div class="message-sender">Divisist 2.0</div>
                    <div class="message-subject">Error en matrícula</div>
                    <div class="message-preview">Ha Fallado el intento de Matricular 1155615A. Supera el Límite de 20 Creditos (21)</div>
                    <div class="message-date">23/01/2025</div>
                </div>

                <div class="message-item read">
                    <div class="message-sender">Gerencia Electronica UFPS</div>
                    <div class="message-subject">Pago de liquidación</div>
                    <div class="message-preview">Te informamos que el pago de tu liquidacion "Vir total de Matrícula I-2025" ha sido reportado con exito.</div>
                    <div class="message-date">20/01/2025</div>
                </div>
            </div>

            <!-- Message Content -->
            <div class="message-content" id="messageContent">
                <div class="message-content-header">
                    <h2>Detalles del mensaje</h2>
                    <div class="message-actions">
                        <button class="action-button" id="replyButton">Responder</button>
                        <button class="action-button" id="newMessageButton">Nuevo mensaje</button>
                    </div>
                </div>

                <div class="message-details">
                    <div class="message-header-details">
                        <div class="message-header-row">
                            <div class="header-label">De:</div>
                            <div>Docente grupo 1155604-B</div>
                        </div>
                        <div class="message-header-row">
                            <div class="header-label">Para:</div>
                            <div>Juan David</div>
                        </div>
                        <div class="message-header-row">
                            <div class="header-label">Asunto:</div>
                            <div>Confirmación presentación de baterías</div>
                        </div>
                        <div class="message-header-row">
                            <div class="header-label">Fecha:</div>
                            <div>28/04/2025 10:23:16</div>
                        </div>
                    </div>

                    <div class="message-body">
                        <p>Buenos días jóvenes,</p>
                        <br>
                        <p>Para confirmar por este medio que el previo será para el día martes 06 de mayo del 2025. El día de mañana seguimos con la presentación de las baterías, gracias.</p>
                        <br>
                        <p>Cordialmente,</p>
                        <p>Profesor Juan Carlos Rodríguez</p>
                        <p>Departamento de Sistemas e Informática</p>
                        <p>Universidad Francisco de Paula Santander</p>
                    </div>
                </div>
            </div>

            <!-- Compose Message Form -->
            <div class="compose-container" id="composeContainer">
                <h2>Nuevo Mensaje</h2>
                <form id="composeForm">
                    <div class="form-group">
                        <label class="form-label" for="recipient">Para:</label>
                        <input type="text" id="recipient" class="form-control" placeholder="Ingrese destinatario o seleccione...">
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="subject">Asunto:</label>
                        <input type="text" id="subject" class="form-control" placeholder="Asunto del mensaje">
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="messageBody">Mensaje:</label>
                        <textarea id="messageBody" class="form-control" placeholder="Escriba su mensaje aquí..."></textarea>
                    </div>
                    <div class="compose-actions">
                        <button type="button" class="secondary-button" id="cancelButton">Cancelar</button>
                        <button type="submit" class="action-button">Enviar mensaje</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Toggle between read message and compose form
    document.getElementById('newMessageButton').addEventListener('click', function() {
        document.getElementById('messageContent').style.display = 'none';
        document.getElementById('composeContainer').style.display = 'block';
    });

    document.getElementById('replyButton').addEventListener('click', function() {
        document.getElementById('messageContent').style.display = 'none';
        document.getElementById('composeContainer').style.display = 'block';
        document.getElementById('recipient').value = 'Docente grupo 1155604-B';
        document.getElementById('subject').value = 'RE: Confirmación presentación de baterías';
    });

    document.getElementById('cancelButton').addEventListener('click', function() {
        document.getElementById('composeContainer').style.display = 'none';
        document.getElementById('messageContent').style.display = 'flex';
        document.getElementById('composeForm').reset();
    });

    // Select message when clicked
    const messageItems = document.querySelectorAll('.message-item');
    messageItems.forEach(item => {
        item.addEventListener('click', function() {
            messageItems.forEach(i => i.classList.remove('selected'));
            this.classList.add('selected');
            this.classList.remove('unread');
            this.classList.add('read');

            // Show message content and hide compose form
            document.getElementById('messageContent').style.display = 'flex';
            document.getElementById('composeContainer').style.display = 'none';
        });
    });

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