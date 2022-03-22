<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
Rest userrestinfo = (Rest)request.getSession().getAttribute("userrestinfo");

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
<h1 class="crname">
  <a href="<%= request.getContextPath() %>/RestaurantPage?id=<%= userrestinfo.getRestaurant_id() %>"><%= userrestinfo.getRestaurant_name() %></a></h1>
            <hr class="divider">
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
            
              <select class="select" name="ddquantity" onchange="location = this.value;">
             	<option value="<%=request.getContextPath()%>/Quantity?action=rem&id=<%= c.getMenuitem_id() %>" class="options">Remove</option>
                <option class="defaultoption" disabled selected ><%= c.getQuantity() %></option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng1&id=<%= c.getMenuitem_id() %>" class="options">1</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng2&id=<%= c.getMenuitem_id() %>" class="options">2</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng3&id=<%= c.getMenuitem_id() %>" class="options">3</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng4&id=<%= c.getMenuitem_id() %>" class="options">4</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng5&id=<%= c.getMenuitem_id() %>" class="options">5</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng6&id=<%= c.getMenuitem_id() %>" class="options">6</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng7&id=<%= c.getMenuitem_id() %>" class="options">7</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng8&id=<%= c.getMenuitem_id() %>" class="options">8</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng9&id=<%= c.getMenuitem_id() %>" class="options">9</option>
                <option value="<%=request.getContextPath()%>/Quantity?action=chng10&id=<%= c.getMenuitem_id() %>" class="options">10</option>
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
            <div class="space_8"></div>
            <a class="restlinkcart" >
              <div class="contli">
                <div class="contli2">
                  <div class="citem"><%= c.getItem_name() %></div>
                  <div class="space_8"></div>
                  <div class="cfprice">$<%=dcf.format(c.getPrice())%> 
                </div>
              </div>
            </div>
          </a>
    		 </li>
    		 <div class="height_10"> </div>
    	<%}
    }
    %>
  </ul>
</div>
<div class="cartm">
</div>
  <div class="cartr">
    <div class="cartorder">
      <div class="placeorder"><a href="<%=request.getContextPath()%>/Checkout?rid=<%= userrestinfo.getRestaurant_id()%>">
        <button class="orderbutton">Place order</button>
      </a></div>
      <div class="height_16">
      </div>
      <hr class="divider">
          <ul>
            <li class="poli">
              <div class="poli-items">
                <div class="poli-items-text">Subtotal</div>
              </div>
              <div class="poli-items-text">
                <span class="">$ ${(subtotal>0)?dcf.format(subtotal):0}</span>
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
                  <span class="">$ ${(deliveryfee>0)?dcf.format(deliveryfee):0}</span>
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
                  <span class="">$ ${(servicefee>0)?dcf.format(servicefee):0}</span>
                </div>
              </li>
              <li class="height_12">
              </li>
              <li class="poli">
                <div class="poli-items">
                  <div class="poli-items-text">Taxes</div>
                </div>
                <div class="poli-items-text">
                  <span class="">$ ${(taxes>0)?dcf.format(taxes):0}</span>
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
                    <div class="tiptext">$0</div>
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
                          <div>Total</div>$ ${(total>0)?dcf.format(total):0}</div>
                          					 
                        </div>
                      </div>
</div>

</body>
</html>