<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>
            <c:choose>
                <c:when test="${not empty docente.id}">Editar Docente</c:when>
                <c:otherwise>Nuevo Docente</c:otherwise>
            </c:choose>
        </title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- CSS Personalizado -->
        <link rel="stylesheet" href="http://localhost:3000/css/admin-styles.css">
    </head>
    <body class="docentes">
        <!-- Navegaci�n Lateral -->
        <nav>
            <h2><i class="fas fa-graduation-cap"></i> Panel Admin</h2>
            <ul>
                <li><a href="http://localhost:3000/admin/docentes">Docentes</a></li>
                <li class="active"><a href="http://localhost:3000/admin/estudiantes">Estudiantes</a></li>
                <li><a href="http://localhost:3000/admin/foros">Foros</a></li>
                <li><a href="http://localhost:3000/admin/personas">Personas</a></li>
                <li><a href="http://localhost:3000/admin/programas">Programas</a></li>
                <li><a href="http://localhost:3000/admin/semestres">Semestres</a></li>
            </ul>
        </nav>

        <!-- Contenido Principal -->
        <main id="contenido">
            <!-- Header de P�gina -->
            <div class="header-section">
                <div class="header-content">
                    <h1 class="page-title">
                        <i class="fas fa-chalkboard-teacher"></i>
                        <c:choose>
                            <c:when test="${not empty docente.id}">Editar Docente</c:when>
                            <c:otherwise>Nuevo Docente</c:otherwise>
                        </c:choose>
                    </h1>
                    <p class="page-subtitle">Gesti�n de informaci�n docente</p>
                </div>
            </div>

            <!-- Contenido Principal -->
            <div class="main-content">
                <div class="form-container animate-fade-in">
                    <form action="${pageContext.request.contextPath}/admin/docentes${not empty docente.id ? '/' : ''}${docente.id}"
                          method="post">

                        <div class="form-group">
                            <label for="codigoDocente">
                                <i class="fas fa-id-card"></i> C�digo Docente:
                            </label>
                            <input type="number" 
                                   id="codigoDocente"
                                   name="codigoDocente" 
                                   class="form-control" 
                                   value="${docente.codigoDocente}" 
                                   required 
                                   placeholder="Ingrese el c�digo del docente"/>
                        </div>

                        <div class="form-group">
                            <label for="experiencia">
                                <i class="fas fa-briefcase"></i> Experiencia:
                            </label>
                            <textarea name="experiencia" 
                                      id="experiencia"
                                      class="form-control" 
                                      rows="4" 
                                      placeholder="Describa la experiencia profesional del docente">${docente.experiencia}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="programa">
                                <i class="fas fa-book"></i> Programa:
                            </label>
                            <select name="programa.id" id="programa" class="form-control" required>
                                <option value="">Seleccione un programa</option>
                                <c:forEach items="${programas}" var="p">
                                    <option value="${p.id}"
                                            <c:if test="${not empty docente.programa and docente.programa.id == p.id}">
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
                                            <c:if test="${not empty docente.persona and docente.persona.id == pers.id}">
                                                selected
                                            </c:if>
                                            >
                                        ${pers.nombre}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="d-flex gap-2 justify-content-between mt-4">
                            <button type="submit" class="btn">
                                <i class="fas fa-save"></i> Guardar
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/docentes" class="btn" style="background: #6c757d;">
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