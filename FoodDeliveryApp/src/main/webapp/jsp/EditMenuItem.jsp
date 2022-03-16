<%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.*"%>
<%@page import="com.capstoneproject.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% int mid = Integer.parseInt(request.getParameter("mid"));
    Rest restinfo2 = (Rest) request.getSession().getAttribute("restinfo");
    DishDao ds = new DishDao(DbCon.getConnection());
    Dish dishes = ds.getAllDishes2(mid,restinfo2.getRestaurant_id());
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Menu Item</title>
<style><%@include file="./css/test.css"%></style>
</head>
<body>
    <form class="register" action="<%= request.getContextPath() %>/EditMenuItem?mid=<%=mid %>&rid=<%=restinfo2.getRestaurant_id()%>"  method="post">
						    <h1>Edit <%=dishes.getItem_name() %> Details</h1>
						    
						  <input type="text" name="item_name" value="<%=dishes.getItem_name() %>" required="required"/>
						  
						  <select class="selecttype" name="category" required="required">
					        <option value="" selected disabled hidden>Category</option>
					        <option value="1">Appetizer</option>
					        <option value="2">Main Course</option>
					        <option value="3">Sides</option>
					        <option value="4">Dessert</option>
					        <option value="5">Beverages</option>
					      </select>
						  
						  <input type="text" name="description" value="<%= dishes.getDescription() %>" required="required"  />
						 
						   <input type="number" name="price" step=".01" value="<%= dishes.getPrice()%>" required="required"/>
						    
						    <button type="submit" class="formbutton">Save Changes</button>
						  </form>
</body>
</html>