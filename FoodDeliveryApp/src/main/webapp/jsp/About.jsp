<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Page</title>
<style><%@include file="./css/about.css"%></style>
<link href="https://fonts.googleapis.com/css?family=Montserrat:500&display=swap" rel="stylesheet">

</head>
<body> 
    <div class="person">
    <div class="container">
      <div class="container-inner">
        <img
          class="img"
          src="profile-tabish.png"
          />
        
      </div>
    </div>
    <div class="divider"></div>
    <div class="name">Tauseef</div>
    <div class="title">Project Design</div>
  </div>
  <div class="person">
    <div class="container">
      <div class="container-inner">
        <img
          class="img"
          src="<%=request.getContextPath()%>/resources/profile-tabish.png"
          />
       
      </div>
    </div>
    <div class="divider"></div>
    <div class="name">Tabish</div>
    <div class="title">Lead Developer</div>
  </div>
  <div class="person">
    <div class="container">
      <div class="container-inner">
        <img
          class="img"
         src="<%=request.getContextPath()%>/resources/profile-bharath.jpeg"
         />
       
      </div>
    </div>
    <div class="divider"></div>
    <div class="name">Bharath</div>
    <div class="title">UI Designer</div>
  </div>
</body>

</html>