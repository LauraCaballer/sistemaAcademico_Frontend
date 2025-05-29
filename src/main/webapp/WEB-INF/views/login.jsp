<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />" />
</head>
<body>
<h1>Login Page</h1>
<form th:action="@{/login}" method="post">
    <div>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" />
    </div>
    <div>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" />
    </div>
    <div>
        <button type="submit">Login</button>
    </div>
</form>

<div th:if="${error}" style="color: red;">
    <p th:text="${error}"></p>
</div>
<div th:if="${username}" style="color: gray;">
    <p>Last username entered: <span th:text="${username}"></span></p>
</div>
</body>
</html>
