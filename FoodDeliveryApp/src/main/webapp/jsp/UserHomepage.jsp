<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.RestDao"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
<%RestDao rs = new RestDao(DbCon.getConnection());
List<Rest> rests = rs.getAllRests();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Homepage</title>
<%@ include file="./common/Header.jsp"%>
</head>
<body>
<%
if (usertype == "Customer") {
  
%>

<div class="container2">
    
      <div class="leftcol">
        <div class="left-1 left"><h4>All Stores</h4></div>
        <div class="left-2 left">2</div>
        <div class="left-3 left">3</div>
        <div class="left-4 left">4</div>
        <div class="left-5 left">5</div>
      </div>
      
      <div id="rightcol">
      <div class="rightmenu">
       <%
          if(!rests.isEmpty()){
        	  for(Rest r:rests){%>
      
        <div class="right-1 right"><a href="<%=request.getContextPath()%>/jsp/UserRestaurantPage.jsp">
          <div class="rbanner"><img src="<%=request.getContextPath()%>/resources/food1.png" alt=""></div>
          <div id="binfo">
            <div class="bname"><b><%= r.getRestaurant_name() %></b></div>
            <div class="brating">4.6</div>
          </div>
          </a>
        </div>
         <%}
          }
          %>
        
      </div>
        </div>
      	 
    </div>
    <%
}else if (usertype == "Restaurant") {
  
%>
<h1>Hi Restaurant Owner!</h1>
<%
}
else
	
%><h1>Hello nobody</h1>
</body>

</html>