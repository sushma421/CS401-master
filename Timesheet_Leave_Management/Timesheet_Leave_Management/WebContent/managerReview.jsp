<%--
 - Author      : Lakshmi Thammishetty
 - Description : This jsp is created to allow manager to review a particular timesheet .
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="timesheet.TimesheetDataBean"%>
<%@page import="timesheet.UserDataBean"%>

<%@page import="timesheet.UserDAO"%>

<%@page import="timesheet.TimesheetDAO"%>
<%!String neiuID = null;%>
<%
	neiuID = session.getAttribute("username").toString(); // retrieving username from session
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Review</title>
<link href="timesheet.css" type="text/css" rel="stylesheet" />
</head>
<body>


	<%
	    // Retreiving timesheet data based on timesheet Id
		TimesheetDataBean bean = TimesheetDAO.ManagerReview(String
				.valueOf(request.getAttribute("id")));
		String id = String.valueOf(bean.getNeiuId());
		
		// Retrieving Student data based on Id
		UserDataBean user = UserDAO.StudentJobCodes(id);
	%>
	<form action="managerTimesheets.jsp" method="get">
		<table>
            
            <%-- Displaying Data  --%>
			<tr class="firstrow">
				<th colspan="2">Student ID</th>
				<td><%=String.valueOf(bean.getNeiuId())%></td>
				<th colspan="1">Student Name</th>
				<td colspan="2"><%=user.getFirstName()%>, <%=user.getLastName()%></td>
				<th colspan="2"></th>
				<td colspan="1"></td>
			</tr>
			<tr class="secondrow">
				<th colspan="2">ORG</th>
				<td><%=user.getOrgId()%></td>

				<th colspan="1">Fund</th>
				<td><%=user.getFundId()%></td>
				<th colspan="2">PayPeriod Date
				<th>
				<td colspan="2"><%=String.valueOf(bean.getPayPeriod())%></td>
			</tr>

			<tr>
				<th></th>
				<th>Monday</th>
				<th>Tuesday</th>
				<th>Wednesday</th>
				<th>Thursday</th>
				<th>Friday</th>
				<th>Saturday</th>
				<th>Sunday</th>
				<th>Hours</th>
			</tr>

			<tr>
				<td>Week 1</td>
				<td><%=String.valueOf(bean.getWeek1Mon())%></td>
				<td><%=String.valueOf(bean.getWeek1Tue())%></td>
				<td><%=String.valueOf(bean.getWeek1Wed())%></td>
				<td><%=String.valueOf(bean.getWeek1Thu())%></td>
				<td><%=String.valueOf(bean.getWeek1Fri())%></td>
				<td><%=String.valueOf(bean.getWeek1Sat())%></td>
				<td><%=String.valueOf(bean.getWeek1Sun())%></td>
				<td><%=String.valueOf(bean.getTotalWeek1())%></td>
			</tr>

			<tr>
				<td>Week 2</td>
				<td><%=String.valueOf(bean.getWeek2Mon())%></td>
				<td><%=String.valueOf(bean.getWeek2Tue())%></td>
				<td><%=String.valueOf(bean.getWeek2Wed())%></td>
				<td><%=String.valueOf(bean.getWeek2Thu())%></td>
				<td><%=String.valueOf(bean.getWeek2Fri())%></td>
				<td><%=String.valueOf(bean.getWeek2Sat())%></td>
				<td><%=String.valueOf(bean.getWeek2Sun())%></td>
				<td><%=String.valueOf(bean.getTotalWeek2())%></td>
			</tr>

		</table>
		<button name="back" type="submit" value="back">Back</button>

	</form>
</body>
</html>