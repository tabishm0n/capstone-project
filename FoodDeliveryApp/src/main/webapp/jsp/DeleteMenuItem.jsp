<%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.*"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <% int mid = Integer.parseInt(request.getParameter("mid"));
     Rest restinfo2 = (Rest) request.getSession().getAttribute("restinfo");
     //Retrieve restaurant details for user that is logged in
     DishDao ds = new DishDao(DbCon.getConnection());
     Dish dishes = ds.getAllDishes2(mid,restinfo2.getRestaurant_id());
     //Retrieve all menu items available from the restaurant
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Menu Item</title>
<style><%@include file="./css/test.css"%></style>
</head>
<body>
						      
	<form class="register">
	<h1>Delete <%=dishes.getItem_name() %> from Menu?</h1>
	<a href="<%= request.getContextPath() %>/DeleteMenuItem?mid=<%=dishes.getMenuitem_id() %>&rid=<%=restinfo2.getRestaurant_id()%>" class="deleteformbutton">Yes</a>
	<!-- Confirmation to delete menu item from menu, if yes is pressed, call servlet to delete menu item -->
	</form>
						
</body>
</html>