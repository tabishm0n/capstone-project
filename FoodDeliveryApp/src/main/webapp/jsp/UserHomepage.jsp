<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%String username= (String)request.getAttribute("login"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@ include file="./common/Header.jsp"%>
</head>
<body>

<section id='home'>
  <div class='content'>Welcome back Deliverer, <%= username%></div>

<%= username%>
</section>
<section id='about'>
  <div class='content'>About</div>
</section>
<section id='contact'>
  <div class='content'>Contact</div>
</section>
</body>

</html>