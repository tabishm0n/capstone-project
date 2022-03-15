<%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.*"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String usertype= (String)request.getSession().getAttribute("usertype");
String username= (String)request.getSession().getAttribute("login");
User auth = (User) request.getSession().getAttribute("auth");
Rest restinfo = (Rest) request.getSession().getAttribute("restinfo");
User delivererinfo = (User) request.getSession().getAttribute("delivererinfo");
SimpleDateFormat date = new SimpleDateFormat("MMM dd");
SimpleDateFormat time = new SimpleDateFormat("hh:mm aa");
List<Orders>orderslist = null; 
int statuslist = 0; 
String message ="";
List<Orderitems>restaurantorderslistcreated = null; 
List<Orderitems>restaurantorderslistprepared = null; 
List<Orderitems>restaurantorderslistdelivered = null; 
List<Orderitems>delivererorderslistpending = null;
List<Orderitems>deliverertripexists=null;
List<Orderitems>delivererpastorders=null;
List<Orderitems>outfordelivery=null;
int orderid =0;
List<Orderitems> completedorders = null;
List<Orderitems> orders = null;
List<Orderitems> orderitems = null;
List<Cart> cartProduct = null;

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list"); 

if (username == null) {
    response.sendRedirect("Login.jsp");
}else{
	OrderDao orderDao  = new OrderDao(DbCon.getConnection());	
	orderslist = orderDao.userOrdersList(auth.getId());
	if(usertype.equals("Restaurant")){
		restaurantorderslistcreated = orderDao.RestaurantOrdersListCreated(restinfo.getRestaurant_id());
		restaurantorderslistprepared = orderDao.RestaurantOrdersListPrepared(restinfo.getRestaurant_id());
		restaurantorderslistdelivered = orderDao.RestaurantOrdersListDelivered(restinfo.getRestaurant_id());
		}
	else if(usertype.equals("Delivery")){
		
		deliverertripexists = orderDao.Istripexists(delivererinfo.getDeliverer_id());
		delivererpastorders = orderDao.Istripexists(delivererinfo.getDeliverer_id());
		delivererorderslistpending = orderDao.DelivererOrdersListPrepared();
		
		}
	orderid = orderDao.orderId(auth.getId());
	orders = orderDao.newUserOrders(auth.getId());
	completedorders = orderDao.completedUserOrders(auth.getId());

}
if(cart_list != null){
	DishDao cDao = new DishDao(DbCon.getConnection());
	cartProduct = cDao.getCartItems(cart_list);
	float  subtotal = cDao.getSubtotalCartPrice(cart_list);
	float  deliveryfee = cDao.getDeliveryFeeCartPrice(cart_list);
	float  servicefee = cDao.getServiceFeeCartPrice(cart_list);
	float taxes = cDao.getTaxesCartPrice(cart_list);
	float  total = cDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list",cart_list);
	request.setAttribute("subtotal",subtotal);
	request.setAttribute("deliveryfee",deliveryfee);
	request.setAttribute("servicefee",servicefee);
	request.setAttribute("taxes",taxes);
	request.setAttribute("total",total);
}
%>

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
         
          <li><a href="<%=request.getContextPath()%>/jsp/UserProfilePage.jsp">Profile</a></li>
         <%
			if (usertype == "Customer") {
			  
			%>
          <li class="cartli"><a href="<%=request.getContextPath()%>/jsp/Cart.jsp">Cart <%if(cart_list != null){ %><span class="badge">${cart_list.size()}</span><%} %></a></li>
         
          <li><a href="<%=request.getContextPath()%>/jsp/UserOrders.jsp"">Orders</a></li>
         <%
			}
			%>
          <li><li><a href="<%=request.getContextPath()%>/Logout">Log Out</a></li></li>
        
        </ul>
      </li>
      </div>

</body>
</html>