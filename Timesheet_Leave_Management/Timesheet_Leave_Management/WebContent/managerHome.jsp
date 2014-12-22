<%--
 - Author      : Lakshmi Thammishetty , Sushma Adepu
 - Description : This jsp is user interface for manager User .
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%!String username = null;%>
<%
	username = session.getAttribute("username").toString();   // retrieving username from session
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="Stylesheet" type="text/css" href="template.css">

<title>Manager Home</title>
</head>
<body>
	<table>
		<tr>
			<td><img src="images/Neiu2.png"></td>
		</tr>
	</table>
	<div id="line"></div>
	<table id="user">
		<tr>
			<td><i>Welcome,</i> <%=username%></td>
		</tr>
		<tr>
			<td><a href="changePasswordInside.jsp" target="if">Change
					Password</a></td>
			<td></td>
			<td><a href="index.jsp">Logout</a></td>
		</tr>
	</table>

	<table id="menu">
		<tr>
			<td><a href="createStudentProfile.jsp"
				<%=session.getAttribute("username").toString()%> target="if">Create
					Student Profile</a></td>
		</tr>
		<tr>
			<td><a href="managerTimesheets.jsp"
				<%=session.getAttribute("username").toString()%> target="if">View
					TimeSheets</a></td>
		</tr>
		<tr>
			<td><a href="viewAllLeaveRequests.jsp"
				<%=session.getAttribute("username")%> target="if">View Leave
					Requests</a></td>
		</tr>
		<tr>
			<td><a href="viewAllStudentProfiles.jsp"
				<%=session.getAttribute("username")%> target="if">View Student
					Profiles</a></td>
		</tr>
	</table>


	<div id="contentmanager">
		<iframe frameborder="0" name="if" src="images/manager.png"> </iframe>
	</div>

</body>
</html>