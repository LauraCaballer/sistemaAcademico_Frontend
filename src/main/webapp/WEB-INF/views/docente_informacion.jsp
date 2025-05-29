<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Información de Docente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .card-header {
            background: linear-gradient(135deg, #23a6d5 0%, #23d5ab 100%);
            color: white;
        }
        .info-row {
            border-bottom: 1px solid #e9ecef;
            padding: 12px 0;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        .info-label {
            font-weight: 600;
            color: #495057;
        }
        .info-value {
            color: #212529;
        }
        .icon {
            width: 20px;
            text-align: center;
            margin-right: 8px;
            color: #6c757d;
        }
        .empty-value {
            color: #6c757d;
            font-style: italic;
        }
        .action-button {
            display: inline-block;
            padding: .375rem .75rem;
            border: 1px solid #6c757d;
            border-radius: .25rem;
            color: #6c757d;
            text-decoration: none;
            transition: background .3s;
        }
        .action-button:hover {
            background: #f8f9fa;
            color: #495057;
        }
    </style>
</head>
<body class="bg-light">
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow">
                <div class="card-header text-center">
                    <h4 class="mb-0">
                        <i class="fas fa-chalkboard-teacher me-2"></i>
                        Información de Docente
                    </h4>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${not empty docente}">
                            <!-- Código Docente -->
                            <div class="info-row">
                                <div class="row">
                                    <div class="col-4">
                    <span class="info-label">
                      <i class="fas fa-hashtag icon"></i>Código:
                    </span>
                                    </div>
                                    <div class="col-8">
                    <span class="info-value">
                      <c:choose>
                          <c:when test="${not empty docente.codigoDocente}">
                              ${docente.codigoDocente}
                          </c:when>
                          <c:otherwise>
                              <span class="empty-value">No especificado</span>
                          </c:otherwise>
                      </c:choose>
                    </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Nombre -->
                            <div class="info-row">
                                <div class="row">
                                    <div class="col-4">
                    <span class="info-label">
                      <i class="fas fa-user icon"></i>Nombre:
                    </span>
                                    </div>
                                    <div class="col-8">
                    <span class="info-value">
                      <c:choose>
                          <c:when test="${not empty docente.persona.nombre}">
                              ${docente.persona.nombre}
                          </c:when>
                          <c:otherwise>
                              <span class="empty-value">No especificado</span>
                          </c:otherwise>
                      </c:choose>
                    </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Correo Institucional -->
                            <div class="info-row">
                                <div class="row">
                                    <div class="col-4">
                    <span class="info-label">
                      <i class="fas fa-envelope icon"></i>Email Institucional:
                    </span>
                                    </div>
                                    <div class="col-8">
                    <span class="info-value">
                      <c:choose>
                          <c:when test="${not empty docente.persona.correoInstitucional}">
                          <a href="mailto:${docente.persona.correoInstitucional}" class="text-decoration-none">
                                  ${docente.persona.correoInstitucional}
                          </a>
                          </c:when>
                          <c:otherwise>
                              <span class="empty-value">No especificado</span>
                          </c:otherwise>
                      </c:choose>
                    </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Teléfono -->
                            <div class="info-row">
                                <div class="row">
                                    <div class="col-4">
                    <span class="info-label">
                      <i class="fas fa-phone icon"></i>Teléfono:
                    </span>
                                    </div>
                                    <div class="col-8">
                    <span class="info-value">
                      <c:choose>
                          <c:when test="${not empty docente.persona.telefono}">
                          <a href="tel:${docente.persona.telefono}" class="text-decoration-none">
                            <fmt:formatNumber value="${docente.persona.telefono}" groupingUsed="true"/>
                          </a>
                          </c:when>
                          <c:otherwise>
                              <span class="empty-value">No especificado</span>
                          </c:otherwise>
                      </c:choose>
                    </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Área o Departamento -->
                            <div class="info-row">
                                <div class="row">
                                    <div class="col-4">
                    <span class="info-label">
                      <i class="fas fa-building icon"></i>Departamento:
                    </span>
                                    </div>
                                    <div class="col-8">
                    <span class="info-value">
                      <c:choose>
                          <c:when test="${not empty docente.departamento}">
                              ${docente.departamento}
                          </c:when>
                          <c:otherwise>
                              <span class="empty-value">No especificado</span>
                          </c:otherwise>
                      </c:choose>
                    </span>
                                    </div>
                                </div>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-4">
                                <i class="fas fa-exclamation-triangle text-warning fa-3x mb-3"></i>
                                <h5 class="text-muted">No se encontró información del docente</h5>
                                <p class="text-muted">Verifica tu sesión o contacta con soporte.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <c:if test="${not empty docente}">
                    <div class="card-footer bg-light">
                        <div class="row">
                            <div class="col-4">
                                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="history.back()">
                                    <i class="fas fa-arrow-left me-1"></i>Volver
                                </button>
                            </div>
                            <div class="col-4 text-center">
                                <a href="${pageContext.request.contextPath}/docente/cursos" class="action-button">
                                    <i class="fas fa-book-open me-1"></i>Mis Cursos
                                </a>
                            </div>
                            <div class="col-4 text-end">
                                <button type="button" class="btn btn-outline-primary btn-sm" onclick="window.print()">
                                    <i class="fas fa-print me-1"></i>Imprimir
                                </button>
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
    .btn, .card-footer, .action-button {
        display: none !important;
    }
    .card {
        box-shadow: none !important;
        border: 1px solid #000 !important;
    }
</style>
</body>
</html>
