<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.RestDao"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
<%
RestDao rs = new RestDao(DbCon.getConnection());
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
if (usertype == "Customer") 
{
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
      
        <div class="right-1 right"><a href="<%= request.getContextPath() %>/RestaurantPage?id=<%= r.getRestaurant_id() %>">
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
 <div class="orderscontainer">
 			<h1><%=restinfo %></h1>
           <div class="ordercontainertitle">Active Orders</div>
           <% 
           if(restaurantorderslist!=null)
           {   for(Orderitems r:restaurantorderslist){
        	   
        	   %><%= restaurantorderslist%>
           
           
           <div class="ordercontainerflex">
             <a class="orderspagestorelink" href="">
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
                  <a  class="orderspagestorelinktitle" href="">Restaurant Name   
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
                    <div class="mo"><%= r.getQuantity() %> items for $<%=  r.getPrice() %>
                      <span class="orderspagedivider">&nbsp;- &nbsp;

                      </span><%= date.format(r.getOrder_date()) %><span> at </span><%= time.format(r.getOrder_date()) %>
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
      <div class="orderspagecancel"><a href="<%=request.getContextPath()%>/CancelOrder?id=<%= r.getOrder_id()%>"><button data-baseweb="button" class="orderspagecancelbutton">Cancel Order</button></a></div>
    
        </div>
        <div class="height_16"></div>
        <% 
           }
           }
			 %>
			 </div>
<%
}
else
	
%><h1>Hello nobody</h1>
</body>

</html>