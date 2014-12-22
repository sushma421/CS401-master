<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Activate Profile</title>
	</head>
<body>
<%
	// Connection to database 

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();
	
	
	String username=request.getParameter("id");
	String active=request.getParameter("status");

	if(username!="")
	{
		// Checks if the Student Profile is active and deactivates if it is active

		if(active.equalsIgnoreCase("active"))
		{
			int status=0;
			int rs=st.executeUpdate("update studentProfile set activationStatus='"+status+"' where neiuUserName='"+username+"'");
		%>
			<script>window.location.href="viewAllStudentProfiles.jsp";window.alert("Student Profile deactivated.");
			</script>
		<%
		}
		
		// Checks if the Student Profile is not active and activates if it is not active

		if(active.equalsIgnoreCase("Not Active"))
		{
			int status=1;
			int rs=st.executeUpdate("update studentProfile set activationStatus='"+status+"' where neiuUserName='"+username+"'");
		%>
			<script>window.location.href="viewAllStudentProfiles.jsp";window.alert("Student Profile activated.");
			</script>
		<%
		}

	}
%>

</body>
</html>