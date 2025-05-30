<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Matrícula</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
        }

        .sidebar {
            width: 280px;
            background: linear-gradient(180deg, #dc2626 0%, #b91c1c 100%);
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
            box-shadow: 4px 0 15px rgba(220, 38, 38, 0.15);
        }

        .sidebar h4 {
            color: white;
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 25px;
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
            letter-spacing: 0.5px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar li {
            margin-bottom: 8px;
        }

        .sidebar a {
            display: block;
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            padding: 14px 18px;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 500;
            border-left: 3px solid transparent;
        }

        .sidebar a:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            transform: translateX(5px);
            border-left-color: white;
        }

        .sidebar a[style*="font-weight:bold"] {
            background-color: rgba(255, 255, 255, 0.15);
            color: white;
            border-left-color: #fef2f2;
        }

        .main-content {
            flex-grow: 1;
            padding: 30px 40px;
            margin-left: 280px;
            background-color: #ffffff;
            min-height: 100vh;
        }

        .main-content h3 {
            color: #dc2626;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
            position: relative;
        }

        .main-content h3::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #dc2626, #ef4444);
            border-radius: 2px;
        }

        .main-content > p {
            color: #6b7280;
            font-size: 16px;
            margin-bottom: 30px;
            margin-top: 20px;
        }

        .main-content > p strong {
            color: #dc2626;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 14px;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        th, td {
            padding: 16px 12px;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
        }

        th {
            background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
            color: white;
            font-weight: 600;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            position: sticky;
            top: 0;
        }

        tbody tr {
            transition: all 0.2s ease;
        }

        tbody tr:hover {
            background-color: #fef2f2;
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(220, 38, 38, 0.1);
        }

        .message {
            padding: 16px 20px;
            margin-bottom: 25px;
            border-radius: 10px;
            text-align: center;
            font-weight: 500;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .success {
            background: linear-gradient(135deg, #dcfce7 0%, #bbf7d0 100%);
            color: #166534;
            border: 1px solid #16a34a;
            border-left: 5px solid #16a34a;
        }

        .error {
            background: linear-gradient(135deg, #fef2f2 0%, #fecaca 100%);
            color: #991b1b;
            border: 1px solid #dc2626;
            border-left: 5px solid #dc2626;
        }

        .info {
            background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%);
            color: #1e40af;
            border: 1px solid #3b82f6;
            border-left: 5px solid #3b82f6;
        }

        .button-link {
            display: inline-block;
            padding: 10px 20px;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-cancelar {
            color: #fff;
            background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
            box-shadow: 0 4px 15px rgba(220, 38, 38, 0.3);
        }

        .btn-cancelar:hover {
            background: linear-gradient(135deg, #b91c1c 0%, #991b1b 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(220, 38, 38, 0.4);
        }

        .btn-matricular {
            color: #fff;
            background: linear-gradient(135deg, #16a34a 0%, #15803d 100%);
            box-shadow: 0 4px 15px rgba(22, 163, 74, 0.3);
        }

        .btn-matricular:hover {
            background: linear-gradient(135deg, #15803d 0%, #166534 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(22, 163, 74, 0.4);
        }

        .action-column {
            width: 120px;
            text-align: center;
        }

        .table-container {
            margin-bottom: 50px;
            background: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            border: 1px solid #f1f5f9;
        }

        .table-container h4 {
            color: #dc2626;
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 12px;
        }

        .table-container h4::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 3px;
            background: linear-gradient(90deg, #dc2626, #ef4444);
            border-radius: 2px;
        }

        .table-container p.error {
            background: linear-gradient(135deg, #fef2f2 0%, #fecaca 100%);
            color: #991b1b;
            padding: 12px 16px;
            border-radius: 8px;
            border-left: 4px solid #dc2626;
            margin: 15px 0;
        }

        .table-container p.info {
            background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%);
            color: #1e40af;
            padding: 12px 16px;
            border-radius: 8px;
            border-left: 4px solid #3b82f6;
            margin: 15px 0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 10px 8px;
            }

            .button-link {
                padding: 8px 16px;
                font-size: 12px;
            }
        }

        /* Loading animation for buttons */
        .button-link:active {
            transform: translateY(0);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        /* Custom scrollbar for sidebar */
        .sidebar::-webkit-scrollbar {
            width: 6px;
        }

        .sidebar::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.1);
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.3);
            border-radius: 3px;
        }

        .sidebar::-webkit-scrollbar-thumb:hover {
            background: rgba(255, 255, 255, 0.5);
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h4>NAVEGACIÓN ESTUDIANTE</h4>
    <ul>
        <li><a href="<c:url value='/estudiante/informacion'/>">📋 Datos Personales</a></li>
        <li><a href="<c:url value='/estudiante/historial'/>">📚 Historial Académico</a></li>
        <li><a href="<c:url value='/matricula/gestion'/>" style="font-weight:bold;">🎓 Matrícula de Materias</a></li>
        <li><a href="<c:url value=''/>">📅 Mi Horario</a></li>
        <li><a href="<c:url value='/logout'/>">🚪 Cerrar sesión</a></li>
    </ul>
</div>

<div class="main-content">
    <h3>Gestión de Matrícula</h3>
    <c:if test="${not empty estudiante && not empty estudiante.persona}">
        <p>Estudiante: <strong><c:out value="${estudiante.persona.nombre}"/></strong></p>
    </c:if>

    <c:if test="${not empty successMessage}"> <div class="message success"><c:out value="${successMessage}"/></div> </c:if>
    <c:if test="${not empty errorMessage}"> <div class="message error"><c:out value="${errorMessage}"/></div> </c:if>
    <c:if test="${not empty globalError}"> <div class="message error"><c:out value="${globalError}"/></div> </c:if>

    <div class="table-container">
        <h4>📖 Mis Cursos Matriculados (Estado: Cursando)</h4>
        <c:if test="${not empty errorMatriculados}"> <p class="error"><c:out value="${errorMatriculados}"/></p> </c:if>
        <c:choose>
            <c:when test="${not empty cursosMatriculados}">
                <table>
                    <thead>
                    <tr>
                        <th>Asignatura</th>
                        <th>Código Asig.</th>
                        <th>Grupo</th>
                        <th>Semestre Curso</th>
                        <th class="action-column">Acción</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ec" items="${cursosMatriculados}">
                        <tr>
                            <td><c:out value="${ec.curso.asignatura.nombre}"/></td>
                            <td><c:out value="${ec.curso.asignatura.codigo}"/></td>
                            <td><c:out value="${ec.curso.grupo}"/></td>
                            <td><c:out value="${ec.curso.semestre.periodo}"/>-<c:out value="${ec.curso.semestre.anio}"/></td>
                            <td class="action-column">
                                <form action="<c:url value='/estudiante/cancelar/${ec.id}'/>" method="post" style="display:inline;">
                                    <input type="hidden" name="_method" value="PUT">
                                    <button type="submit" class="button-link btn-cancelar" onclick="return confirm('¿Está seguro de que desea cancelar la matrícula de este curso?');">❌ Cancelar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <c:if test="${empty errorMatriculados && empty globalError}">
                    <p class="info">📝 No tienes cursos matriculados en estado "Cursando" actualmente.</p>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="table-container">
        <h4>🎯 Cursos Disponibles para Matricular</h4>
        <c:if test="${not empty errorDisponibles}"> <p class="error"><c:out value="${errorDisponibles}"/></p> </c:if>
        <c:if test="${not empty infoDisponibles}"> <p class="info"><c:out value="${infoDisponibles}"/></p> </c:if>
        <c:choose>
            <c:when test="${not empty cursosDisponibles}">
                <table>
                    <thead>
                    <tr>
                        <th>Asignatura</th>
                        <th>Código Asig.</th>
                        <th>Créditos</th>
                        <th>Grupo</th>
                        <th>Cupos Máx.</th>
                        <th>Semestre Curso</th>
                        <th class="action-column">Acción</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="curso" items="${cursosDisponibles}">
                        <tr>
                            <td><c:out value="${curso.asignatura.nombre}"/></td>
                            <td><c:out value="${curso.asignatura.codigo}"/></td>
                            <td><c:out value="${curso.asignatura.creditos}"/></td>
                            <td><c:out value="${curso.grupo}"/></td>
                            <td><c:out value="${curso.cupoMaximo}"/></td>
                            <td><c:out value="${curso.semestre.periodo}"/>-<c:out value="${curso.semestre.anio}"/></td>
                            <td class="action-column">
                                <form action="<c:url value='/estudiante/inscribir/${curso.id}'/>" method="post" style="display:inline;">
                                    <button type="submit" class="button-link btn-matricular">✅ Matricular</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <c:if test="${empty errorDisponibles && empty infoDisponibles && empty globalError}">
                    <p class="info">📋 No hay cursos disponibles para matricular en este momento que cumplan con tus prerrequisitos y el pensum.</p>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>