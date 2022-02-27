<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div align="center">
  <h1>Student Register Page</h1>
  <form action="<%= request.getContextPath() %>/Register"  method="post">
   <table style="width: 80%">
    <tr>
     <td>User Name</td>
     <td><input type="text" name="login" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="text" name="password" /></td>
    </tr>
    <tr>
     <td>City</td>
     <td><input type="text" name="city" /></td>
    </tr>
     <tr>
     <td>Street Address</td>
     <td><input type="text" name="street_address" /></td>
    </tr>
    <tr>
     <td>First Name</td>
     <td><input type="text" name="first_name" /></td>
    </tr>
    <tr>
     <td>Last Name</td>
     <td><input type="text" name="last_name" /></td>
    </tr>
    <tr>
     <td>Email</td>
     <td><input type="email" name="email" /></td>
    </tr>
    <tr>
     <td>Phone</td>
     <td><input type="text" name="phone" /></td>
    </tr>
    <tr>
     <td>User Type</td>
     <td><input type="text" name="user_type" /></td>
    </tr>
    <tr>
     <td>Payment Information</td>
     <td><input type="text" name="payment" /></td>
    </tr>
    </table>
   <input type="submit" value="Submit" />
  </form>
 </div>

</body>
</html>