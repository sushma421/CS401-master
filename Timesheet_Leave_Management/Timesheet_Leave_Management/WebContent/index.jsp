
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="Stylesheet"  type="text/css" href="template.css">

	<title>Home</title>
	</head>
<body>
<div id="logo">
	<table>
	<tr>
	<td><img src="images/Neiu2.png" ></td>
	</tr>

	</table>
</div>

<div id="line"></div>

<div id="content">
<%
    if(request.getAttribute("errorMessage")!=null){
        %><h2><%=request.getAttribute("errorMessage")%></h2>
  <%  }
    else
    {
    	
    }
%>
<form action="Login.jsp" method="post"> 
 
        <fieldset>  
            <legend> Login to TimeSheet and Leave Management System </legend>  
            <table>
                <tr>  
                    <td>User ID</td>  
                    <td><input type="text" name="username" required/></td>  
                </tr>  
                <tr>  
                    <td>Password</td>  
                    <td><input type="password" name="userpass" required/></td>  
                </tr>  
                <tr>  
                    <td><input type="submit" value="Login"  /></td>  
                </tr>
                <tr>  
                    <td><a href="forgotPassword.jsp">Forgot Password</a></td>  
                </tr>  
            </table>  
        </fieldset>  
</form>


</div>
<div id="footer">
</div>


</body>
</html>