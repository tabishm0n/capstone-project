<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.capstoneproject.connection.DbCon"%>
<%@page import="com.capstoneproject.dao.RestDao"%>
<%@page import="com.capstoneproject.model.*"%>
<%@page import="java.util.*"%>
<%String first_name = (String)request.getSession().getAttribute("first_name");
String last_name = (String)request.getSession().getAttribute("last_name");
String phone = (String)request.getSession().getAttribute("phone");
String city = (String)request.getSession().getAttribute("city");
String street_address = (String)request.getSession().getAttribute("street_address");
String email = (String)request.getSession().getAttribute("email");
String payment = (String)request.getSession().getAttribute("payment");
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
if (usertype == "Customer") {
%>
     <div class="profilecontainer">
      <div  class="profilecontainer2">
        <div  class="profilecontainer3">
          <div class="items-5">
            <img alt="Profile Image" src="<%=request.getContextPath()%>/resources/profile.png">
          </div>
          <div  class="profiledetails">
            <button class="namechange" onclick="myFunction()"><%=first_name %> <%=last_name %>
              <div class="shapeedit">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none">
                  <title>Edit</title>
                  <path d="M14.4 6.6l3 3L5 22H2v-3L14.4 6.6z" fill="currentColor"></path>,
                  <path d="M19.071 1.99l-2.475 2.474 2.97 2.97 2.475-2.475-2.97-2.97z" fill="currentColor"></path>
                </svg>
              </div>
            </button>
            <div class="phonenumber">+1 <%= phone %>
            </div>
          </div>
        </div>
          <div class="height_10"></div>
			<form action="<%= request.getContextPath() %>/UpdateProfile"  method="post">
		     <div id="hidden">
		          <div class="profileinput">
		            <div class="profileinput2">
		              <input type="text" name="first_name" value="<%=first_name%>"required="required">
		            </div>
		          </div>
		          <div class="height_10"></div>
		          <div class="profileinput">
		            <div class="profileinput2">
		              <input type="text" name="last_name" value="<%=last_name%>"required="required">
		            </div>
		          </div>
		        </div>
			    <div class="height_16"></div>
			        <label class="locationheader">City
			        </label>
			        <div class="profileinput">
			          <div class="profileinput2">
			            <input id="inputtype1" readonly type="text" name="city" value="<%=city%>"required="required">
			          </div>
			        </div>
			        <div class="height_10"></div>
			        <label class="locationheader">Street Address
			        </label>
			        <div class="profileinput">
			          <div class="profileinput2">
			            <input id="inputtype2" readonly type="text" name="street_address" value="<%=street_address%>"required="required">
			          </div>
			        </div>
			        <div class="height_10"></div>
			        <label class="locationheader">Email
			        </label>
			        <div class="profileinput">
			          <div class="profileinput2">
			            <input id="inputtype3" readonly type="email" name="email" value="<%=email%>"required="required">
			          </div>
			        </div>
			        <div class="height_10"></div>
			        <label class="locationheader">Payment Information
			        </label>
			        <div class="profileinput">
			          <div class="profileinput2">
			            <input id="inputtype4"  readonly type="text" name="payment" value="<%=payment%>"required="required">
			          </div>
			        </div>
			        <div class="height"></div>
         <div id="hidden2"> 
        <button type="submit" class="savechanges">Save changes</button>
          </div>
    </form>
      <div class="height" ></div>
        <a href="<%=request.getContextPath()%>/Logout"  class="logoutbutton" id="logoutid">Logout
        </a>
        </div>
      </div>
<script>
  function myFunction() {
    console.log("javascript working");
    var x = document.getElementById("hidden");
    var x2 = document.getElementById("hidden2");
    var x3 = document.getElementById("logoutid");
    
    if (x.style.display == "block" && x2.style.display == "block" && x3.style.display == "none" ) {
      x.style.display = "none";
      x2.style.display = "none";
      x3.style.display = "block";
      document.getElementById("inputtype1").readOnly = true;
      document.getElementById("inputtype2").readOnly = true;
      document.getElementById("inputtype3").readOnly = true;
      document.getElementById("inputtype4").readOnly = true;
    } else {
      x.style.display = "block";
      x2.style.display = "block";
      x3.style.display = "none";
      document.getElementById("inputtype1").readOnly = false;
      document.getElementById("inputtype2").readOnly = false;
      document.getElementById("inputtype3").readOnly = false;
      document.getElementById("inputtype4").readOnly = false;
    }
  }
  </script>
    <%
}
else if (usertype == "Restaurant") 
{
%>
<h1>Hi Restaurant Owner!</h1>
<%
}
%>
</body>
</html>