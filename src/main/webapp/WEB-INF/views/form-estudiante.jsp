<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>
            <c:choose>
                <c:when test="${not empty estudiante.id}">Editar Estudiante</c:when>
                <c:otherwise>Nuevo Estudiante</c:otherwise>
            </c:choose>
        </title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- CSS Personalizado -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-styles.css">
    </head>
    <body class="estudiantes">
        <!-- Navegación Lateral -->
        <nav>
            <h2><i class="fas fa-graduation-cap"></i> Panel Admin</h2>
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/docentes">Docentes</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/estudiantes">Estudiantes</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/foros">Foros</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/personas">Personas</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/programas">Programas</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/semestres">Semestres</a>
                </li>
            </ul>
        </nav>

        <!-- Contenido Principal -->
        <main id="contenido">
            <!-- Header de Página -->
            <div class="header-section">
                <div class="header-content">
                    <h1 class="page-title">
                        <i class="fas fa-user-graduate"></i>
                        <c:choose>
                            <c:when test="${not empty estudiante.id}">Editar Estudiante</c:when>
                            <c:otherwise>Nuevo Estudiante</c:otherwise>
                        </c:choose>
                    </h1>
                    <p class="page-subtitle">Gestión de información estudiantil</p>
                </div>
            </div>

            <!-- Contenido Principal -->
            <div class="main-content">
                <div class="form-container animate-fade-in">
                    <form action="${pageContext.request.contextPath}/admin/estudiantes${not empty estudiante.id ? '/' : ''}${estudiante.id}"
                          method="post">


                        <div class="form-group">
                            <label for="codigoEstudiante">
                                <i class="fas fa-id-badge"></i> Código Estudiante:
                            </label>
                            <input type="number" 
                                   id="codigoEstudiante"
                                   name="codigoEstudiante" 
                                   class="form-control" 
                                   value="${estudiante.codigoEstudiante}" 
                                   required 
                                   placeholder="Ingrese el código del estudiante"/>
                        </div>

                        <div class="form-group">
                            <label for="programa">
                                <i class="fas fa-book"></i> Programa:
                            </label>
                            <select name="programa.id" id="programa" class="form-control" required>
                                <option value="">Seleccione un programa</option>
                                <c:forEach items="${programas}" var="p">
                                    <option value="${p.id}"
                                            <c:if test="${not empty estudiante.programa and estudiante.programa.id == p.id}">
                                                selected
                                            </c:if>
                                            >
                                        ${p.nombre}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="persona">
                                <i class="fas fa-user"></i> Persona:
                            </label>
                            <select name="persona.id" id="persona" class="form-control" required>
                                <option value="">Seleccione una persona</option>
                                <c:forEach items="${personas}" var="pers">
                                    <option value="${pers.id}"
                                            <c:if test="${not empty estudiante.persona and estudiante.persona.id == pers.id}">
                                                selected
                                            </c:if>
                                            >
                                        ${pers.nombre}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="modalidad">
                                        <i class="fas fa-laptop"></i> Modalidad:
                                    </label>
                                    <select name="modalidad" id="modalidad" class="form-control" required>
                                        <option value="">Seleccione modalidad</option>
                                        <option value="Presencial" ${estudiante.modalidad == 'Presencial' ? 'selected' : ''}>
                                            Presencial
                                        </option>
                                        <option value="Virtual" ${estudiante.modalidad == 'Virtual' ? 'selected' : ''}>
                                            Virtual
                                        </option>
                                        <option value="Mixta" ${estudiante.modalidad == 'Mixta' ? 'selected' : ''}>
                                            Mixta
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="jornada">
                                        <i class="fas fa-clock"></i> Jornada:
                                    </label>
                                    <select name="jornada" id="jornada" class="form-control" required>
                                        <option value="">Seleccione jornada</option>
                                        <option value="Diurna" ${estudiante.jornada == 'Diurna' ? 'selected' : ''}>
                                            Diurna
                                        </option>
                                        <option value="Nocturna" ${estudiante.jornada == 'Nocturna' ? 'selected' : ''}>
                                            Nocturna
                                        </option>
                                        <option value="Mixta" ${estudiante.jornada == 'Mixta' ? 'selected' : ''}>
                                            Mixta
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex gap-2 justify-content-between mt-4">
                            <button type="submit" class="btn">
                                <i class="fas fa-save"></i> Guardar
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/estudiantes" class="btn" style="background: #6c757d;">
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