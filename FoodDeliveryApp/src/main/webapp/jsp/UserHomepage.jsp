<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.RestDao"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
session.removeAttribute("itemexist"); 
RestDao rs = new RestDao(DbCon.getConnection());
List<Rest> rests = rs.getAllRests();
UserDao us = new UserDao(DbCon.getConnection());
List<User> usertypes = us.getUsertypes();
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
            <div class="brating"><%=r.getCity() %>, <%=r.getStreet_address() %></div>
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
			
           if(restaurantorderslistcreated.isEmpty()&&restaurantorderslistdelivered.isEmpty()&&restaurantorderslistprepared.isEmpty())
           {   %><div class="orderscontainerflex">
           <div class="height_300"></div>
           <p class="emptymessage">No Active Orders yet,</br> Wait for Customers to start ordering your delicious food!</p>
           </div><% }
           else if(!restaurantorderslistcreated.isEmpty())
           {   %><div class="restauranthome">
           <div class="orderscontainer">
           <div class="ordercontainertitle">Pending Orders</div>
           <% 
        	   for(Orderitems r:restaurantorderslistcreated){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(r.getOrder_id());
        	   %>
           <div class="ordercontainerflex">
             <a class="orderspagestorelink">
               <div height="140" class="orderimagefigure">
                 <div class="ordersrestimage" style="height: 140px;">
                    <img alt="" role="presentation" src="<%=request.getContextPath()%>/resources/food1.png" aria-hidden="true" >
                     </div>
              </div>
            </a>
            <div class="space_24"> 
            </div>
            <div class="orderspagerestinfo1">
              <div class="orderspagerestinfo2">
                <div class="orderspagerestinfo3">
                  <a  class="orderspagestorelinktitle"><%= r.getFirst_name()%> <%= r.getLast_name()%>   
                  </a>
                  </div>
                  <div class="orderspageidesc">
                    <div class="mo"><%= r.getQuantity() %> item(s) for $<%=dcf.format(r.getPrice()) %>
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
			 <% 
           if(!restaurantorderslistprepared.isEmpty())
           {   %>
           <div class="orderscontainer2">
           <div class="ordercontainertitle">Active Orders</div>
           <%
        	   for(Orderitems r:restaurantorderslistprepared){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(r.getOrder_id());
            	   outfordelivery = oDao.checkOrderDelivery(restinfo.getRestaurant_id(),r.getOrder_id());
            		
        	   %>
			  <div class="ordercontainerflex">
			    <a class="orderspagestorelink">
			      <div height="140" class="orderimagefigure">
			        <div class="ordersrestimage" style="height: 140px;">
			           <img alt="" role="presentation" src="<%=request.getContextPath()%>/resources/food1.png" aria-hidden="true" >
			            </div>
			     </div>
			   </a>
			   <div class="space_24"> 
			   </div>
			   <div class="orderspagerestinfo1">
			     <div class="orderspagerestinfo2">
			       <div class="orderspagerestinfo3">
			         <a  class="orderspagestorelinktitle" ><%= r.getFirst_name()%> <%= r.getLast_name()%>     
			         </a>
			         </div>
			         <div class="orderspageidesc">
			           <div class="mo"><%= r.getQuantity() %> item(s) for $<%=dcf.format(r.getPrice())%>
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
			    <a class="orderspagestorelink">
			      <div height="140" class="orderimagefigure">
			        <div class="ordersrestimage" style="height: 140px;">
			           <img alt="" role="presentation" src="<%=request.getContextPath()%>/resources/food1.png" aria-hidden="true" >
			            </div>
			     </div>
			   </a>
			   <div class="space_24"> 
			   </div>
			   <div class="orderspagerestinfo1">
			     <div class="orderspagerestinfo2">
			       <div class="orderspagerestinfo3">
			         <a  class="orderspagestorelinktitle" ><%= r.getFirst_name()%> <%= r.getLast_name()%>     
			         </a>
			         </div>
			         <div class="orderspageidesc">
			           <div class="mo"><%= r.getQuantity() %> item(s) for $<%=dcf.format(r.getPrice()) %>
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
           <%if(!deliverertripexists.isEmpty()){
        	   %><div class="orderscontainer">
              <div class="ordercontainertitle">Current Trip</div>
           <% 
        	   for(Orderitems d:deliverertripexists){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(d.getOrder_id());
        	   %>
           <div class="ordercontainerflex">
             <a class="orderspagestorelink">
               <div height="140" class="orderimagefigure">
                 <div class="ordersrestimage" style="height: 140px;">
                    <img alt="" role="presentation" src="<%=request.getContextPath()%>/resources/food1.png" aria-hidden="true" >
                     </div>
              </div>
            </a>
            <div class="space_24"> 
            </div>
            <div class="orderspagerestinfo1">
              <div class="orderspagerestinfo22">
                <div class="orderspagerestinfo3">
                  <a  class="orderspagestorelinktitle"><%= d.getFirst_name()%> <%= d.getLast_name()%><span class="orderspageidesc"> &nbsp;<%= d.getUser_city() %>, <%=d.getUser_address() %>&nbsp; </span> Ordered from<span class="orderspagedivider">&nbsp; -&nbsp; </span><%=d.getRestaurant_name() %> <span class="orderspageidesc"><%= d.getRest_city() %>, <%=d.getRest_address() %></span> 
                  </a>
                  </div>
                  <div >
                    <div class="orderspageidesc"><%= d.getQuantity() %> item(s), Delivery fee earned &nbsp;:&nbsp; <span class="orderspagestorelinktitle" >$<%=dcf.format(d.getPrice()) %></span> 
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
           
           if(delivererorderslistpending.isEmpty()&&deliverertripexists.isEmpty())
           {   %><div class="orderscontainerflex">
           <div class="height_300"></div>
           <p class="emptymessage">No Orders yet,</br> Wait for Hungry customers to start ordering!</p>
           </div><% }
           else if(!delivererorderslistpending.isEmpty())
           {   %>
           <div class="ordercontainertitle">Order Pickup</div>
           <% 
        	   for(Orderitems d:delivererorderslistpending){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(d.getOrder_id());
        	   %>
           <div class="ordercontainerflex">
             <a class="orderspagestorelink">
               <div height="140" class="orderimagefigure">
                 <div class="ordersrestimage" style="height: 140px;">
                    <img alt="" role="presentation" src="<%=request.getContextPath()%>/resources/food1.png" aria-hidden="true" >
                     </div>
              </div>
            </a>
            <div class="space_24"> 
            </div>
            <div class="orderspagerestinfo1">
              <div class="orderspagerestinfo22">
                <div class="orderspagerestinfo3">
                  <a  class="orderspagestorelinktitle"><%= d.getFirst_name()%> <%= d.getLast_name()%><span class="orderspageidesc"> &nbsp;<%= d.getUser_city() %>, <%=d.getUser_address() %>&nbsp; </span> Ordered from<span class="orderspagedivider">&nbsp; -&nbsp; </span><%=d.getRestaurant_name() %> <span class="orderspageidesc"><%= d.getRest_city() %>, <%=d.getRest_address() %></span> 
                  </a>
                  </div>
                  <div >
                    <div class="orderspageidesc"><%= d.getQuantity() %> item(s), Delivery fee earned &nbsp;:&nbsp; <span class="orderspagestorelinktitle" >$<%=dcf.format(d.getPrice()) %></span> 
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
      <div class="orderspageaccept"><a href="<%=request.getContextPath()%>/PickupOrder?oid=<%= d.getOrder_id()%>&did=<%= delivererinfo.getDeliverer_id()%>&earning=<%= d.getPrice() %>"><button class="orderspagedeliverybutton">Pickup Order</button></a></div>
     </div>
        <div class="height_16"></div>
        <% 
           }
           }
			 %>
			 </div>
	<%
}else if (usertype == "Admin") {%>
<div class="ordercontainertitle">All Users</div>
 <div class="admincontainer">
           
           <% 
           if(!usertypes.isEmpty()){
        	   %>
              
              <div class="height_16"></div>
           <% 
        	   for(User u:usertypes){
        		   UserDao uDao  = new UserDao(DbCon.getConnection());
        		   adminList = uDao.adminList(u.getUser_type());
        	   %>
        	   <div class="ordercontainertitle"><%= u.getUser_type() %></div>
        	    <%
                    for(User u1:adminList)
                    {RestDao restDao  = new RestDao(DbCon.getConnection());
                    adminRestInfo = restDao.adminRestInfo(u1.getId());
			           %>
           <div class="admincontainerflex">
             <a class="adminprofileimg">
               <div height="140" class="adminimagefigure">
                 <div class="adminimage" style="width: 50px;height: 50px;">
                    <img alt="" role="presentation" src="<%=request.getContextPath()%>/resources/profile.png" aria-hidden="true" >
                     </div>
              </div>
            </a>
            <div class="space_24"> 
            </div>
           
            <div class="orderspagerestinfo1">
              <div class="orderspagerestinfo22">
                <div class="orderspagerestinfo3">
                  <p  class="orderspagestorelinktitle"><%=u1.getFirst_name() %> <%=u1.getLast_name() %>  
			                  <% 
			           if(!adminRestInfo.isEmpty()){
			        	   for(Rest rname:adminRestInfo){
			        	   %>
			        	  <span class="orderspagedivider">&nbsp;owns &nbsp;</span>
							<%=rname.getRestaurant_name() %>
							<%}
			        	   }%>
                      
                  </p>
                  </div>
                  <div >
                    <div class="orderspageidesc"><%=u1.getCity() %>, <%=u1.getStreet_address() %>
                      <span class="orderspagedivider">&nbsp;- &nbsp;

                      </span><%=u1.getEmail() %>
                    </div>
                  </div>	
                 
                  <div class="height_16"></div>
                  <ul>
                    <li>
                      <div class="orderspageitemlist">
                    <div class="orderspageitemlist2">
                      <ul>
                        <li>
                          <div class="orderspageitem">
                           <div class="orderspageitemname">
                              <div class="orderspageitemname2">
                                <div><span class="orderspagedivider">Phone Number -&nbsp;</span><%= u1.getPhone() %> 
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="orderspageitem">
                            <div class="orderspageitemname">
                              <div class="orderspageitemname2">
                                <div><span class="orderspagedivider">Card Info -&nbsp;</span><%=u1.getPayment() %> 
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="orderspageitem">
                           <div class="orderspageitemname">
                              <div class="orderspageitemname2">
                                <div><span class="orderspagedivider">Date Created -&nbsp;</span><%= date.format(u1.getRegisteration_date()) %><span> at </span> <%= time.format(u1.getRegisteration_date()) %>
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
               
            </div>
          </div>
           <div class="space_24"></div>
      <div class="orderspagecancel"><a href="<%=request.getContextPath()%>/RemoveUser?uid=<%= u1.getId()%>"><button class="orderspagecancelbutton">Remove User</button></a></div>
     </div>
        
        <div class="height_16"></div>
			 
	<%}
				}
           }
}
	
	%>
	</div>
</body>

</html>