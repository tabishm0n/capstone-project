<%
String error=(String)request.getAttribute("err");  

%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    
    <link href="styles.css" rel="stylesheet">
</head>

<body>
<%-- --%>
    
    <div class="login">
	<h1>Login</h1>
    <form method="post" action="<%= request.getContextPath() %>/Login" >
    	<input type="text" name="login" placeholder="Username" required="required" />
        <input type="password" name="password" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">Let me in.</button>
    </form>

<%if(error!=null)
out.println("<font color=red size=4px>"+error+"</font>");%>
</div>
    
</body>
</html>