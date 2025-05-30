<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:choose>
            <c:when test="${not empty asignatura.id}">Editar Asignatura</c:when>
            <c:otherwise>Nueva Asignatura</c:otherwise>
        </c:choose>
    </title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- CSS Personalizado -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-styles.css">
</head>
<body class="asignaturas">
<!-- Navegaci�n Lateral -->
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

<!-- Contenido Principal -->
<main id="contenido">
    <!-- Header de P�gina -->
    <div class="header-section">
        <div class="header-content">
            <h1 class="page-title">
                <i class="fas fa-book-open"></i>
                <c:choose>
                    <c:when test="${not empty asignatura.id}">Editar Asignatura</c:when>
                    <c:otherwise>Nueva Asignatura</c:otherwise>
                </c:choose>
            </h1>
            <p class="page-subtitle">Gesti�n de asignaturas acad�micas</p>
        </div>
    </div>

    <!-- Contenido Principal -->
    <div class="main-content">
        <div class="form-container animate-fade-in">
            <form action="${pageContext.request.contextPath}/admin/asignaturas${not empty asignatura.id ? '/' : ''}${asignatura.id}"
                  method="post">

                <div class="form-group">
                    <label for="codigo">
                        <i class="fas fa-code"></i> C�digo:
                    </label>
                    <input type="text"
                           id="codigo"
                           name="codigo"
                           class="form-control"
                           value="${asignatura.codigo}"
                           required
                           placeholder="Ingrese el c�digo de la asignatura"/>
                </div>

                <div class="form-group">
                    <label for="nombre">
                        <i class="fas fa-bookmark"></i> Nombre:
                    </label>
                    <input type="text"
                           id="nombre"
                           name="nombre"
                           class="form-control"
                           value="${asignatura.nombre}"
                           required
                           placeholder="Ingrese el nombre de la asignatura"/>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="semestre">
                                <i class="fas fa-calendar-alt"></i> Semestre:
                            </label>
                            <input type="number"
                                   id="semestre"
                                   name="semestre"
                                   class="form-control"
                                   value="${asignatura.semestre}"
                                   min="1"
                                   max="10"
                                   required
                                   placeholder="Semestre"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="creditos">
                                <i class="fas fa-star"></i> Cr�ditos:
                            </label>
                            <input type="number"
                                   id="creditos"
                                   name="creditos"
                                   class="form-control"
                                   value="${asignatura.creditos}"
                                   min="1"
                                   max="10"
                                   required
                                   placeholder="Cr�ditos"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="horas">
                                <i class="fas fa-clock"></i> Horas:
                            </label>
                            <input type="number"
                                   id="horas"
                                   name="horas"
                                   class="form-control"
                                   value="${asignatura.horas}"
                                   min="1"
                                   max="20"
                                   required
                                   placeholder="Horas"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="tipoAsignatura">
                        <i class="fas fa-tags"></i> Tipo de Asignatura:
                    </label>
                    <select name="tipoAsignatura" id="tipoAsignatura" class="form-control" required>
                        <option value="">Seleccione el tipo de asignatura</option>
                        <option value="OBLIGATORIA"
                                <c:if test="${asignatura.tipoAsignatura == 'OBLIGATORIA'}">selected</c:if>>
                            Obligatoria
                        </option>
                        <option value="ELECTIVA"
                                <c:if test="${asignatura.tipoAsignatura == 'ELECTIVA'}">selected</c:if>>
                            Electiva
                        </option>
                        <option value="PRACTICA"
                                <c:if test="${asignatura.tipoAsignatura == 'PRACTICA'}">selected</c:if>>
                            Pr�ctica
                        </option>
                        <option value="FUNDAMENTACION"
                                <c:if test="${asignatura.tipoAsignatura == 'FUNDAMENTACION'}">selected</c:if>>
                            Fundamentaci�n
                        </option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="pensum">
                        <i class="fas fa-list-alt"></i> Pensum:
                    </label>
                    <select name="pensum.id" id="pensum" class="form-control" required>
                        <option value="">Seleccione un pensum</option>
                        <c:forEach items="${pensums}" var="p">
                            <option value="${p.id}"
                                    <c:if test="${not empty asignatura.pensum and asignatura.pensum.id == p.id}">
                                        selected
                                    </c:if>>
                                    ${p.nombre} (${p.anio})
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="d-flex gap-2 justify-content-between mt-4">
                    <button type="submit" class="btn">
                        <i class="fas fa-save"></i> Guardar
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/asignaturas" class="btn" style="background: #6c757d;">
                        <i class="fas fa-times"></i> Cancelar
                    </a>
                </div>
            </form>
        </div>
    </div>
</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>