<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%  String username= (String)request.getSession().getAttribute("login");%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
<style><%@include file="../css/test.css"%></style>

</head>
 
 
<body>
 
  <div class="container1">
  <div class="items-2 item"> <a href="<%=request.getContextPath()%>/jsp/UserHomepage.jsp"> <img src="<%=request.getContextPath()%>/resources/logo-badge.png" alt=""></a> </div>
  <div class="space"></div>
  <div class="items-3 item"><div class="search"><svg width="24px" height="24px" fill="none" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false"><path d="m20.8333 19-3.6666-3.6667c.9167-1.3333 1.4999-2.9166 1.4999-4.6666 0-4.33334-3.5833-7.9167-7.9167-7.9167-4.33331 0-7.91665 3.58336-7.91665 7.9167 0 4.3333 3.58334 7.9167 7.91665 7.9167 1.75 0 3.3334-.5834 4.6668-1.5001l3.6666 3.6667zm-15.50005-8.25c0-2.99999 2.41667-5.41666 5.41665-5.41666 3 0 5.4167 2.41667 5.4167 5.41666 0 3-2.4167 5.4167-5.4167 5.4167-2.99998 0-5.41665-2.4167-5.41665-5.4167z" fill="#e8e6e3"  ></path></svg></div><div class="space_16"></div><input type="text" name="search" placeholder="Food,groceries,drinks etc" autocomplete="off" /></div>
  <div class="space"></div>
  <div class="items-4 item"><h1>Hey <%= username%>!</h1></div>
  <li class="items-5 item"><button class="link">
        <img src="<%=request.getContextPath()%>/resources/profile.png" alt=""></button>
        <ul class="dropdown-menu">
          <li>Profile</li>
          <li><a href="<%=request.getContextPath()%>/jsp/Cart.jsp">Cart</a></li>
          <li>Orders</li>
          <li><li><a href="<%=request.getContextPath()%>/Logout">Log Out</a></li></li>
        </ul>
      </li>
      </div>

</body>
</html>