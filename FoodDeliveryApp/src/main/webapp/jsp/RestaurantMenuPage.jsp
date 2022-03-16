<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%DishDao ds = new DishDao(DbCon.getConnection());
    Rest restinfo2 = (Rest) request.getSession().getAttribute("restinfo");
	List<Dish> category = ds.getCategories(restinfo2.getRestaurant_id());
    RestDao rs = new RestDao(DbCon.getConnection());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Restaurant Menu Page</title>
<%@ include file="./common/Header.jsp"%>
</head>
<body>
  <div class="main">
    
    

    <div class="c1">
      <div class="banner-1 banner">
        
    <div>
    <img src="<%=request.getContextPath()%>/resources/food1.png" alt="">
  </div>
</div>

  </div>
  <div class="container2">
    <div class="second">
      <div class="seconds-1 second"><h1><%= restinfo2.getRestaurant_name() %></h1><button aria-label="Add Menu Item" onclick="myFunction6()" title="Add Menu Item" type="button" class="button"><div class="addmenuitem"><svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="restshapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#fff"></path></svg></div></button></div>
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
          if(category.isEmpty())
          {	
        	 %>
        	 <div id="hidden4">
						      
						 <form class="register" action="<%= request.getContextPath() %>/AddMenuItem?rid=<%=restinfo2.getRestaurant_id()%>"  method="post">
						<h1>Add New Menu Item</h1><a onclick="myFunction6()"><button aria-label="Close" class="closebutton" ><div class="closebutton2"><svg width="24px" height="24px" fill="#000000" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false"><path d="m19.5831 6.24931-1.8333-1.83329-5.75 5.83328-5.75-5.83328-1.8333 1.83329 5.8333 5.74999-5.8333 5.75 1.8333 1.8333 5.75-5.8333 5.75 5.8333 1.8333-1.8333-5.8333-5.75z" fill="#fff"></path></svg></div></button></a>
						
						<input type="text" name="item_name" placeholder="Item Name" required="required"  />
						
						<select class="selecttype" name="category" required="required">
					        <option value="" selected disabled hidden>Category</option>
					        <option value="1">Appetizer</option>
					        <option value="2">Main Course</option>
					        <option value="3">Sides</option>
					        <option value="4">Dessert</option>
					        <option value="5">Beverages</option>
					      </select>
					      
						<input type="text" name="description" placeholder="Item Description" required="required" />
						
						<input type="number" name="price" step=".01" placeholder="Item Price" required="required" />
						
						<button type="submit" class="formbutton">Add Item</button>
						</form>
						
						</div>
        	 
        <%}
          if(!category.isEmpty())
          {	
        	  for(Dish c:category)
        	  {		
        		  List<Dish> dishes = ds.getAllDishes(c.getCategory(),restinfo2.getRestaurant_id());
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
                       <div >
                       <div class="iedit2">
                        <a href="<%= request.getContextPath() %>/jsp/EditMenuItem.jsp?mid=<%=d.getMenuitem_id()%>">
                   <button aria-label="Edit Item" class="editbutton2">
                    <div class="restdelete">Edit</div>
                         </button>
               </a>
                       </div>
                       <div class="iedit3">
                        <a href="<%= request.getContextPath() %>/jsp/DeleteMenuItem.jsp?mid=<%=d.getMenuitem_id()%>" >
                   <button aria-label="Edit Item" class="deletebutton">
                           <div class="restdelete">Remove</div>
                         </button>
               </a>
                       </div>
                      </div>
                      
						<div id="hidden4">
						      
						 <form class="register" action="<%= request.getContextPath() %>/AddMenuItem?rid=<%=restinfo2.getRestaurant_id()%>"  method="post">
						<h1>Add New Menu Item</h1><a onclick="myFunction6()"><button aria-label="Close" class="closebutton" ><div class="closebutton2"><svg width="24px" height="24px" fill="#000000" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false"><path d="m19.5831 6.24931-1.8333-1.83329-5.75 5.83328-5.75-5.83328-1.8333 1.83329 5.8333 5.74999-5.8333 5.75 1.8333 1.8333 5.75-5.8333 5.75 5.8333 1.8333-1.8333-5.8333-5.75z" fill="#fff"></path></svg></div></button></a>
						
						<input type="text" name="item_name" placeholder="Item Name" required="required"  />
						
						<select class="selecttype" name="category" required="required">
					        <option value="" selected disabled hidden>Category</option>
					        <option value="1">Appetizer</option>
					        <option value="2">Main Course</option>
					        <option value="3">Sides</option>
					        <option value="4">Dessert</option>
					        <option value="5">Beverages</option>
					      </select>
					      
						<input type="text" name="description" placeholder="Item Description" required="required" />
						
						<input type="number" name="price" step=".01" placeholder="Item Price" required="required" />
						
						<button type="submit" class="formbutton">Add Item</button>
						</form>
						
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
<script>
  function myFunction6() {
    var x = document.getElementById("hidden4");
    if (x.style.display == "block" ) {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }
</script>
</html>