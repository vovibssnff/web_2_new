<%--
  Created by IntelliJ IDEA.
  User: vovi
  Date: 26.09.2023
  Time: 01:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<html>
<head>
    <title>ERROR</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<br>
<br>
<p align="left"> Invalid data error </p>
<br>
<p align="left"> <%= request.getAttribute("error_message") %></p>
<br>
<div class="form">
    <form method="get" action="main.jsp">
        <input type="submit" value='Go back' >
    </form>
</div>
</body>
</html>