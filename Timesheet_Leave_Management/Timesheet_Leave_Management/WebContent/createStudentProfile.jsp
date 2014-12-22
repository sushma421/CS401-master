<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%! String username=null;%>
<%username=session.getAttribute("username").toString(); %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="Stylesheet"  type="text/css" href="timesheet.css">
	<link rel="Stylesheet"  type="text/css" href="template.css">
	<title>Create Profile</title>
	</head>
<body>
<div id="content">
<form action="createStudentProfileDb.jsp" method="post"> 
          
            <table id="crtprof">
            <tr class="firstrow"><th colspan="2">Create Student Profile</th></tr>
            <tr><td><font color='red'>* All fields are required</font></td></tr>
                <tr>  
                    <td>First Name <font color='red'>*</font> :</td>  
                    <td><input type="text" name="fname"/></td>  
                </tr> 
                <tr>  
                    <td>Last Name <font color='red'>*</font> :</td>  
                    <td><input type="text" name="lname"/></td>  
                </tr>  
                <tr>  
                    <td>NEIU UserName <font color='red'>*</font> :</td>  
                    <td><input type="text" name="uname"/></td>  
                </tr> 
                <tr>  
                    <td>NEIU ID <font color='red'>*</font> :</td>  
                    <td><input type="text" name="neiuId"/></td>  
                </tr> 
                <tr>  
                    <td>Email <font color='red'>*</font> :</td>  
                    <td><input type="text" name="emailId"/></td>  
                </tr>
                <tr>  
                    <td>Job Position <font color='red'>*</font> :</td>  
                    <td><select name="job">
                    	<option value="0">Select</option>
  			<option value="1">StudentAid</option>
  			<option value="2">Work Study</option>
  			<option value="3">Graduate Assistant</option>
			</select></td>  
                </tr>   
                <tr>  
                    <td><input type="submit" value="Submit" /></td>
                    <td><input type="reset" value="Reset" /></td>  
                </tr>  
            </table>  
        
</form>
</div>
</body>
</html>