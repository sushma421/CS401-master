<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! String username=null;%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Change Password</title>
	</head>
<body>
<%
	// Connection to database 
	
	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();

	username=session.getAttribute("username").toString();
	String newPassword=request.getParameter("newPassword");
	String confirmPassword=request.getParameter("confirmPassword");

	//Check whether the new and confirm password fields are empty

	if(username!="" && newPassword!="" && confirmPassword!="")
	{
		//Check whether the new and confirm password fields match

		if(newPassword.equals(confirmPassword))
		{

			//Check whether the password is atleast six characters and update new password

			if(newPassword.length()>6)
			{

			st.executeUpdate("update login set password='"+newPassword+"' where userId='"+username+"'");
		 	%>
			<script>window.alert("Password updated successfully.");</script>
			<%
	
			}
			else
			{

			%>
			<script>
			window.alert("Password must be atleast 6 characters");window.location.href="changePassword.jsp";
			</script>
			<%
			}
			
		}
		else
		{
			%>
			<script>
			window.alert("New and Confirm Passwords doesnot match");window.location.href="changePassword.jsp";
			</script>
			<%
		}
	}
	else
	{
	%>
	<script>window.alert("New or Confirm Password is empty ");window.location.href="changePassword.jsp";
	//window.location ="changePassword.jsp";
	</script>
	<%
	}
%>
</body>
</html>