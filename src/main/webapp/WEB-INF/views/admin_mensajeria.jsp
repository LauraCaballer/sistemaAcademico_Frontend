<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sistema de Mensajería - UFPS</title>
    <link rel="stylesheet" href="<c:url value='/css/mensajeria.css' />" />
    <style>
        nav {
            width: 280px;
            background: linear-gradient(180deg, #1a1a1a 0%, #2d2d2d 50%, #1a1a1a 100%);
            color: #ffffff;
            display: flex;
            flex-direction: column;
            box-shadow: 4px 0 20px rgba(0,0,0,0.15);
            position: relative;
            overflow: hidden;
        }

        nav::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, rgba(220, 38, 38, 0.05) 0%, transparent 50%, rgba(220, 38, 38, 0.05) 100%);
            pointer-events: none;
        }

        nav h2 {
            text-align: center;
            padding: 1.5rem 1rem;
            margin: 0;
            border-bottom: 2px solid rgba(220, 38, 38, 0.3);
            font-size: 1.4rem;
            font-weight: 700;
            background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
            color: white;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            position: relative;
            z-index: 1;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            position: relative;
            z-index: 1;
        }

        nav ul li {
            border-bottom: 1px solid rgba(255,255,255,0.1);
            position: relative;
            overflow: hidden;
        }

        nav ul li::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background: linear-gradient(180deg, #dc2626 0%, #b91c1c 100%);
            transform: scaleY(0);
            transition: transform 0.3s ease;
        }

        nav ul li:hover::before {
            transform: scaleY(1);
        }

        nav ul li a {
            display: flex;
            align-items: center;
            padding: 1rem 1.5rem;
            color: #e5e5e5;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
        }

        nav ul li a::before {
            content: '';
            margin-right: 12px;
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 1.1em;
            color: #dc2626;
            transition: all 0.3s ease;
        }

        nav ul li:nth-child(1) a::before { content: '\f19d'; } /* Docentes - chalkboard-teacher */
        nav ul li:nth-child(2) a::before { content: '\f501'; } /* Estudiantes - graduation-cap */
        nav ul li:nth-child(3) a::before { content: '\f086'; } /* Foros - comments */
        nav ul li:nth-child(4) a::before { content: '\f0c0'; } /* Personas - users */
        nav ul li:nth-child(5) a::before { content: '\f02d'; } /* Programas - book */
        nav ul li:nth-child(6) a::before { content: '\f133'; } /* Semestres - calendar-alt */

        nav ul li a:hover {
            background: linear-gradient(90deg, rgba(220, 38, 38, 0.1) 0%, rgba(220, 38, 38, 0.05) 100%);
            color: #ffffff;
            padding-left: 2rem;
            transform: translateX(4px);
        }

        nav ul li a:hover::before {
            color: #ffffff;
            transform: scale(1.2);
        }

        nav ul li a.active {
            background: linear-gradient(90deg, rgba(220, 38, 38, 0.2) 0%, rgba(220, 38, 38, 0.1) 100%);
            color: #ffffff;
            padding-left: 2rem;
            border-left: 4px solid #dc2626;
        }

        nav ul li a.active::before {
            color: #ffffff;
            transform: scale(1.1);
        }

        /* Indicador de secci�n activa */
        nav ul li:has(a[href*="docentes"]) a {
            background: linear-gradient(90deg, rgba(220, 38, 38, 0.15) 0%, rgba(220, 38, 38, 0.05) 100%);
            color: #ffffff;
            border-left: 4px solid #dc2626;
            padding-left: 2rem;
        }

        nav ul li:has(a[href*="docentes"]) a::before {
            color: #ffffff;
        }

        /* Footer de navegaci�n */
        nav::after {
            content: '';
            margin-top: auto;
            padding: 1rem;
            border-top: 1px solid rgba(255,255,255,0.1);
            background: linear-gradient(135deg, rgba(220, 38, 38, 0.1) 0%, transparent 100%);
        }
    </style>
</head>
<body>


<div class="container">
    <!-- Sidebar -->
    <nav>
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="http://localhost:3000/admin/docentes">Docentes</a></li>
            <li><a href="http://localhost:3000/admin/estudiantes">Estudiantes</a></li>
            <li><a href="http://localhost:3000/admin/foros">Foros</a></li>
            <li><a href="http://localhost:3000/admin/personas">Personas</a></li>
            <li><a href="http://localhost:3000/admin/programas">Programas</a></li>
            <li><a href="http://localhost:3000/admin/semestres">Semestres</a></li>
            <li class="active"><a href="http://localhost:3000/admin/mensajes">mensajeria</a></li>
            <li><a href="http://localhost:3000/admin/cursos">Cursos</a></li>
        </ul>
    </nav>




    <!-- Content Area -->
    <div class="content">
        <div class="page-header">
            <h1 class="page-title">Mensajería</h1>
            <div class="date-display"><fmt:formatDate value="${now}" pattern="EEEE dd 'de' MMMM 'de' yyyy" /></div>
        </div>

        <div class="messaging-container">
            <!-- Message List -->
            <div class="message-list">
                <div class="message-list-header">
                    <div class="filters">
                        <span>Mostrar:</span>
                        <select class="filter-dropdown" id="filterDropdown">
                            <option value="all">Todos</option>
                            <option value="unread">No leídos</option>
                            <option value="important">Importantes</option>
                        </select>
                    </div>
                    <input type="text" id="messageSearch" class="message-search" placeholder="Buscar..." />
                </div>

                <!-- Mensajes dinámicos -->
                <c:choose>
                    <c:when test="${not empty mensajes}">
                        <c:forEach var="msg" items="${mensajes}" varStatus="status">
                            <div class="message-item ${msg.leido ? 'read' : 'unread'} ${status.first ? 'selected' : ''}"
                                 data-id="${msg.id}"
                                 data-sender="${msg.remitente != null ? 'Usuario' : 'Desconocido'}"
                                 data-recipient="${msg.destinatario != null ? 'Destinatario' : 'Desconocido'}"
                                 data-subject="Mensaje #${msg.id}"
                                 data-date="<fmt:formatDate value='${msg.fechaEnvio}' pattern='dd/MM/yyyy HH:mm' />"
                                 data-body="${fn:escapeXml(msg.contenido)}">
                                <div class="message-sender">${msg.remitente != null ? 'Usuario' : 'Desconocido'}</div>
                                <div class="message-subject">Mensaje #${msg.id}</div>
                                <div class="message-preview">${fn:length(msg.contenido) > 80 ? fn:substring(msg.contenido, 0, 80) : msg.contenido}${fn:length(msg.contenido) > 80 ? '...' : ''}</div>
                                <div class="message-date"><fmt:formatDate value="${msg.fechaEnvio}" pattern="dd/MM/yyyy" /></div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="no-messages">
                            <p>No hay mensajes disponibles</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Message Content -->
            <div class="message-content" id="messageContent" style="display:flex;">
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
                            <div id="detailSender"></div>
                        </div>
                        <div class="message-header-row">
                            <div class="header-label">Para:</div>
                            <div id="detailRecipient"></div>
                        </div>
                        <div class="message-header-row">
                            <div class="header-label">Asunto:</div>
                            <div id="detailSubject"></div>
                        </div>
                        <div class="message-header-row">
                            <div class="header-label">Fecha:</div>
                            <div id="detailDate"></div>
                        </div>
                    </div>

                    <div class="message-body" id="detailBody">
                        <!-- Mensaje completo aquí -->
                    </div>
                </div>
            </div>

            <!-- Compose Message Form -->
            <div class="compose-container" id="composeContainer" style="display:none;">
                <h2>Nuevo Mensaje</h2>
                <form id="composeForm" action="<c:url value='/admin/mensajes' />" method="post">
                    <div class="form-group">
                        <label class="form-label" for="destinatarioId">Para (ID del destinatario):</label>
                        <input type="number" id="destinatarioId" name="destinatario.id" class="form-control" placeholder="Ingrese ID del destinatario..." required />
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="contenido">Mensaje:</label>
                        <textarea id="contenido" name="contenido" class="form-control" placeholder="Escriba su mensaje aquí..." required></textarea>
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
    // Al cargar la página, mostrar el detalle del primer mensaje seleccionado
    function showMessageDetails(element) {
        document.getElementById('detailSender').textContent = element.dataset.sender;
        document.getElementById('detailRecipient').textContent = element.dataset.recipient;
        document.getElementById('detailSubject').textContent = element.dataset.subject;
        document.getElementById('detailDate').textContent = element.dataset.date;
        document.getElementById('detailBody').textContent = element.dataset.body;
    }

    // Inicializar mostrando el primer mensaje
    const firstMsg = document.querySelector('.message-item.selected');
    if (firstMsg) {
        showMessageDetails(firstMsg);
    }

    // Manejar clic en mensajes para cambiar detalle y estilos
    document.querySelectorAll('.message-item').forEach(item => {
        item.addEventListener('click', () => {
            document.querySelectorAll('.message-item').forEach(i => i.classList.remove('selected'));
            item.classList.add('selected');
            item.classList.remove('unread');
            item.classList.add('read');

            // Mostrar detalles
            showMessageDetails(item);

            // Mostrar panel de detalle y ocultar compose
            document.getElementById('messageContent').style.display = 'flex';
            document.getElementById('composeContainer').style.display = 'none';
        });
    });

    // Botones nuevo y responder
    document.getElementById('newMessageButton').addEventListener('click', () => {
        document.getElementById('messageContent').style.display = 'none';
        document.getElementById('composeContainer').style.display = 'block';
        document.getElementById('composeForm').reset();
    });

    document.getElementById('replyButton').addEventListener('click', () => {
        const selected = document.querySelector('.message-item.selected');
        if (selected) {
            // Para responder, necesitarías el ID del remitente, no el nombre
            document.getElementById('destinatarioId').value = ''; // Aquí deberías tener el ID
            document.getElementById('contenido').value = '';
            document.getElementById('messageContent').style.display = 'none';
            document.getElementById('composeContainer').style.display = 'block';
        }
    });

    document.getElementById('cancelButton').addEventListener('click', () => {
        document.getElementById('composeContainer').style.display = 'none';
        document.getElementById('messageContent').style.display = 'flex';
        document.getElementById('composeForm').reset();
    });
</script>
</body>
</html>