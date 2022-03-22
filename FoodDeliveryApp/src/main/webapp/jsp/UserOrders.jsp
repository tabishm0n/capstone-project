<%@page import="java.text.DecimalFormat"%>
<%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.*"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%  User user = (User) request.getSession().getAttribute("auth");
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
if (user == null) {
	  response.sendRedirect("./jsp/Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders Page</title>
<%@ include file="./common/Header.jsp"%>
</head>
<body>
         <div class="orderscontainer">
           <div class="ordercontainertitle">Current Order</div>
           <% 
           if(orderslist!=null)
           {   for(Orderitems o1:orders){
        	   OrderDao oDao  = new OrderDao(DbCon.getConnection());
        	   orderitems = oDao.userOrderItems(o1.getOrder_id());
        	   statuslist = oDao.userOrderStatus(o1.getOrder_id(), user.getId());
        	   if(statuslist ==1){
        		   message="Order Sent";
        	   }else if(statuslist==2){
        		   message="Order Prepared";
        	   }else if(statuslist==3){
        		   message="Order is on its way";
        	   }
           %>
           <div class="ordercontainerflex">
             <a class="orderspagestorelink" href="<%= request.getContextPath() %>/RestaurantPage?id=<%= o1.getRestaurant_id() %>">
               <div height="140" class="orderimagefigure">
                 <div class="ordersrestimage" style="height: 140px;">
                    <img alt="" role="presentation" src="https://d1ralsognjng37.cloudfront.net/629b3c46-9959-4c89-be6f-0beac1b01a47.jpeg" aria-hidden="true" >
                     </div>
              </div>
            </a>
            <div class="space_24"> 
            </div>
            <div class="orderspagerestinfo1">
              <div class="orderspagerestinfo2">
                <div class="orderspagerestinfo3">
                  <a  class="orderspagestorelinktitle" href="<%= request.getContextPath() %>/RestaurantPage?id=<%= o1.getRestaurant_id() %>"><%= o1.getRestaurant_name() %>  
                  </a>
                  
			<div class="orderspagestatus"><button class="orderspagestatusbutton"><%= message %></button></div>
	
                  </div>
                  <div class="orderspageidesc">
                    <div class="mo"><%= o1.getQuantity() %> item(s) for $<%= dcf.format(o1.getPrice()) %>
                      <span class="orderspagedivider">&nbsp;- &nbsp;

                      </span><%= date.format(o1.getOrder_date()) %><span> at </span><%= time.format(o1.getOrder_date()) %>
                    </div>
                  </div>
                 <%
                    for(Orderitems o2:orderitems)
           			
                    {
			           %>
                  <div class="height_16"></div>
                  <ul>
                    <li>
                      <div class="orderspageitemlist">
                    <div class="orderspageitemlist2">
                   
                      <ul>
                        <li>
                          <div class="orderspageitem">
                            <div class="orderspageitemquantity"><%=  o2.getQuantity() %>
							</div>
                            <div class="space_16">
                            </div>
                            <div class="orderspageitemname">
                              <div class="orderspageitemname2">
                                <div><%= o2.getItem_name() %> 
                                </div>
                              </div>
                            </div>
                          </div>
                        </li>
                      </ul>
                      
                    </div>
                  </div>
                </li>
              </ul>
               <%
                    }
			           %>
            </div>
          </div>
           <div class="space_24"></div>
      <div class="orderspagecancel"><a href="<%=request.getContextPath()%>/CancelOrder?id=<%= o1.getOrder_id()%>"><button class="orderspagecancelbutton">Cancel Order</button></a></div>
    
        </div>
        <div class="height_16"></div>
        <% 
           }
           }
	
           if(!completedorders.isEmpty())
           {%>
           <div class="ordercontainertitle">Past Orders</div>
           <%
           for(Orderitems c:completedorders){
        	   OrderDao oDao  = new OrderDao(DbCon.getConnection());
        	   orderitems = oDao.userOrderItems(c.getOrder_id());
           %>
           
           <div class="ordercontainerflex">
             <a class="orderspagestorelink" href="<%= request.getContextPath() %>/RestaurantPage?id=<%= c.getRestaurant_id() %>">
               <div height="140" class="orderimagefigure">
                 <div class="ordersrestimage" style="height: 140px;">
                    <img alt="" role="presentation" src="https://d1ralsognjng37.cloudfront.net/629b3c46-9959-4c89-be6f-0beac1b01a47.jpeg" aria-hidden="true" >
                     </div>
              </div>
            </a>
            <div class="space_24"> 
            </div>
            <div class="orderspagerestinfo1">
              <div class="orderspagerestinfo2">
                <div class="orderspagerestinfo3">
                  <a  class="orderspagestorelinktitle" href="<%= request.getContextPath() %>/RestaurantPage?id=<%= c.getRestaurant_id() %>"><%= c.getRestaurant_name() %>   
                  </a>
                  <div class="rating">
                    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24" class="ratingstars">
                      <path d="M12.458 1l3.646 7 7.813.5-5.73 5.5 2.084 8-7.813-4-7.812 4 2.083-8L1 8.5 8.813 8l3.645-7z">

                      </path>
                    </svg>
                    <div class="space_4">

                    </div>
                    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24" class="ratingstars">
                      <path d="M12.458 1l3.646 7 7.813.5-5.73 5.5 2.084 8-7.813-4-7.812 4 2.083-8L1 8.5 8.813 8l3.645-7z">

                      </path>
                    </svg>
                    <div class="space_4">

                    </div>
                    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24" class="ratingstars">
                      <path d="M12.458 1l3.646 7 7.813.5-5.73 5.5 2.084 8-7.813-4-7.812 4 2.083-8L1 8.5 8.813 8l3.645-7z">

                      </path>
                    </svg>
                    <div class="space_4">

                    </div>
                    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24" class="ratingstars">
                      <path d="M12.458 1l3.646 7 7.813.5-5.73 5.5 2.084 8-7.813-4-7.812 4 2.083-8L1 8.5 8.813 8l3.645-7z">

                      </path>
                    </svg>
                    <div class="space_4">

                    </div>
                    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24" class="ratingstars">
                      <path d="M12.458 1l3.646 7 7.813.5-5.73 5.5 2.084 8-7.813-4-7.812 4 2.083-8L1 8.5 8.813 8l3.645-7z">

                      </path>
                    </svg>
                    
                  </div></div><div class="orderspageidesc">
                    <div class="mo"><%= c.getQuantity() %> item(s) for $<%= dcf.format(c.getPrice()) %>
                      <span class="orderspagedivider">&nbsp;- &nbsp;

                      </span><%= date.format(c.getOrder_date()) %><span> at </span><%= time.format(c.getOrder_date()) %>
                     
                    </div>
                  </div>
                  <%
                    for(Orderitems o2:orderitems)
           			
                    {
			           %>
                  <div class="height_16"></div>
                  <ul>
                    <li>
                      <div class="orderspageitemlist">
                    <div class="orderspageitemlist2">
                      <ul>
                        <li>
                          <div class="orderspageitem">
                            <div class="orderspageitemquantity"><%=  o2.getQuantity() %>

                            </div>
                            <div class="space_16">

                            </div>
                            <div class="orderspageitemname">
                              <div class="ah ed">
                                <div><%= o2.getItem_name() %>

                                </div>
                                
                              </div>
                              
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </li>
              </ul>
               <%
                    }
			           %>
            </div>
          </div>
          
        </div>
        <div class="height_16"></div>
        <% 
        }
        }
           %>
      </div> 
</body>
</html> 