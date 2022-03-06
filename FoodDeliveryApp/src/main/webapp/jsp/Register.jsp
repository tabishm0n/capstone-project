<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
    
     <input type="text" name="phone" placeholder="Phone Number" required="required"/>
    
    
    <select class="selecttype" name="user_type">
        <option value="" selected disabled hidden>User Type</option>
        <option value="Customer">Customer</option>
        <option value="Restaurant">Restaurant</option>
        <option value="Delivery">Deliverer</option>
      </select>
    
     <input type="text" name="payment" placeholder="Payment Info" required="required"/>
            
        <button type="submit" class="btn btn-primary btn-block btn-large">Sign Up</button>
    </form>

 </div>

</body>
</html>