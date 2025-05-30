<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <title>Listado de Docentes</title>
        <style>
            body {
                margin: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                display: flex;
                height: 100vh;
                background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            }
            
            /* Navbar mejorada */
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
            
            /* Contenido mejorado */
            #contenido {
                flex: 1;
                padding: 0;
                overflow-y: auto;
                background: linear-gradient(135deg, #fff5f5 0%, #ffe8e8 100%);
            }
            
            .header-section {
                background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
                color: white;
                padding: 2rem;
                box-shadow: 0 4px 20px rgba(220, 38, 38, 0.3);
                position: relative;
                overflow: hidden;
            }
            
            .header-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="25" cy="75" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="25" r="1" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23grain)"/></svg>');
                opacity: 0.1;
            }
            
            .header-content {
                position: relative;
                z-index: 1;
            }
            
            .page-title {
                font-size: 2.5rem;
                font-weight: 700;
                margin: 0 0 0.5rem 0;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            }
            
            .page-subtitle {
                font-size: 1.1rem;
                opacity: 0.9;
                margin: 0;
                font-weight: 300;
            }
            
            .main-content {
                padding: 2rem;
                max-width: 1200px;
                margin: 0 auto;
            }
            
            .action-bar {
                background: white;
                padding: 1.5rem;
                border-radius: 15px;
                box-shadow: 0 8px 32px rgba(0,0,0,0.1);
                margin-bottom: 2rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-left: 5px solid #dc2626;
            }
            
            .btn-nuevo {
                background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
                border: none;
                padding: 12px 24px;
                border-radius: 25px;
                color: white;
                text-decoration: none;
                font-weight: 600;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(220, 38, 38, 0.3);
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }
            
            .btn-nuevo:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(220, 38, 38, 0.4);
                color: white;
            }
            
            .stats-info {
                color: #6b7280;
                font-size: 0.95rem;
            }
            
            .table-container {
                background: white;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 20px 60px rgba(0,0,0,0.1);
                border: 1px solid rgba(220, 38, 38, 0.1);
            }
            
            .table {
                margin: 0;
                border-collapse: separate;
                border-spacing: 0;
            }
            
            .table thead th {
                background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
                color: white;
                font-weight: 600;
                font-size: 0.95rem;
                padding: 1.2rem 1rem;
                border: none;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                position: relative;
            }
            
            .table thead th:first-child {
                border-top-left-radius: 0;
            }
            
            .table thead th:last-child {
                border-top-right-radius: 0;
            }
            
            .table tbody tr {
                transition: all 0.3s ease;
                border-bottom: 1px solid rgba(220, 38, 38, 0.1);
            }
            
            .table tbody tr:hover {
                background: linear-gradient(135deg, rgba(254, 242, 242, 0.8) 0%, rgba(254, 226, 226, 0.5) 100%);
                transform: scale(1.01);
            }
            
            .table tbody td {
                padding: 1.2rem 1rem;
                vertical-align: middle;
                border: none;
                font-size: 0.95rem;
            }
            
            .table tbody tr:last-child td:first-child {
                border-bottom-left-radius: 20px;
            }
            
            .table tbody tr:last-child td:last-child {
                border-bottom-right-radius: 20px;
            }
            
            .id-badge {
                background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%);
                color: #dc2626;
                padding: 6px 12px;
                border-radius: 20px;
                font-weight: 600;
                font-size: 0.85rem;
                border: 1px solid rgba(220, 38, 38, 0.2);
            }
            
            .codigo-badge {
                background: #f8fafc;
                color: #1e293b;
                padding: 6px 12px;
                border-radius: 15px;
                font-family: 'Courier New', monospace;
                font-weight: 600;
                font-size: 0.9rem;
                border: 1px solid #e2e8f0;
            }
            
            .btn-editar {
                background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
                border: none;
                color: white;
                padding: 8px 16px;
                border-radius: 20px;
                font-size: 0.85rem;
                font-weight: 500;
                transition: all 0.3s ease;
                margin-right: 8px;
            }
            
            .btn-editar:hover {
                background: linear-gradient(135deg, #b91c1c 0%, #991b1b 100%);
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(220, 38, 38, 0.3);
                color: white;
            }
            
            .btn-eliminar {
                background: linear-gradient(135deg, #7f1d1d 0%, #991b1b 100%);
                border: none;
                color: white;
                padding: 8px 16px;
                border-radius: 20px;
                font-size: 0.85rem;
                font-weight: 500;
                transition: all 0.3s ease;
            }
            
            .btn-eliminar:hover {
                background: linear-gradient(135deg, #991b1b 0%, #7f1d1d 100%);
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(127, 29, 29, 0.4);
            }
            
            .programa-info {
                font-weight: 600;
                color: #dc2626;
            }
            
            .persona-info {
                font-weight: 600;
                color: #374151;
            }
            
            .experiencia-info {
                font-weight: 600;
                color: #374151;
            }
            
            .empty-state {
                text-align: center;
                padding: 4rem 2rem;
                color: #6b7280;
            }
            
            .empty-state i {
                font-size: 4rem;
                color: #dc2626;
                margin-bottom: 1rem;
                opacity: 0.5;
            }
            
            @media (max-width: 768px) {
                .action-bar {
                    flex-direction: column;
                    gap: 1rem;
                    align-items: stretch;
                }
                
                .table-responsive {
                    border-radius: 15px;
                }
                
                .main-content {
                    padding: 1rem;
                }
                
                .header-section {
                    padding: 1.5rem;
                }
                
                .page-title {
                    font-size: 2rem;
                }
            }
        </style>
    </head>
    <body>
        <nav>
            <h2>Admin Panel</h2>
            <ul>
                <li><a href="http://localhost:3000/admin/docentes">Docentes</a></li>
                <li><a href="http://localhost:3000/admin/estudiantes">Estudiantes</a></li>
                <li><a href="http://localhost:3000/admin/foros">Foros</a></li>
                <li><a href="http://localhost:3000/admin/personas">Personas</a></li>
                <li><a href="http://localhost:3000/admin/programas">Programas</a></li>
                <li><a href="http://localhost:3000/admin/semestres">Semestres</a></li>
                <li><a href="http://localhost:3000/admin/mensajes">mensajeria</a></li>
            </ul>
        </nav>
        
        <div id="contenido">
            <div class="header-section">
                <div class="header-content">
                    <h1 class="page-title">
                        <i class="fas fa-chalkboard-teacher"></i>
                        Gesti�n de Docentes
                    </h1>
                    <p class="page-subtitle">Administra y supervisa la informaci�n de todos los docentes</p>
                </div>
            </div>
            
            <div class="main-content">
                <div class="action-bar">
                    <div class="stats-info">
                        <i class="fas fa-users"></i>
                        Total de docentes registrados: <strong>${docentes.size()}</strong>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/docentes/nuevo" class="btn-nuevo">
                        <i class="fas fa-plus"></i>
                        Crear Nuevo Docente
                    </a>
                </div>

                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                                <tr>
                                    <th><i class="fas fa-hashtag me-2"></i>ID</th>
                                    <th><i class="fas fa-barcode me-2"></i>C�digo</th>
                                    <th><i class="fas fa-star me-2"></i>Experiencia</th>
                                    <th><i class="fas fa-graduation-cap me-2"></i>Programa</th>
                                    <th><i class="fas fa-user me-2"></i>Persona</th>
                                    <th><i class="fas fa-cogs me-2"></i>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty docentes}">
                                        <tr>
                                            <td colspan="6" class="empty-state">
                                                <i class="fas fa-inbox"></i>
                                                <h5>No hay docentes registrados</h5>
                                                <p>Comienza agregando el primer docente al sistema</p>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${docentes}" var="d">
                                            <tr>
                                                <td>
                                                    <span class="id-badge">#${d.id}</span>
                                                </td>
                                                <td>
                                                    <span class="codigo-badge">${d.codigoDocente}</span>
                                                </td>
                                                <td>
                                                    <span class="experiencia-info">
                                                        ${d.experiencia} a�os
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="programa-info">
                                                        <i class="fas fa-graduation-cap me-1"></i>
                                                        ${d.programa.nombre}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="persona-info">
                                                        <i class="fas fa-user-circle me-1"></i>
                                                        ${d.persona.nombre}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a class="btn btn-sm btn-editar"
                                                       href="${pageContext.request.contextPath}/admin/docentes/${d.id}/editar">
                                                        <i class="fas fa-edit me-1"></i>
                                                        Editar
                                                    </a>
                                                    <form action="${pageContext.request.contextPath}/admin/docentes/${d.id}/eliminar"
                                                          method="post"
                                                          style="display:inline">
                                                        <button type="submit"
                                                                class="btn btn-sm btn-eliminar"
                                                                onclick="return confirm('�Est�s seguro de que deseas eliminar este docente?');">
                                                            <i class="fas fa-trash me-1"></i>
                                                            Eliminar
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>