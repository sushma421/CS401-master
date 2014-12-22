<%--
 - Author      : Lakshmi Thammishetty
 - Description : This jsp is created to display all pending timehseets 
                 to the manager to be able to approve or reject.  
 --%>

<%@page import="timesheet.TimesheetDataBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="timesheet.TimesheetDataBean"%>
<%@page import="timesheet.TimesheetDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="timesheet.css" type="text/css" rel="Stylesheet" />
<link rel="Stylesheet"  type="text/css" href="template.css">
</head>
<body>
<%
	List<TimesheetDataBean> list = TimesheetDAO.retrieve();
%>
	<form name="form1" method="post" action="ManagerTimesheetsServlet">
<% if(list.size()!=0)
	
	{
	%>
	
<table>

<thead class="firstrow">
        <tr>
 		<th>        </th>
		<th >Timesheet ID</th>
		<th >Neiu ID</th>		
		<th >Total Weekly Hours</th>
		<th>Student Comments</th>
		<th>Date Submitted</th>
		<th>PayPeriod Date</th>
		<th>Comments</th>
		<th></th>
		
	</tr>
	</thead>
			<tbody>
			
<%
	}
else
{
	
}
%>
			
			<%
			    if(list.size()!=0)
			     {
					for (TimesheetDataBean t : list) 
					{
					
			%>

				<tr align="center">
					<td><input type="checkbox" name="timesheetId"
						value=<%=String.valueOf(t.getTimesheetId())%>></td>
					<td><%=String.valueOf(t.getTimesheetId())%></td>
					<td><%=String.valueOf(t.getNeiuId())%></td>
										<td><%=String.valueOf(t.getTotalWeek())%></td>
					
					
					<td><%=t.getStudentComments()%></td>
					<td><%=t.getDateSubmitted()%></td>
					<td><%=t.getPayPeriod()%></td>
				 
				  <td><input name="comments" type="text" ></td>
				   <td>
				      <button name="submit" type="submit" value=<%=String.valueOf(t.getTimesheetId())%>>Review</button>
				  </td>
				</tr>
				
			<%
					}
			%>
		    </tbody>
		  </table>
		<table >
			<tr>
				<td><INPUT id="submit" name="submit" type="submit"
					value="Approve" /> <INPUT id="submit" name="submit" type="submit"
					value="Reject" /></td>
			</tr>

		</table>
	</form>
	 <%
			}
			 else
				{
	 %>
					<h4 style="color:blue">No Timesheets to display</h4>			
	 <% 
				}	
	 %>
			
</body>
</html>