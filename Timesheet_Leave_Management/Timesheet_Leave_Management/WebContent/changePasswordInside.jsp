<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%! String username=null;%>
<%username=session.getAttribute("username").toString(); %>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="Stylesheet"  type="text/css" href="template.css">

	<title>Change Password</title>
	</head>
<body>


<div id="content">
<form action="changePasswordInsideDb.jsp" method="post">  
        <fieldset style="width: 600px">  
            <legend> Change Password here </legend>  
            <table>
            <tr><td><font color='red'>* All fields are required</font></td></tr>
                <tr>  
                    <td>New Password <font color='red'>*</font>:</td>  
                    <td><input type="password" name="newPassword" /></td>  
                </tr>  
                <tr>  
                    <td>Confirm Password <font color='red'>*</font>:</td>  
                    <td><input type="password" name="confirmPassword" /></td>  
                </tr>  
                <tr>  
                    <td><input type="submit" value="Update" /></td> 
                    <td><input type="reset" value="Reset" /></td>  
                </tr>
            </table>  
            <br>
            
            
        </fieldset>  
</form>
</div>
</body>
</html>