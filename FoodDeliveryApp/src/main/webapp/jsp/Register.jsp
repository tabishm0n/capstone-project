<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String reg_error=(String)request.getAttribute("reg_err");  

%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Register Page</title>
      <style><%@include file="./css/styles.css"%></style>

</head>

<body>

    <div class="register">
        <h1>Register Account</h1>
        <form action="<%= request.getContextPath() %>/Register"  method="post">
    	
    <input type="text" name="login" placeholder="Username" required="required " autofocus/>
   
    
    <input type="password" name="password" placeholder="Password" required="required" />
   
    
     <input type="text" name="city" placeholder="City" required="required" />
     
    <input type="text" name="street_address" placeholder="Street Address" required="required"/>
    
    
    <input type="text" name="first_name" placeholder="First Name" required="required"/>
    
    
     <input type="text" name="last_name" placeholder="Last Name" required="required"/>

     <input type="email" name="email" placeholder="Email-Id" required="required"/>
    
     <input type="text" maxlength="10" name="phone" placeholder="Phone Number" required="required"/>
    
    <input type="text" maxlength="10" name="payment" placeholder="Payment Info" required="required"/>
     
    <select class="selecttype" name="user_type" onchange="additionalInputBox(this);">
        <option value="" selected disabled hidden>User Type</option>
        <option value="Customer">Customer</option>
        <option id="restInput" value="Restaurant">Restaurant Manager</option>
        <option value="Delivery">Deliverer</option>
      </select>
      
      <div id="hidden" style="display:none;">
      
       <input type="text" name="restaurant_name" placeholder="Restaurant Name" />
    
     <input type="text" name="description" placeholder="Description" />
    	
      <input type="text" name="rest_city" placeholder="City" />
    
     <input type="text" name="rest_address" placeholder="Street Address" />
     
     </div>
     
        <button type="submit" class="btn btn-primary btn-block btn-large">Sign Up</button>
    </form>
	 <form method="post" action="<%= request.getContextPath() %>/jsp/Login.jsp" >
    	<button class="btn btn-secondary btn-block btn-large">Go Back</button>
    </form>
    
<%if(reg_error!=null)
out.println("<font color=red size=4px>"+reg_error+"</font>");%>
 </div>
<script type="text/javascript">
    function additionalInputBox(nameSelect){
        console.log(nameSelect);
        if(nameSelect){
        	restValue = document.getElementById("restInput").value;
            if(restValue == nameSelect.value){
                document.getElementById("hidden").style.display = "block";
            }
            else{
                document.getElementById("hidden").style.display = "none";
            }
        }
        else{
            document.getElementById("hidden").style.display = "none";
        }
    }
</script>

</body>
</html>