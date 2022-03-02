<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.DishDao"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
      <%  String username= (String)request.getSession().getAttribute("login");%>
 <%
DishDao ds = new DishDao(DbCon.getConnection());
List<Dish> dishes = ds.getAllDishes();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Restaurant Page</title>
<style><%@include file="./css/test.css"%></style>
</head>
<body>
   <div class="main">
     <div class="container1">
  <div class="items-2 item"><img src="./images/logo-badge.png" alt=""></div>
  <div class="space"></div>
  <div class="items-3 item"><div class="search"><svg width="24px" height="24px" fill="none" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false"><path d="m20.8333 19-3.6666-3.6667c.9167-1.3333 1.4999-2.9166 1.4999-4.6666 0-4.33334-3.5833-7.9167-7.9167-7.9167-4.33331 0-7.91665 3.58336-7.91665 7.9167 0 4.3333 3.58334 7.9167 7.91665 7.9167 1.75 0 3.3334-.5834 4.6668-1.5001l3.6666 3.6667zm-15.50005-8.25c0-2.99999 2.41667-5.41666 5.41665-5.41666 3 0 5.4167 2.41667 5.4167 5.41666 0 3-2.4167 5.4167-5.4167 5.4167-2.99998 0-5.41665-2.4167-5.41665-5.4167z" fill="#e8e6e3"  ></path></svg></div><div class="space_16"></div><input type="text" name="search" placeholder="Food,groceries,drinks etc" autocomplete="off" /></div>
  <div class="space"></div>
  <div class="items-4 item"><h1>Hey <%= username%>!</h1></div>
   <li class="items-5 item"><button class="link">
        <img src="./images/profile.png" alt=""></button>
        <ul class="dropdown-menu">
          <li>Profile</li>
          <li>Cart</li>
          <li>Orders</li>
          <li><li><a href="<%= request.getContextPath() %>/Logout">Log Out</a></li></li>
        </ul>
      </li>
      </div>
   
    <div class="c1">
      <div class="banner-1 banner">
        <button aria-label="Add to favorites" title="Add to favorites" type="button" class="button"><div class="favbg"><svg aria-hidden="true" focusable="false" viewBox="0 0 24 24"  class="shape"><path d="M16 5c2.5 0 4 1.9 4 4.2 0 1.2-.6 2.3-1.3 3.1C17.5 13.5 12 18 12 18s-5.5-4.5-6.7-5.7C4.5 11.5 4 10.4 4 9.2 4 6.9 5.5 5 8 5c1.7 0 3.3 1.6 4 3 .7-1.4 2.3-3 4-3zm0-3c-1.5 0-2.9.6-4 1.4C10.9 2.5 9.5 2 8 2 4 2 1 5.1 1 9.2c0 1.9.8 3.7 2.2 5.2 1.4 1.5 8.8 7.5 8.8 7.5s7.4-6 8.8-7.5c1.4-1.5 2.2-3.3 2.2-5.2C23 5.1 20 2 16 2z" fill="#f15627" ></path></svg></div></button>
    <div>
    <img src="./images/food1.png" alt="">
  </div>
</div>


  </div>
  <div class="container2">
    <div class="second">
      <div class="seconds-1 second"><h1>Indian Curry</h1></div>
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
        
        <li class="li">
          <div class="smenutitle">Appetizer</div>
          <div class="height"></div>
          
          <ul class="list">
          <%
          if(!dishes.isEmpty()){
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
                        <button aria-label="Quick Add" class="addbutton">
                          <svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="shapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#f15627"></path></svg>
                        </button>
                      </div>
                    </div>
                  </div>
                </li>
        	  <%}
          }
          %>
           <%-- <li class="litem">
              <div class="itemdiv" tabindex="0">
                <div class="itemdiv2">
                  <div class="itemdiv3">
                    <div class="itemdiv4">
                      <div class="ititle">
                        <span class="">Samosa</span>
                      </div>
                      <div class="iprice">
                        <div>
                          <span>$2.25</span>
                        </div>
                      </div>
                      <div class="idesc">
                        <div>
                          <span>The triangular shaped flaky snack filled with tasty potato, green peas.</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="iadd">
                    <button aria-label="Quick Add" class="addbutton">
                      <svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="shapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#f15627"></path></svg>
                    </button>
                  </div>
                </div>
              </div>
            </li>
            <li class="litem">
              <div class="itemdiv" tabindex="0">
                <div class="itemdiv2">
                  <div class="itemdiv3">
                    <div class="itemdiv4">
                      <div class="ititle">
                        <span class="">Masala Fries</span>
                      </div>
                      <div class="iprice">
                        <div>
                          <span class="">$6.45</span>
                        </div>
                      </div>
                      <div class="idesc">
                        <div>
                          <span>Fries but with Masala</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="iadd">
                    <button aria-label="Quick Add" class="addbutton">
                      <svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="shapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#f15627"></path></svg>
                    </button>
                  </div>
                </div>
              </div>
            </li>
            <li class="litem">
              <div class="itemdiv" tabindex="0">
                <div class="itemdiv2">
                  <div class="itemdiv3">
                    <div class="itemdiv4">
                      <div class="ititle">
                        <span class="">Plain Rice</span>
                      </div>
                      <div class="iprice">
                        <div>
                          <span class="">$4.95</span>
                        </div>
                      </div>
                      <div class="idesc">
                        <div>
                          <span>Cooked Rice</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="iadd">
                    <button aria-label="Quick Add" class="addbutton">
                      <svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="shapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#f15627"></path></svg>
                    </button>
                  </div>
                </div>
              </div>
            </li>
            <li class="litem">
              <div class="itemdiv" tabindex="0">
                <div class="itemdiv2">
                  <div class="itemdiv3">
                    <div class="itemdiv4">
                      <div class="ititle">
                        <span class="">Plain Roti</span>
                      </div>
                      <div class="iprice">
                        <div>
                          <span class="">$4.25</span>
                        </div>
                      </div>
                      <div class="idesc">
                        <div>
                          <span>Traditional giant flat bread</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="iadd">
                    <button aria-label="Quick Add" class="addbutton">
                      <svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="shapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#f15627"></path></svg>
                    </button>
                  </div>
                </div>
              </div>
            </li>
            <li class="litem">
              <div class="itemdiv" tabindex="0">
                <div class="itemdiv2">
                  <div class="itemdiv3">
                    <div class="itemdiv4">
                      <div class="ititle">
                        <span class="">Chicken Samosa</span>
                      </div>
                      <div class="iprice">
                        <div>
                          <span class="">$3.95</span>
                        </div>
                      </div>
                      <div class="idesc">
                        <div class="">
                          <span>The triangular shaped flaky snack filled with tasty minced chicken.</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="iadd">
                    <button aria-label="Quick Add" class="addbutton">
                      <svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="shapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#f15627"></path></svg>
                    </button>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </li>
 --%>
        <div class="smenutitle">Main Course</div>

        <div class="smenutitle">Sides</div>

        <div class="smenutitle">Dessert</div>

        <div class="smenutitle">Beverages</div>

      </div>
    </div>
  </div>


</body>

</html>