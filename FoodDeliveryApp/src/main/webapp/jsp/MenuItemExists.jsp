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
<title>Menu Item Exists</title>
<style><%@include file="./css/confirmationpage.css"%></style>
</head>
<body>
  <div class="container">

    <div class="box"><h1>The item you're trying to add already exists.
    </div>
    <div class="box"><h1>Would you like to re-introduce the item instead?</h1>
    </div>
        
<div class="box2"><a class="button" href="<%=request.getContextPath()%>/ReissueMenuItem?ans=1">Yes</a>
  <div class="space_24"></div> <div class="space_24"></div> <div class="space_24"></div><a class="button2" href="<%=request.getContextPath()%>/ReissueMenuItem?ans=2">No</a>

</div>


</div>
</body>
</html>