<%@page import="java.util.*"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="com.capstoneproject.dao.*"%>
<%@page import="com.capstoneproject.connection.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
List<Orderitems> existingorder = (List)request.getSession().getAttribute("existingorder");
for(Orderitems e:existingorder){


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Remove Confirmation</title>
<style><%@include file="./css/confirmationpage.css"%></style>
</head>
<body>
  <div class="container">

    <div class="box"><h1>You already have an outgoing order which is being processed. In order to continue with your current order we would need to terminate your active order.
    </div>
    <div class="box"><h1>Would you like to continue?</h1>
    </div>
        
<div class="box2"><a class="button" href="<%=request.getContextPath()%>/RemoveOrder?ans=1&rid=<%= e.getRestaurant_id()%>&oid=<%= e.getOrder_id()%>">Yes</a>
  <div class="space_24"></div> <div class="space_24"></div> <div class="space_24"></div><a class="button2" href="<%=request.getContextPath()%>/RemoveOrder?ans=2">No</a>

</div>


</div>
<%} %>
</body>
</html>