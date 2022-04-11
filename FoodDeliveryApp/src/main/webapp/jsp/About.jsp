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
    <a href="<%= request.getContextPath() %>/index.jsp"><button aria-label="Back" class="backbutton" ><div class="backbutton2"><svg width="24px" height="24px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" class="fill"><path d="M22 13.5H6.3l5.5 7.5H8.3l-6.5-9 6.5-9h3.5l-5.5 7.5H22v3z"></path></svg></div></button></a>
  <div class="person">
    <div class="container">
      <div class="container-inner">
        <img
          class="img"
          src="<%=request.getContextPath()%>/resources/profile-tauseef.png"
          />
       
      </div>
    </div>
    <div class="divider"></div>
    <div class="name">Tauseef</div>
    <div class="title">Software Design</div>
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
         src="<%=request.getContextPath()%>/resources/profile-bharath.png"
         />
       
      </div>
    </div>
    <div class="divider"></div>
    <div class="name">Bharath</div>
    <div class="title">Project Backend</div>
  </div>
</body>

</html>