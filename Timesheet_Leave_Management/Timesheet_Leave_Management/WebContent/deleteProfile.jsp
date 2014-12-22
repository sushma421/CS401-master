<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Delete Profile</title>
	</head>
<body>
<%
	//connectin to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();

	//retrieving student id using query string to delete that student formt he database

	String username=request.getParameter("id");
	
	if(username!="")
	{
		//Delete query to delete the selected student profile from the database

		int rs=st.executeUpdate("delete from studentProfile where neiuUserName='"+username+"'");
		%>
		<script>window.location.href="viewAllStudentProfiles.jsp";window.alert("Student Profile deleted.");
		</script>
		<%
	}
%>

</body>
</html>