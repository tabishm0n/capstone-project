<%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.DishDao"%>
<%@page import="com.capstoneproject.model.Cart"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list"); 
List<Cart> cartProduct = null;
if(cart_list != null){
	DishDao cDao = new DishDao(DbCon.getConnection());
	cartProduct = cDao.getCartItems(cart_list);
	request.setAttribute("cart_list",cart_list);
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart page</title>
<%@ include file="./common/Header.jsp"%>
</head>
<body>
<div class="cartcontainer">
<div class="cartl">
  
  <div class="ctitle">
    <h3 class="cheader">Your items</h3>
    </div>
  <div class="height_16"></div>
  <ul>
    
    <% if(cart_list != null)
    	{
    	for (Cart c:cartProduct){%>
    		<li class="coitemli">
    		<div class="selectiondropdown">
            <div class="selectiondropdown2">
              <select class="select">
                <option value="0" class="options">Remove</option>
                <option value="1" class="options" selected="selected">1</option>
                <option value="2" class="options">2</option>
                <option value="3" class="options">3</option>
                <option value="4" class="options">4</option>
                <option value="5" class="options">5</option>
                <option value="6" class="options">6</option>
                <option value="7" class="options">7</option>
                <option value="8" class="options">8</option>
                <option value="9" class="options">9</option>
                <option value="10" class="options">10</option>
                </select>
                <div class="arrowselector">
                  <div class="arrowselector2">
                    <svg width="24px" height="24px" fill="none" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false">
                      <path d="M17 11.7494V14.916L12 11.0827L7 14.916V11.7494L12 7.91602L17 11.7494Z" fill="#e8e6e3" transform="rotate(180, 12, 12)" >
                      </path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
            
            <a class="restlinkcart" href="">
              <div class="contli">
                <div class="contli2">
                  <div class="citem"><%= c.getItem_name() %></div>
                  <div class="space_8"></div>
                  <div class="cfprice">$<%=c.getPrice() %> <div class="ctprice"><span>$14.58</span>
                  </div>
                </div>
              </div>
            </div>
          </a>
    		 </li>
    	<%}
    }
    
    %>
      
   
  </ul>



</div>
<div class="cartm">
  
</div>

  <div class="cartr">
    <div class="cartorder">
      <div class="placeorder">
        <button class="orderbutton">Place order</button>
      </div>
      <div class="height_16">
      </div>
      <hr class="divider">
          <ul>
            <li class="poli">
              <div class="poli-items">
                <div class="poli-items-text">Subtotal</div>
              </div>
              <div class="poli-items-text">
                <span class="">$14.58</span>
              </div
              ></li>
              <li class="height_12">
              </li>
              <li class="poli">
                <div class="poli-items">
                  <div class="poli-items-text">Delivery fee</div>
                  <div class="spacer _8">
                  </div>
                 
                </div>
                <div class="poli-items-text">
                  <span class="">$1.99</span>
                </div>
              </li>
              <li class="height_12">
              </li>
              <li class="poli">
                <div class="poli-items">
                  <div class="poli-items-text">Service fee</div>
                  <div class="spacer _8">
                  </div>
                 
                </div>
                <div class="poli-items-text">
                  <span class="">$2.19</span>
                </div>
              </li>
              <li class="height_12">

              </li>
              <li class="poli">
                <div class="poli-items">
                  <div class="poli-items-text">Taxes</div>
                </div>
                <div class="poli-items-text">
                  <span class="">$2.44</span>
                </div>
              </li>
            </ul>
            <hr class="divider">
            <hr class="divider">
                <div class="tip">
                  <div class="tip2">
                    <div class="tiptitle">
                      <h2 class="tiptext">Add a tip</h2>
                      <div class="space _12"></div>
                    </div>
                    <div class="tiptext">$4.27</div>
                  </div>
                  <div class="tiptable">
                    <div class="tipbuttonclass">
                      <button aria-label="0%" class="tipbutton">0%</button></div><div class="space_8"></div><div class="tipbuttonclass">
                        <button aria-label="15%" class="tipbutton">15%</button></div><div class="space_8"></div><div class="tipbuttonclass">
                          <button aria-label="18%" class="tipbutton">18%</button></div><div class="space_8"></div><div class="tipbuttonclass">
                            <button aria-label="20%" class="tipbutton">20%</button></div><div class="space_8"></div><div class="tipbuttonclass">
                              <button aria-label="25%" class="tipbutton">25%</button></div><div class="space_8"></div>
                          </div>
                        </div>
                        <hr class="divider">
                        <div class="pototal">
                          <div>Total</div>$25.47</div>
                        </div>
                      </div>




</div>

</body>
</html>