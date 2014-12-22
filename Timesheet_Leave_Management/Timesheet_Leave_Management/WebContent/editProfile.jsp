<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%! String username=null;%>
<%username=session.getAttribute("username").toString(); %>

<%!
String fname=null;
String lname=null;
int neiuId=0;
String neiuUsername=null;
String email=null;
String job=null;
%>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="Stylesheet"  type="text/css" href="template.css">

	<title>Edit Student Profile</title>
	</head>
<body>
<%
	//Connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();

	String username=request.getParameter("id");
	session.setAttribute("studentUsername",username);
	
	
	if(username!="")
	{
		// Retrieving student details from the databse for edit

		ResultSet rs=st.executeQuery("select * from studentProfile where neiuUserName='"+username+"'");
		if(rs.next())
		{
			fname=rs.getString(1);
			lname=rs.getString(2);
			neiuId=rs.getInt(3);
			neiuUsername=username;
			email=rs.getString(5);
			job=rs.getString(10);
		}
	}
%>

<div id="content">
<form action="editProfileDb.jsp" method="post">  
        <fieldset style="width: 500px">  
            <legend class="firstrow"> Edit Student Profile </legend>  
            <table id="crtprof">
            <tr><td><font color='red'>* All fields are required</font></td></tr>
                <tr>  
                    <td>First Name <font color='red'>*</font> :</td>  
                    <td><input type="text" name="fname" value="<%=fname%>"/></td>  
                </tr> 
                <tr>  
                    <td>Last Name <font color='red'>*</font> :</td>  
                    <td><input type="text" name="lname" value="<%=lname%>"/></td>  
                </tr>   
                <tr>  
                    <td>NEIU ID <font color='red'>*</font> :</td>  
                    <td><input type="text" name="neiuId" maxlength="6" value="<%=neiuId%>"/></td>  
                </tr> 
                <tr>  
                    <td>Email <font color='red'>*</font> :</td>  
                    <td><input type="text" name="emailId" value="<%=email %>"/></td>  
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
                    <td><input type="submit" value="Update" /></td>
                    
                </tr>  
            </table>  
        </fieldset>  
</form>
</div>
</body>
</html>