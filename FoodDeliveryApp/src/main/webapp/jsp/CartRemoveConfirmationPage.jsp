<%@page import="java.util.*"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="com.capstoneproject.dao.*"%>
<%@page import="com.capstoneproject.connection.*"%>
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

    <div class="box"><h1>You are about to add items from a different Restaurant. This will remove previously added Cart Items,
    </div>
    <div class="box"><h1>Would you like to continue?</h1>
    </div>
        
<div class="box2"><a class="button" href="<%=request.getContextPath()%>/RemoveCartitems?ans=1">Yes</a>
  <div class="space_24"></div> <div class="space_24"></div> <div class="space_24"></div><a class="button2" href="<%=request.getContextPath()%>/RemoveCartitems?ans=2">No</a>

</div>


</div>
</body>
</html>