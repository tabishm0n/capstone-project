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
<div class="restauranthome">
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
<div class="restauranthome">
 <div class="orderscontainer">
           <div class="ordercontainertitle">Pending Orders</div>
           <% 
           if(restaurantorderslistcreated!=null)
           {   %>
           
           <% 
        	   for(Orderitems r:restaurantorderslistcreated){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(r.getOrder_id());
        	   %>
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
                  <a  class="orderspagestorelinktitle" href=""><%= r.getFirst_name()%> <%= r.getLast_name()%>   
                  </a>
                  </div>
                  <div class="orderspageidesc">
                    <div class="mo"><%= r.getQuantity() %> item(s) for $<%= r.getPrice() %>
                      <span class="orderspagedivider">&nbsp;- &nbsp;

                      </span><%= date.format(r.getOrder_date()) %><span> at </span><%= time.format(r.getOrder_date()) %>
                    </div>
                  </div>	
                 <%
                    for(Orderitems o:orderitems)
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
                            <div class="orderspageitemquantity"><%=  o.getQuantity() %>
							</div>
                            <div class="space_16">
                            </div>
                            <div class="orderspageitemname">
                              <div class="orderspageitemname2">
                                <div><%= o.getItem_name() %> 
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
      <div class="orderspageaccept"><a href="<%=request.getContextPath()%>/AcceptOrder?id=<%= r.getOrder_id()%>"><button class="orderspageacceptbutton">Accept Order</button></a></div>
     </div>
        <div class="height_16"></div>
        <% 
           }
           }
			 %>
			 </div>
			 <div class="orderscontainer2">
			    
			  
			 <% 
           if(!restaurantorderslistprepared.isEmpty())
           {   %>
           <div class="ordercontainertitle">Active Orders</div>
           <%
        	   for(Orderitems r:restaurantorderslistprepared){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(r.getOrder_id());
            	   outfordelivery = oDao.checkOrderDelivery(restinfo.getRestaurant_id(),r.getOrder_id());
            		
        	   %>
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
			         <a  class="orderspagestorelinktitle" href=""><%= r.getFirst_name()%> <%= r.getLast_name()%>     
			         </a>
			         </div>
			         <div class="orderspageidesc">
			           <div class="mo"><%= r.getQuantity() %> item(s) for $<%= r.getPrice() %>
			             <span class="orderspagedivider">&nbsp;- &nbsp;
			
			             </span><%= date.format(r.getOrder_date()) %><span> at </span><%= time.format(r.getOrder_date()) %>
			           </div>
			         </div>	
			        <%
                    for(Orderitems o:orderitems)
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
			                   <div class="orderspageitemquantity"><%=  o.getQuantity() %>
			                   </div>
			                   <div class="space_16">
			                   </div>
			                   <div class="orderspageitemname">
			                     <div class="orderspageitemname2">
			                       <div><%= o.getItem_name() %> 
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
			  <%if(!outfordelivery.isEmpty()){
				  
			  
				  %>
			<div ><button class="orderspagedeliverybutton">Out For Delivery</button></div>
			<%
			}
				 %>
			</div>
			<div class="height_16"></div>
			<% 
           }
           }
			 %>
			</div>
			</div>
			<div class="orderscontainer2">
			    
			  
			  <% 
           if(!restaurantorderslistdelivered.isEmpty())
           {   %>
           <div class="ordercontainertitle">Completed Orders</div>
           <%
        	   for(Orderitems r:restaurantorderslistdelivered){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(r.getOrder_id());
        	   %>
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
			         <a  class="orderspagestorelinktitle" href=""><%= r.getFirst_name()%> <%= r.getLast_name()%>     
			         </a>
			         </div>
			         <div class="orderspageidesc">
			           <div class="mo"><%= r.getQuantity() %> item(s) for $<%= r.getPrice() %>
			             <span class="orderspagedivider">&nbsp;- &nbsp;
			
			             </span><%= date.format(r.getOrder_date()) %><span> at </span><%= time.format(r.getOrder_date()) %>
			           </div>
			         </div>	
			         <%
                    for(Orderitems o:orderitems)
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
			                   <div class="orderspageitemquantity"><%=  o.getQuantity() %>
			                   </div>
			                   <div class="space_16">
			                   </div>
			                   <div class="orderspageitemname">
			                     <div class="orderspageitemname2">
			                       <div><%= o.getItem_name() %> 
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
			
			</div>
			<div class="height_16"></div>
			<% 
           }
           }
			 %>
			</div>
			 
	<%
}else if (usertype == "Delivery") {%>

 <div class="orderscontainer">
           
           <% int a=1;
           if(!deliverertripexists.isEmpty()){
        	   %>
              <div class="ordercontainertitle">Current Trip</div>
           <% 
        	   for(Orderitems d:deliverertripexists){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(d.getOrder_id());
        	   %>
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
              <div class="orderspagerestinfo22">
                <div class="orderspagerestinfo3">
                  <a  class="orderspagestorelinktitle" href=""><%= d.getFirst_name()%> <%= d.getLast_name()%><span class="orderspageidesc"> &nbsp;<%= d.getUser_city() %>, <%=d.getUser_address() %>&nbsp; </span> Ordered from<span class="orderspagedivider">&nbsp; -&nbsp; </span><%=d.getRestaurant_name() %> <span class="orderspageidesc"><%= d.getRest_city() %>, <%=d.getRest_address() %></span> 
                  </a>
                  </div>
                  <div >
                    <div class="orderspageidesc"><%= d.getQuantity() %> item(s), Delivery fee earned &nbsp;:&nbsp; <span class="orderspagestorelinktitle" >$<%= d.getPrice() %></span> 
                      <span class="orderspagedivider">&nbsp;- &nbsp;

                      </span><%= date.format(d.getOrder_date()) %><span> at </span><%= time.format(d.getOrder_date()) %>
                    </div>
                  </div>	
                 <%
                    for(Orderitems o:orderitems)
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
                            <div class="orderspageitemquantity"><%=  o.getQuantity() %>
							</div>
                            <div class="space_16">
                            </div>
                            <div class="orderspageitemname">
                              <div class="orderspageitemname2">
                                <div><%= o.getItem_name() %> 
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
      <div class="orderspageaccept"><a href="<%=request.getContextPath()%>/OrderDelivered?oid=<%= d.getOrder_id()%>&did=<%= delivererinfo.getDeliverer_id()%>&amount=<%= d.getPrice() %>"><button class="orderspagedeliveredbutton">Order Delivered</button></a></div>
     </div>
           <%}
           }
           else if(!delivererorderslistpending.isEmpty())
           {   %>
           <div class="ordercontainertitle">Order Pickup</div>
           <% 
        	   for(Orderitems d:delivererorderslistpending){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(d.getOrder_id());
        	   %>
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
              <div class="orderspagerestinfo22">
                <div class="orderspagerestinfo3">
                  <a  class="orderspagestorelinktitle" href=""><%= d.getFirst_name()%> <%= d.getLast_name()%><span class="orderspageidesc"> &nbsp;<%= d.getUser_city() %>, <%=d.getUser_address() %>&nbsp; </span> Ordered from<span class="orderspagedivider">&nbsp; -&nbsp; </span><%=d.getRestaurant_name() %> <span class="orderspageidesc"><%= d.getRest_city() %>, <%=d.getRest_address() %></span> 
                  </a>
                  </div>
                  <div >
                    <div class="orderspageidesc"><%= d.getQuantity() %> item(s), Delivery fee earned &nbsp;:&nbsp; <span class="orderspagestorelinktitle" >$<%= d.getPrice() %></span> 
                      <span class="orderspagedivider">&nbsp;- &nbsp;

                      </span><%= date.format(d.getOrder_date()) %><span> at </span><%= time.format(d.getOrder_date()) %>
                    </div>
                  </div>	
                 <%
                    for(Orderitems o:orderitems)
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
                            <div class="orderspageitemquantity"><%=  o.getQuantity() %>
							</div>
                            <div class="space_16">
                            </div>
                            <div class="orderspageitemname">
                              <div class="orderspageitemname2">
                                <div><%= o.getItem_name() %> 
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
      <div class="orderspageaccept"><a href="<%=request.getContextPath()%>/PickupOrder?oid=<%= d.getOrder_id()%>&did=<%= delivererinfo.getDeliverer_id()%>"><button class="orderspagedeliverybutton">Pickup Order</button></a></div>
     </div>
        <div class="height_16"></div>
        <% 
           }
           }
			 %>
			 </div>
	<%
}
	
	%>
</body>

</html>