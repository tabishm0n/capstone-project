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
    
    <div  id="hidden5">
      
      <form class="register" action="<%= request.getContextPath() %>/EditMenuItem"  method="post">
    <h1>Edit Item Details</h1><a onclick="myFunction4()"><button aria-label="Close" class="closebutton" ><div class="closebutton2"><svg width="24px" height="24px" fill="#000000" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false"><path d="m19.5831 6.24931-1.8333-1.83329-5.75 5.83328-5.75-5.83328-1.8333 1.83329 5.8333 5.74999-5.8333 5.75 1.8333 1.8333 5.75-5.8333 5.75 5.8333 1.8333-1.8333-5.8333-5.75z" fill="#fff"></path></svg></div></button></a>
    
  <input type="text" name="item_name" value="Item Name" required="required "/>
  
  <input type="text" name="category" value="Category" required="required"/>
  
  <input type="text" name="description" value="Item Description" required="required" />
 
   <input type="number" name="price" step=".01" value="Item Price" placeholder="Price" required="required" />
    
    <button type="submit" class="formbutton">Save Changes</button>
  </form>

</div>
<div  id="hidden6">
      
  <form class="register" action="<%= request.getContextPath() %>/EditMenuItem"  method="post">
<h1>Delete Item?</h1>
<div class="deletecontainer">
<div class="deletebox">
  <div ><a class="deleteformbutton1" type="submit">Yes</a></div>
<div class="space_24"></div> 
<div><a class="deleteformbutton2" onclick="myFunction5()">No</a></div>
</div>
</div>

</form>

</div>
<div  id="hidden7">
      
  <form class="register" action="<%= request.getContextPath() %>/EditMenuItem"  method="post">
<h1>Add New Menu Item</h1><a onclick="myFunction6()"><button aria-label="Close" class="closebutton" ><div class="closebutton2"><svg width="24px" height="24px" fill="#000000" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false"><path d="m19.5831 6.24931-1.8333-1.83329-5.75 5.83328-5.75-5.83328-1.8333 1.83329 5.8333 5.74999-5.8333 5.75 1.8333 1.8333 5.75-5.8333 5.75 5.8333 1.8333-1.8333-5.8333-5.75z" fill="#fff"></path></svg></div></button></a>

<input type="text" name="item_name" value="Item Name" required="required "/>

<input type="text" name="category" value="Category" required="required"/>

<input type="text" name="description" value="Item Description" required="required" />

<input type="number" name="price" step=".01" value="Item Price" placeholder="Price" required="required" />

<button type="submit" class="formbutton">Add Item</button>
</form>

</div>

    <div class="c1">
      <div class="banner-1 banner">
        
    <div>
    <img src="<%=request.getContextPath()%>/resources/food1.png" alt="">
  </div>
</div>

  </div>
  <div class="container2">
    <div class="second">
      <div class="seconds-1 second"><h1><%= restinfo.getRestaurant_name() %></h1><button aria-label="Add Menu Item" onclick="myFunction6()" title="Add Menu Item" type="button" class="button"><div class="addmenuitem"><svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="restshapeadd"><path d="M15.833 8.75H11.25V4.167h-2.5V8.75H4.167v2.5H8.75v4.583h2.5V11.25h4.583v-2.5z" fill="#fff"></path></svg></div></button></div>
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
        		  List<Dish> dishes = ds.getAllDishes(c.getCategory(),restinfo.getRestaurant_id());
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
                      <div class="iedit">
                        <a onclick="myFunction3();">
                   <button aria-label="Edit Item" class="editbutton">
                           <svg aria-hidden="true" focusable="false" viewBox="0 0 20 20" class="restshapeedit"><path d="M17 12a1.667 1.667 0 103.333 0A1.667 1.667 0 0017 12zM10.333 12a1.667 1.667 0 103.334 0 1.667 1.667 0 00-3.334 0zM5.333 13.667a1.667 1.667 0 110-3.333 1.667 1.667 0 010 3.333z" fill="#fff"></path></svg>
                         </button>
               </a>
                       </div>
                       <div id="hidden4">
                       <div class="iedit2">
                        <a onclick="myFunction4();myFunction3()" >
                   <button aria-label="Edit Item" class="editbutton2">
                    <div class="restdelete">Edit</div>
                         </button>
               </a>
                       </div>
                       <div class="iedit3">
                        <a onclick="myFunction5();myFunction3()" >
                   <button aria-label="Edit Item" class="deletebutton">
                           <div class="restdelete">Delete</div>
                         </button>
               </a>
                       </div>
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
><script>
   function myFunction3() {
    var x = document.getElementById("hidden4");
    if (x.style.display == "block" ) {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }
  function myFunction4() {
    var x = document.getElementById("hidden5");
    if (x.style.display == "block" ) {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }
  function myFunction5() {
    var x = document.getElementById("hidden6");
    if (x.style.display == "block" ) {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }
  function myFunction6() {
    var x = document.getElementById("hidden7");
    if (x.style.display == "block" ) {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }
</script>
</html>