<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value='/css/login.css' />" />
</head>
<body>
<h1>Inicio Sesion</h1>
<form th:action="@{/login}" method="post">
    <div>
        <label for="username">Nombre de Usuario:</label>
        <input type="text" id="username" name="username" />
    </div>
    <div>
        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" />
    </div>
    <div>
        <button type="submit">Login</button>
    </div>
</form>


</body>
</html>
