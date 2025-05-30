<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Información de Persona</title>
    <link rel="stylesheet" href="<c:url value='/css/estudiante_informacion.css' />" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
        }

        /* NAVEGACIÓN - MANTENER EXACTAMENTE COMO ESTÁ */
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

        nav ul li a:hover {
            background: linear-gradient(90deg, rgba(220, 38, 38, 0.1) 0%, rgba(220, 38, 38, 0.05) 100%);
            color: #ffffff;
            padding-left: 2rem;
            transform: translateX(4px);
        }

        /* CONTENIDO PRINCIPAL - NUEVO DISEÑO */
        .main-content {
            flex: 1;
            padding: 2rem;
            overflow-y: auto;
        }

        .profile-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .profile-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 20px 20px 0 0;
            padding: 3rem 2rem;
            text-align: center;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .profile-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="2" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23dots)"/></svg>');
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: linear-gradient(135deg, #fff 0%, #f0f0f0 100%);
            margin: 0 auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: #667eea;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            position: relative;
            z-index: 1;
        }

        .profile-name {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .profile-id {
            font-size: 1.2rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        .profile-body {
            background: white;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 0;
        }

        .info-card {
            padding: 2rem;
            border-bottom: 1px solid rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            position: relative;
            background: white;
        }

        .info-card:nth-child(even) {
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
        }

        .info-card:hover {
            background: linear-gradient(135deg, #ede9fe 0%, #ddd6fe 100%);
            transform: translateY(-2px);
        }

        .info-card::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background: linear-gradient(180deg, #667eea 0%, #764ba2 100%);
            transform: scaleY(0);
            transition: transform 0.3s ease;
        }

        .info-card:hover::before {
            transform: scaleY(1);
        }

        .info-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }

        .info-label {
            font-size: 0.9rem;
            font-weight: 600;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.5rem;
        }

        .info-value {
            font-size: 1.3rem;
            font-weight: 600;
            color: #1e293b;
            line-height: 1.4;
            word-break: break-word;
        }

        .info-value a {
            color: #667eea;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .info-value a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .empty-value {
            color: #94a3b8;
            font-style: italic;
            font-weight: 400;
        }

        .gender-icon {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .gender-icon .fa-mars {
            color: #3b82f6;
        }

        .gender-icon .fa-venus {
            color: #ec4899;
        }

        .action-bar {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            padding: 2rem;
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .action-btn {
            padding: 12px 24px;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border: none;
            cursor: pointer;
            font-family: inherit;
            font-size: 0.95rem;
        }

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6b7280 0%, #4b5563 100%);
            color: white;
        }

        .btn-success {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: white;
        }

        .no-data {
            text-align: center;
            padding: 4rem 2rem;
            color: #64748b;
        }

        .no-data i {
            font-size: 4rem;
            color: #f59e0b;
            margin-bottom: 1.5rem;
            opacity: 0.6;
        }

        /* Animaciones */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .profile-container {
            animation: fadeInUp 0.6s ease-out;
        }

        .info-card {
            animation: slideInRight 0.4s ease-out;
            animation-fill-mode: both;
        }

        .info-card:nth-child(1) { animation-delay: 0.1s; }
        .info-card:nth-child(2) { animation-delay: 0.2s; }
        .info-card:nth-child(3) { animation-delay: 0.3s; }
        .info-card:nth-child(4) { animation-delay: 0.4s; }
        .info-card:nth-child(5) { animation-delay: 0.5s; }
        .info-card:nth-child(6) { animation-delay: 0.6s; }
        .info-card:nth-child(7) { animation-delay: 0.7s; }
        .info-card:nth-child(8) { animation-delay: 0.8s; }
        .info-card:nth-child(9) { animation-delay: 0.9s; }

        /* Responsive */
        @media (max-width: 1024px) {
            .info-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }

            nav {
                width: 100%;
                max-height: 200px;
                overflow-y: auto;
            }

            .main-content {
                padding: 1rem;
            }

            .profile-header {
                padding: 2rem 1rem;
            }

            .profile-name {
                font-size: 2rem;
            }

            .profile-avatar {
                width: 80px;
                height: 80px;
                font-size: 2rem;
            }

            .info-card {
                padding: 1.5rem;
            }

            .action-bar {
                flex-direction: column;
                padding: 1.5rem;
            }

            .action-btn {
                justify-content: center;
            }
        }

        /* Estilos para impresión */
        @media print {
            body {
                background: white !important;
            }

            nav,
            .action-bar {
                display: none !important;
            }

            .main-content {
                padding: 0 !important;
            }

            .profile-header {
                background: #f0f0f0 !important;
                color: #000 !important;
            }

            .info-card {
                break-inside: avoid;
                border: 1px solid #ccc !important;
            }
        }
    </style>

</head>
<body class="bg-light">
<nav>
    <h2>Admin Panel</h2>
    <ul>
        <li><strong>Gestión Académica</strong></li>
        <li><a href="http://localhost:3000/estudiante/informacion">Información académica</a></li>
        <li><a href="http://localhost:3000/estudiante/historial">Historial Académico</a></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Materias</a></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Horario</a></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Notas</a></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Pensum</a></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Inclusiones</a></li>

        <li><strong>Solicitudes y Servicios</strong></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Cancelar Curso</a></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Solicitud de Materiales</a></li>

        <li><strong>Comunicación</strong></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Foro</a></li>
        <li><a href="http://localhost:3000/estudiante/mensajes">Mensajería</a></li>
    </ul>
</nav>

<div class="main-content">
    <div class="profile-container">
        <c:choose>
            <c:when test="${not empty persona}">
                <div class="profile-header">
                    <div class="profile-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <h1 class="profile-name">${persona.nombre}</h1>
                    <p class="profile-id">ID: ${persona.id}</p>
                </div>

                <div class="profile-body">
                    <div class="info-grid">
                        <!-- Cédula -->
                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-id-card"></i>
                            </div>
                            <div class="info-label">Cédula</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty persona.cedula}">
                                        <fmt:formatNumber value="${persona.cedula}" groupingUsed="true"/>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty-value">No especificada</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Teléfono -->
                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-phone"></i>
                            </div>
                            <div class="info-label">Teléfono</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty persona.telefono}">
                                        <a href="tel:${persona.telefono}">
                                            <fmt:formatNumber value="${persona.telefono}" groupingUsed="true"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty-value">No especificado</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Fecha de Nacimiento -->
                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-birthday-cake"></i>
                            </div>
                            <div class="info-label">Fecha de Nacimiento</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty persona.fechaNacimiento}">
                                        <fmt:parseDate value="${persona.fechaNacimiento}"
                                                       pattern="yyyy-MM-dd'T'HH:mmX"
                                                       var="parsedDate" type="both"/>
                                        <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy"/>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty-value">No especificada</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Email Personal -->
                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="info-label">Email Personal</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty persona.correoElectronico}">
                                        <a href="mailto:${persona.correoElectronico}">
                                                ${persona.correoElectronico}
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty-value">No especificado</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Email Institucional -->
                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-university"></i>
                            </div>
                            <div class="info-label">Email Institucional</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty persona.correoInstitucional}">
                                        <a href="mailto:${persona.correoInstitucional}">
                                                ${persona.correoInstitucional}
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty-value">No especificado</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Dirección -->
                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="info-label">Dirección</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty persona.direccion}">
                                        ${persona.direccion}
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty-value">No especificada</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Sexo -->
                        <div class="info-card">
                            <div class="info-icon">
                                <i class="fas fa-venus-mars"></i>
                            </div>
                            <div class="info-label">Sexo</div>
                            <div class="info-value">
                                <c:choose>
                                    <c:when test="${not empty persona.sexo}">
                                        <c:choose>
                                            <c:when test="${persona.sexo eq 'M' or persona.sexo eq 'MASCULINO'}">
                                                <span class="gender-icon">
                                                    <i class="fas fa-mars"></i>Masculino
                                                </span>
                                            </c:when>
                                            <c:when test="${persona.sexo eq 'F' or persona.sexo eq 'FEMENINO'}">
                                                <span class="gender-icon">
                                                    <i class="fas fa-venus"></i>Femenino
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                ${persona.sexo}
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="empty-value">No especificado</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <div class="action-bar">
                        <button type="button" class="action-btn btn-primary" onclick="window.print()">
                            <i class="fas fa-print"></i>Imprimir
                        </button>
                        <button type="button" class="action-btn btn-secondary" onclick="history.back()">
                            <i class="fas fa-arrow-left"></i>Volver
                        </button>
                        <a href="historial" class="action-btn btn-success">
                            <i class="fas fa-history"></i>Historial
                        </a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="profile-header">
                    <div class="profile-avatar">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>
                    <h1 class="profile-name">Sin información</h1>
                </div>
                <div class="profile-body">
                    <div class="no-data">
                        <i class="fas fa-exclamation-triangle"></i>
                        <h3>No se encontró información de la persona</h3>
                        <p>No hay datos disponibles para mostrar.</p>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

        <c:if test="${not empty persona}">
          <div class="card-footer bg-light">
            <div class="row">

              <div class="col-6 text-end">

              </div>

            </div>
          </div>
        </c:if>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style media="print">
  .btn, .card-footer {
    display: none !important;
  }
  .card {
    box-shadow: none !important;
    border: 1px solid #000 !important;
  }
</style>
</body>
</html>