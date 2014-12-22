<%-- 
  - @Author(s): Sushma Adepu
  - @Description: This jsp is user interface for Student User. 
 --%>

	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%--Session Variable --%>
	<%! String username=null;%>
	<%username=session.getAttribute("username").toString(); %>
	  
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="template.css" type="text/css">
		<title>Student Home</title>
	</head>
	<body>
		<div id="logo">
			<table>
			<tr>
			<td><img src="images/Neiu2.png"></td>
			</tr>
			</table>
		</div>
		<div id="line">
		</div>
		<table id="user">
		<tr>
		<td>Welcome,<i><%= username %></i>
		</td>
		</tr>
		<tr>
		<td id="popover">
			<a href="">My Account</a>
			<div class="hiddenlinks">
				<li><a href="studentEditProfile.jsp "<%=session.getAttribute("username").toString() %> target="if">View Profile</a></li>
				<li><a href="changePasswordInside.jsp" <%=session.getAttribute("username").toString() %> target="if">Change Password</a></li>
			</div>
		</td>
		<td></td>
		<td><a href="index.jsp">Logout</a></td>
		</tr>
		</table>
		<table id="menu">
		<tr>
		<td><a href="createTimesheet.jsp" <%=session.getAttribute("username").toString() %> target="if">Submit TimeSheet</a>
		</td>
		</tr>
		<tr>
		<td><a href="studentViewTimesheets.jsp" <%=session.getAttribute("username").toString() %>  target="if">View TimeSheets</a>
		</td>
		</tr>
		<tr>
		<td><a href="applyLeave.jsp" <%=session.getAttribute("username").toString() %> target="if">Raise Leave Request</a>
		</td>
		</tr>
		<tr>
		<td><a href="/Timesheet_Leave_Management/EditLeaveHandler" <%=session.getAttribute("username").toString() %> target="if">View Leave Request</a>
		</td>
		</tr>
		</table>
		<div id="contentstudent">
		<iframe frameborder="0"name="if" src="images/student.png">
		</iframe>
		</div>
	</body>
	</html>