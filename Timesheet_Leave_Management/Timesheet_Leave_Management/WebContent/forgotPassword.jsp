<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="template.css" type="text/css">

	<title>Forgot Password</title>
	</head>
<body>
<div id="logo">
	<table>
	<tr>
	<td><img src="images/Neiu2.png"></td>
	</tr>
	</table>
</div>

<div id="line"></div>
<div id="content">

<form action="forgotPasswordDb.jsp" method="post">  
        <fieldset style="width: 600px">  
             
            <table>
            <tr><td><font color='red'>* All fields are required</font></td></tr>
                <tr>  
                    <td>Enter UserId <font color='red'>*</font></td>  
                    <td><input type="text" name="username" required /></td>  
                </tr>   
                <tr>  
                    <td><input type="submit" value="Submit" /></td>  
                </tr>  
            </table> 
            <br>
            
            <a href="index.jsp">Back to Login</a>
             
        </fieldset>  
</form>
</div>
</body>
</html>