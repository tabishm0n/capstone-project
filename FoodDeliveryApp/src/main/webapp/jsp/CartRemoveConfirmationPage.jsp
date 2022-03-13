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
</head>
<body>
<h1>You are about to add items from a different restaurant, this will remove previously added cart items, Would you like to continue?</h1>
<a href="<%=request.getContextPath()%>/RemoveCartitems?ans=1">Yes</a>
<a href="<%=request.getContextPath()%>/RemoveCartitems?ans=2">No</a>
</body>
</html>