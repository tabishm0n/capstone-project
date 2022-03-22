<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<style><%@include file="./jsp/css/homepage.css"%></style>
<link href="https://fonts.googleapis.com/css?family=Montserrat:500&display=swap" rel="stylesheet">

</head>
<body>
 <header>
    <a class="logo"><img src="<%=request.getContextPath()%>/resources/logo-badge.png" alt="logo" height="80px" width="100px"></a>
    <nav>
        <ul class="nav__links">
            <li><a href="<%= request.getContextPath() %>/jsp/About.jsp">About</a></li>
        </ul>
    </nav>
    <a class="cta" href="./jsp/Login.jsp">Login</a>
    <p class="menu cta">Menu</p>
</header>
<div class="height_90"></div>
<article class="article">
  <h1>Welcome,<br>
      Start ordering food from the best local restaurants now!</h1>
  <div class="height_90"></div>
      <a href="<%= request.getContextPath() %>/jsp/Register.jsp">New user? Get started here</a>
</article>

</body>

</html>