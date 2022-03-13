<%
String error=(String)request.getAttribute("err");  

%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Login Page</title>
    <style><%@include file="./css/styles.css"%></style>

</head>

<body>

    
    <div class="login">
	<h1>User Sign-in</h1>
    <form method="post" action="<%= request.getContextPath() %>/Login" >
    	<input type="text" name="login" placeholder="Username" required="required " autofocus/>
        <input type="password" name="password" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">Login</button>
    </form>
    <form method="post" action="<%= request.getContextPath() %>/jsp/Register.jsp" >
    	<button class="btn btn-secondary btn-block btn-large">Register</button>
    </form>
    

<%if(error!=null)
out.println("<font color=red size=4px>"+error+"</font>");%>
</div>
    
</body>
</html>