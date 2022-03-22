<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deliverer Past Orders</title>
<%@ include file="./common/Header.jsp"%>
</head>
<body>
 <div class="orderscontainer">
           
           <% 
           if(!delivererpastorders.isEmpty()){
        	   %>
              <div class="ordercontainertitle">Past Orders</div>
           <% 
        	   for(Orderitems d:delivererpastorders){
        		   OrderDao oDao  = new OrderDao(DbCon.getConnection());
            	   orderitems = oDao.userOrderItems(d.getOrder_id());
        	   %>
           <div class="ordercontainerflex">
             <a class="orderspagestorelink">
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
                  <a  class="orderspagestorelinktitle"><%= d.getFirst_name()%> <%= d.getLast_name()%><span class="orderspageidesc"> &nbsp;<%= d.getUser_city() %>, <%=d.getUser_address() %>&nbsp; </span> Ordered from<span class="orderspagedivider">&nbsp; -&nbsp; </span><%=d.getRestaurant_name() %> <span class="orderspageidesc"><%= d.getRest_city() %>, <%=d.getRest_address() %></span> 
                  </a>
                  </div>
                  <div >
                    <div class="orderspageidesc"><%= d.getQuantity() %> item(s), Delivery fee earned &nbsp;:&nbsp; <span class="orderspagestorelinktitle" >$<%=dcf.format(d.getEarnings()) %></span> 
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
           
		 </div>
		 <div class="height_16"></div>
     <%}
           }%>
     </div>
</body>
</html>