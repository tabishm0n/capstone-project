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
      <a class="logo" href="/"><img src="<%=request.getContextPath()%>/resources/logo-badge.png" alt="logo" height="80px" width="100px"></a>
      <nav>
          <ul class="nav__links">
              <li><a href="#">Services</a></li>
              <li><a href="#">Projects</a></li>
              <li><a href="#">About</a></li>
          </ul>
      </nav>
      <a class="cta" href="./jsp/Login.jsp">Login</a>
      <p class="menu cta">Menu</p>
  </header>
  <div id="mobile__menu" class="overlay">
      <a class="close">&times;</a>
      <div class="overlay__content">
          <a href="#">Services</a>
          <a href="#">Projects</a>
          <a href="#">About</a>
      </div>
  </div>
  <script type="text/javascript" src="mobile.js"></script>
</body>

</html>