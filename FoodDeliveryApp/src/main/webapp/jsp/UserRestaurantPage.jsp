<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.DishDao"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
      <%DishDao ds = new DishDao(DbCon.getConnection());
Rest userrestinfo = (Rest)request.getSession().getAttribute("userrestinfo");
List<Dish> category = ds.getCategories(userrestinfo.getRestaurant_id());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Restaurant Page</title>
<%@ include file="./common/Header.jsp"%>
</head>
<body>
   <div class="main">
    
    <div class="c1">
      <div class="banner-1 banner">
        <button aria-label="Add to favorites" title="Add to favorites" type="button" class="button"><div class="favbg"><svg aria-hidden="true" focusable="false" viewBox="0 0 24 24"  class="shape"><path d="M16 5c2.5 0 4 1.9 4 4.2 0 1.2-.6 2.3-1.3 3.1C17.5 13.5 12 18 12 18s-5.5-4.5-6.7-5.7C4.5 11.5 4 10.4 4 9.2 4 6.9 5.5 5 8 5c1.7 0 3.3 1.6 4 3 .7-1.4 2.3-3 4-3zm0-3c-1.5 0-2.9.6-4 1.4C10.9 2.5 9.5 2 8 2 4 2 1 5.1 1 9.2c0 1.9.8 3.7 2.2 5.2 1.4 1.5 8.8 7.5 8.8 7.5s7.4-6 8.8-7.5c1.4-1.5 2.2-3.3 2.2-5.2C23 5.1 20 2 16 2z" fill="#f15627" ></path></svg></div></button>
    <div>
    <img src="<%=request.getContextPath()%>/resources/food1.png" alt="">
  </div>
</div>

  </div>
  <div class="container2">
    <div class="second">
      <div class="seconds-1 second"><h1> <%= userrestinfo.getRestaurant_name() %></h1></div>
      <div class="seconds-2 second"><h3>Rating</h3></div>
    </div>
     </div>
    <div class="container3">
      <div class="rleft">
        <div class="rlefts-1 rleft">Appetizer</div>
        <div class="rlefts-2 rleft">Main Course</div>
        <div class="rlefts-3 rleft">Sides</div>
        <div class="rlefts-4 rleft">Dessert</div>
        <div class="rlefts-5 rleft">Beverages</div>
      </div>
       
      <div class="rright">
        <%
          if(!category.isEmpty())
          {	
        	  for(Dish c:category)
        	  {		
        		  List<Dish> dishes = ds.getAllDishes(c.getCategory(),userrestinfo.getRestaurant_id());
        		%>
        <li class="li">
          <div class="smenutitle"><%= c.getCategory_name() %></div>
          <div class="height"></div>
          <ul class="list">
          <%
        	  for(Dish d:dishes){%>
        	  
        		  <li class="litem">
                  <div class="itemdiv" tabindex="0">
                    <div class="itemdiv2">
                      <div class="itemdiv3">
                        <div class="itemdiv4">
                          <div class="ititle">
                            <span class=""><%= d.getItem_name() %></span>
                          </div>
                          <div class="iprice">
                            <div>
                              <span>$<%= d.getPrice() %></span>
                            </div>
                          </div>
                          <div class="idesc">
                            <div>
                              <span><%= d.getDescription() %></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="iadd">
                       <a href="<%= request.getContextPath() %>/AddToCart?id=<%= d.getMenuitem_id() %>" >
      					  <button aria-label="Quick Add" class="addbutton">
                          <svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="shapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#f15627"></path></svg>
                        </button>
    					</a>
                      </div>
                    </div>
                  </div>
                </li>
                  <%
        	  }
          %>
          </ul>
        </li>
        <%	
        }
        } 
        %>
      </div>
    </div>
  </div>


</body>

</html>