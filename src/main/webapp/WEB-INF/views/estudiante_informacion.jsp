<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Información de Persona</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <style>
    .card-header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
  </style>
</head>
<body class="bg-light">
<div class="container mt-4">
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="card shadow">
        <div class="card-header text-center">
          <h4 class="mb-0">
            <i class="fas fa-user-circle me-2"></i>
            Información Personal
          </h4>
        </div>
        <div class="card-body">
          <c:choose>
            <c:when test="${not empty persona}">
              <!-- ID -->
              <div class="info-row">
                <div class="row">
                  <div class="col-4">
                                            <span class="info-label">
                                                <i class="fas fa-hashtag icon"></i>ID:
                                            </span>
                  </div>
                  <div class="col-8">
                                            <span class="info-value">
                                                <c:choose>
                                                  <c:when test="${not empty persona.id}">
                                                    ${persona.id}
                                                  </c:when>
                                                  <c:otherwise>
                                                    <span class="empty-value">No especificado</span>
                                                  </c:otherwise>
                                                </c:choose>
                                            </span>
                  </div>
                </div>
              </div>

              <!-- Cédula -->
              <div class="info-row">
                <div class="row">
                  <div class="col-4">
                                            <span class="info-label">
                                                <i class="fas fa-id-card icon"></i>Cédula:
                                            </span>
                  </div>
                  <div class="col-8">
                                            <span class="info-value">
                                                <c:choose>
                                                  <c:when test="${not empty persona.cedula}">
                                                    <fmt:formatNumber value="${persona.cedula}" groupingUsed="true"/>
                                                  </c:when>
                                                  <c:otherwise>
                                                    <span class="empty-value">No especificada</span>
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
                                                  <c:when test="${not empty persona.nombre}">
                                                    ${persona.nombre}
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
                                                  <c:when test="${not empty persona.telefono}">
                                                        <a href="tel:${persona.telefono}" class="text-decoration-none">
                                                            <fmt:formatNumber value="${persona.telefono}" groupingUsed="true"/>
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

              <!-- Fecha de Nacimiento -->
              <div class="info-row">
                <div class="row">
                  <div class="col-4">
                                            <span class="info-label">
                                                <i class="fas fa-birthday-cake icon"></i>F. Nacimiento:
                                            </span>
                  </div>
                  <div class="col-8">
                                            <span class="info-value">
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
                                            </span>
                  </div>
                </div>
              </div>

              <!-- Correo Electrónico -->
              <div class="info-row">
                <div class="row">
                  <div class="col-4">
                                            <span class="info-label">
                                                <i class="fas fa-envelope icon"></i>Email Personal:
                                            </span>
                  </div>
                  <div class="col-8">
                                            <span class="info-value">
                                                <c:choose>
                                                  <c:when test="${not empty persona.correoElectronico}">
                                                        <a href="mailto:${persona.correoElectronico}" class="text-decoration-none">
                                                            ${persona.correoElectronico}
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

              <!-- Correo Institucional -->
              <div class="info-row">
                <div class="row">
                  <div class="col-4">
                                            <span class="info-label">
                                                <i class="fas fa-university icon"></i>Email Institucional:
                                            </span>
                  </div>
                  <div class="col-8">
                                            <span class="info-value">
                                                <c:choose>
                                                  <c:when test="${not empty persona.correoInstitucional}">
                                                        <a href="mailto:${persona.correoInstitucional}" class="text-decoration-none">
                                                            ${persona.correoInstitucional}
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

              <!-- Dirección -->
              <div class="info-row">
                <div class="row">
                  <div class="col-4">
                                            <span class="info-label">
                                                <i class="fas fa-map-marker-alt icon"></i>Dirección:
                                            </span>
                  </div>
                  <div class="col-8">
                                            <span class="info-value">
                                                <c:choose>
                                                  <c:when test="${not empty persona.direccion}">
                                                    ${persona.direccion}
                                                  </c:when>
                                                  <c:otherwise>
                                                    <span class="empty-value">No especificada</span>
                                                  </c:otherwise>
                                                </c:choose>
                                            </span>
                  </div>
                </div>
              </div>

              <!-- Sexo -->
              <div class="info-row">
                <div class="row">
                  <div class="col-4">
                                            <span class="info-label">
                                                <i class="fas fa-venus-mars icon"></i>Sexo:
                                            </span>
                  </div>
                  <div class="col-8">
                                            <span class="info-value">
                                                <c:choose>
                                                  <c:when test="${not empty persona.sexo}">
                                                    <c:choose>
                                                      <c:when test="${persona.sexo eq 'M' or persona.sexo eq 'MASCULINO'}">
                                                        <i class="fas fa-mars text-primary me-1"></i>Masculino
                                                      </c:when>
                                                      <c:when test="${persona.sexo eq 'F' or persona.sexo eq 'FEMENINO'}">
                                                        <i class="fas fa-venus text-danger me-1"></i>Femenino
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
                                            </span>
                  </div>
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="text-center py-4">
                <i class="fas fa-exclamation-triangle text-warning fa-3x mb-3"></i>
                <h5 class="text-muted">No se encontró información de la persona</h5>
                <p class="text-muted">No hay datos disponibles para mostrar.</p>
              </div>
            </c:otherwise>
          </c:choose>
        </div>

        <c:if test="${not empty persona}">
          <div class="card-footer bg-light">
            <div class="row">
              <div class="col-6">
                <button type="button" class="btn btn-outline-primary btn-sm" onclick="window.print()">
                  <i class="fas fa-print me-1"></i>Imprimir
                </button>
              </div>
              <div class="col-6 text-end">
                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="history.back()">
                  <i class="fas fa-arrow-left me-1"></i>Volver
                </button>
              </div>
                <div class="col-6 text-end">
                    <a href="historial" class="action-button">Historial</a>
                </div>
                <div class="col-6 text-end">
                    <a href="mi-horario" class="action-button">Horario</a>
                </div>
                <div class="col-6 text-end">
                    <a href="gestion" class="action-button">Matricula</a>
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