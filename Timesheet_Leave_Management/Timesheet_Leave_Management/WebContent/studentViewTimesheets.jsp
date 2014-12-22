	<%-- 
	  - @Author(s): Sushma Adepu
	  - @Description: This jsp is created to allow user to view all previous timesheets
	 --%>
	<%@page import="timesheet.UserDataBean"%>
	<%@page import="timesheet.TimesheetDataBean"%>
	<%@page import="java.util.List"%>
	<%@page import="timesheet.TimesheetDAO"%>
	<%@page import="timesheet.UserDAO"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
	<%!String neiuId=null;%>
	<%neiuId=session.getAttribute("username").toString();%>
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="Stylesheet"  type="text/css" href="template.css">
		<title>ViewTimesheets</title>
		<link href="timesheet.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	
		<%
		UserDataBean user = UserDAO.StudentDetails(neiuId);    // retrieves student info from Username
		String neiuId = String.valueOf(user.getNeiuId());
		List<TimesheetDataBean> list = TimesheetDAO.StudentRetrieve(neiuId);  //retrieves timesheet info from Student NetID.
		%>
		<%
		if(list.size()!=0)
		{
		%>
		
	<form name="form1" method="post" action="StudentTimesheetServlet">
	<table>
		<thead>
	    	<tr class="firstrow">
			 	<th>Timesheet ID</th>
				<th>NEIU Id</th>
				<th>Total Hours</th>
				<th>Students Comments</th>
				<th>Manager Comments</th>
				<th>Timesheet Status</th>
				<th>Date Submitted</th>
				<th>PayPeriod Date</th>
				<th></th>
	      	</tr>
	  	</thead>
		  	<% }
			else
			{ }%>
	  	
		<tbody>
	
				<%
				    if(list.size()!=0)
				     {
						for (TimesheetDataBean t : list) 
						{
				%>
			<tr align="center">
				<td><%=String.valueOf(t.getTimesheetId())%></td>
				<td><%=String.valueOf(t.getNeiuId())%></td>
				<td><%=String.valueOf(t.getTotalWeek())%></td>
				<td><%=String.valueOf(t.getStudentComments())%></td>
				<td><%=String.valueOf(t.getManagerComments())%></td>
				<td><%=String.valueOf(t.getTimesheetStatus())%></td>
				<td><%=t.getDateSubmitted()%></td>
				<td><%=String.valueOf(t.getPayPeriod())%></td>
				<td>
			      <input name="id" type=hidden value=<%=String.valueOf(t.getTimesheetId())%>>
			      <input name="neiuId" type=hidden value=<%=String.valueOf(t.getNeiuId()) %>>
			      <input name="status" type=hidden value=<%=String.valueOf(t.getTimesheetStatus())%>> 
				
				 <% if(t.getTimesheetStatus().equalsIgnoreCase("approved")) {%>
	              <button name="submit" type="submit"  disabled >Edit</button>
	             <%}
	              else{%>
	              <button name="submit" type="submit"  value=<%=String.valueOf(t.getTimesheetId())%>>Edit</button><%} %>
	            </td>
			</tr>
				  <%
						}
				  %>
		</tbody>
		
	</table>
	</form>
		 <%} else {
		 %>
		 <h3 id="message">No Timesheets to display</h3>
		 <% }%>
				
 	</body>
 	</html>