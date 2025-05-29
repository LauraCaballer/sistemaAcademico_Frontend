<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Panel de Administración</title>
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            gap: 2rem;
        }
        .btn-admin {
            padding: 1.5rem 2.5rem;
            font-size: 1.25rem;
            border: none;
            border-radius: 0.5rem;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }
        .btn-admin:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center; margin-top: 2rem;">Panel de Administración</h1>
    <div class="container">
        <a href="/admin/personas" class="btn-admin">
            Gestionar Personas
        </a>
        <a href="/admin/programas" class="btn-admin">
            Gestionar Programas
        </a>
        <a href="/admin/semestres" class="btn-admin">
            Gestionar Semestres
        </a>
        <a href="/admin/foros" class="btn-admin">
            Gestionar Foros
        </a>
    </div>
</body>
</html>
