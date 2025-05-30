<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
            crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="http://localhost:3000/css/form-material.css" rel="stylesheet">
    <title><c:choose><c:when test="${material.id != null}">Editar Material</c:when><c:otherwise>Nuevo Material</c:otherwise></c:choose></title>

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
        <li><a href="http://localhost:3000/admin/materiales">Informe Materiales</a></li>


    </ul>
</nav>

<div id="contenido">
    <div class="header-section">
        <div class="header-content">
            <h1 class="page-title">
                <i class="fas fa-box"></i>
                <c:choose>
                    <c:when test="${material.id != null}">Editar Material</c:when>
                    <c:otherwise>Nuevo Material</c:otherwise>
                </c:choose>
            </h1>
            <p class="page-subtitle">
                <c:choose>
                    <c:when test="${material.id != null}">Modifica los datos del material seleccionado</c:when>
                    <c:otherwise>Completa la información para crear un nuevo material</c:otherwise>
                </c:choose>
            </p>
        </div>
    </div>

    <div class="main-content">
        <div class="breadcrumb-nav">
            <i class="fas fa-home"></i>
            <a href="${pageContext.request.contextPath}/admin/materiales">Materiales</a>
            <i class="fas fa-chevron-right"></i>
            <span>
                <c:choose>
                    <c:when test="${material.id != null}">Editar</c:when>
                    <c:otherwise>Nuevo</c:otherwise>
                </c:choose>
            </span>
        </div>

        <div class="form-container">
            <div class="form-title">
                <i class="fas fa-edit"></i>
                <c:choose>
                    <c:when test="${material.id != null}">Editar Material</c:when>
                    <c:otherwise>Crear Nuevo Material</c:otherwise>
                </c:choose>
            </div>
            <p class="form-subtitle">
                <c:choose>
                    <c:when test="${material.id != null}">Actualiza la información del material en el sistema</c:when>
                    <c:otherwise>Ingresa los datos del nuevo material educativo</c:otherwise>
                </c:choose>
            </p>

            <form action="${pageContext.request.contextPath}/admin/materiales<c:choose><c:when test="${material.id != null}">/${material.id}</c:when><c:otherwise/></c:choose>" method="post">

                <!-- Campos del Recurso -->
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label required-field">Nombre del Material</label>
                        <input type="text"
                               name="nombre"
                               class="form-control"
                               value="${recurso.nombre}"
                               placeholder="Ingrese el nombre del material"
                               required>
                        <small class="form-text">Nombre identificativo del material o recurso</small>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Ubicación</label>
                        <input type="text"
                               name="ubicacion"
                               class="form-control"
                               value="${recurso.ubicacion}"
                               placeholder="Ej: Aula 101, Laboratorio A">
                        <small class="form-text">Ubicación física del material</small>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Estado de la Materia</label>
                        <select name="estadoMateria" class="form-control form-select">
                            <option value="">-- Seleccione estado de materia --</option>
                            <option value="Nuevo" <c:if test="${recurso.estadoMateria eq 'Nuevo'}">selected</c:if>>
                                🆕 Nuevo
                            </option>
                            <option value="Usado" <c:if test="${recurso.estadoMateria eq 'Usado'}">selected</c:if>>
                                📦 Usado
                            </option>
                            <option value="Deteriorado" <c:if test="${recurso.estadoMateria eq 'Deteriorado'}">selected</c:if>>
                                ⚠️ Deteriorado
                            </option>
                        </select>
                        <small class="form-text">Condición física del material</small>
                    </div>

                    <!-- Campos del Material -->
                    <div class="form-group">
                        <label class="form-label required-field">Tipo de Material</label>
                        <select name="tipo" class="form-control form-select" required>
                            <option value="">-- Seleccione un tipo --</option>
                            <option value="Didactico" <c:if test="${material.tipo eq 'Didactico'}">selected</c:if>>
                                📚 Didactico
                            </option>
                            <option value="Tecnologico" <c:if test="${material.tipo eq 'Tecnologico'}">selected</c:if>>
                                💻 Tecnologico
                            </option>
                            <option value="Mobiliario" <c:if test="${material.tipo eq 'Mobiliario'}">selected</c:if>>
                                🪑 Mobiliario
                            </option>
                            <option value="Laboratorio" <c:if test="${material.tipo eq 'Laboratorio'}">selected</c:if>>
                                🔬 Laboratorio
                            </option>
                            <option value="Deportivo" <c:if test="${material.tipo eq 'Deportivo'}">selected</c:if>>
                                ⚽ Deportivo
                            </option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label required-field">Estado del Material</label>
                        <select name="estado" class="form-control form-select" required>
                            <option value="">-- Seleccione un estado --</option>
                            <option value="Disponible" <c:if test="${material.estado eq 'Disponible'}">selected</c:if>>
                                <span class="status-indicator status-disponible"></span>✅ Disponible
                            </option>
                            <option value="Reservado" <c:if test="${material.estado eq 'Reservado'}">selected</c:if>>
                                <span class="status-indicator status-reservado"></span>📋 Reservado
                            </option>
                            <option value="Mantenimiento" <c:if test="${material.estado eq 'Mantenimiento'}">selected</c:if>>
                                <span class="status-indicator status-mantenimiento"></span>🔧 Mantenimiento
                            </option>
                            <option value="Explotado" <c:if test="${material.estado eq 'Explotado'}">selected</c:if>>
                                <span class="status-indicator status-explotao"></span>❌ Explotado
                            </option>
                        </select>
                    </div>
                </div>

                <div class="btn-group">
                    <a href="${pageContext.request.contextPath}/admin/materiales" class="btn-secondary">
                        <i class="fas fa-times"></i>
                        Cancelar
                    </a>
                    <button type="submit" class="btn-primary">
                        <i class="fas fa-save"></i>
                        <c:choose>
                            <c:when test="${material.id != null}">Actualizar Material</c:when>
                            <c:otherwise>Crear Material</c:otherwise>
                        </c:choose>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>