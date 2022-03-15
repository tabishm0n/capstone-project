<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style><%@include file="./css/confirmationpage.css"%></style>
</head>
<body>
 <div class="container">
    <div class="box"><h1>User registered successfully - All Good!  </div>
   <div class="box2"><a class="button" href="<%= request.getContextPath() %>/jsp/Login.jsp">Go Login</a>
 </div>
</div>
</body>
</html>