<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! String username=null;
%>
<%username=session.getAttribute("username").toString(); %>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="Stylesheet"  type="text/css" href="timesheet.css">
	<link rel="Stylesheet"  type="text/css" href="template.css">
	<style type="text/css">
	</style>
	<title>Student Profiles</title>
	</head>
<body>
	<table id="viewprof">
	<thead class="firstrow"><tr>
	<th>Student Username</th>
	<th>First Name</th>
	<th>Last Name</th>
	<th>NEIU ID</th>
	<th>Email Id</th>
	<th>Job Position</th>
	<th>Status</th>
	<th colspan="3">Operations</th>
	</tr></thead>
	<tbody>

<%
	//connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();
	
	if(username!="")
	{
		//select query to retrieve all the student profiles and populate them in a table

		ResultSet rs=st.executeQuery("select * from studentProfile");
		while(rs.next())
		{
			String studentUsername=rs.getString(4);
			String active=null;
			if(rs.getInt(11)==1)
			{
				active="Active";
			}
			else
			{
				active="Not Active";
			}
		out.print("<tr>");
		out.print("<td>"+studentUsername+"</a></td>");
		out.print("<td>"+rs.getString(1)+"</td>");
		out.print("<td>"+rs.getString(2)+"</td>");
		out.print("<td>"+rs.getString(3)+"</td>");
		out.print("<td>"+rs.getString(5)+"</td>");
		out.print("<td>"+rs.getString(10)+"</td>");
		out.print("<td>"+active+"</td>");
		out.print("<td><a href='editProfile.jsp?id="+studentUsername+"'target='if'>Edit</td>");
		out.print("<td><a href='deleteProfile.jsp?id="+studentUsername+"'target='if'>Delete</td>");
		out.print("<td><a href='activateProfile.jsp?id="+studentUsername+"&status="+active+"'target='if'>Activate/Deactivate</td>");
		out.print("</tr>");
		}
	}
%>
</tbody>
</table>
</body>
</html>