	<%-- 
	  - @Author(s): Sushma Adepu
	  - @Description: This jsp allows Student User to edit  or view alredy submitted timesheet.
	 --%>
	<%@page import="timesheet.TimesheetDAO"%>
	<%@page import="timesheet.TimesheetDataBean"%>
	<%@page import="timesheet.UserDataBean"%>
	<%@page import="timesheet.UserDAO"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
	<%--Session Variable--%>
	<%!String neiuID=null;%>
 	<%neiuID=session.getAttribute("username").toString();%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>EditTimesheet</title>
		<link href="timesheet.css" type="text/css" rel="stylesheet">
		<script src="js/timesheet.js"></script>	
	</head>
	<body>
		
		<%
		String timesheetId = String.valueOf(request.getAttribute("submit")); //retrieves timesheet Id user wants to view
		TimesheetDataBean t =TimesheetDAO.StudentView(timesheetId);          //calls studentView Method to retrieve timesheet info based on timesheetID 
		String pay= String.valueOf(t.getPayPeriod());						
		String neiu = String.valueOf(t.getNeiuId());
		UserDataBean user = UserDAO.StudentJobCodes(neiu);					//retrieves Student User Info from DB
		%>	
		
	<form action="StudentUpdateServlet" method="post">
	<table>
	
		<tr class="firstrow">
			<th colspan="2">Student ID</th>
			<td><%=String.valueOf(t.getNeiuId()) %></td>
			<th colspan="1">Student Name</th>
			<td colspan="2" ><%=user.getFirstName() %>, <%=user.getLastName()%></td>
			<th></th><td></td><td></td>
		</tr>
		<tr class="secondrow">
			<th colspan="2">ORG</th>
			<td><%=user.getOrgId() %></td>
			<th colspan="1">Fund</th>
			<td><%=user.getFundId() %></td>
			<th colspan="2">PayPeriod Date<th>
			<td colspan="2"><input type="text" value=<%=String.valueOf(t.getPayPeriod())%> readonly="readonly" name="pay"></td>
		</tr>
		<tr class="blank_row">
	    </tr>
		<tr>
	 		<th>      </th>
			<th>Monday</th>
			<th>Tuesday</th>		
			<th>Wednesday</th>
			<th>Thursday</th>
			<th>Friday</th>
			<th>Saturday</th>
			<th>Sunday</th>
			<th>Hours</th>
		</tr>
		<tr class="blank_row1">
	    </tr>
		<tr>
			<td>Week 1</td>
			<td><input type="number"  class="week1"  value=<%=String.valueOf(t.getWeek1Mon())%> name=week1mon onkeyup="minmax(0);"></td>
			<td><input type="number"  class="week1"  value=<%=String.valueOf(t.getWeek1Tue())%> name=week1tue onkeyup="minmax(1);"></td>
			<td><input type="number"  class="week1"  value=<%=String.valueOf(t.getWeek1Wed())%> name=week1wed onkeyup="minmax(2);"></td>
			<td><input type="number"  class="week1"  value=<%=String.valueOf(t.getWeek1Thu())%> name=week1thu onkeyup="minmax(3);"></td>
			<td><input type="number"  class="week1"  value=<%=String.valueOf(t.getWeek1Fri())%> name=week1fri onkeyup="minmax(4);"></td>
			<td><input type="number"  class="week1"  value=<%=String.valueOf(t.getWeek1Sat())%> name=week1sat onkeyup="minmax(5);"></td>
			<td><input type="number"  class="week1"  value=<%=String.valueOf(t.getWeek1Sun())%> name=week1sun onkeyup="minmax(6);"></td>
			<td><input type="number"  id="totweek1"  readonly="readonly"  value=<%=String.valueOf(t.getTotalWeek1())%> name=totweek1></td>
			
		</tr>
		<tr class="blank_row2">
	    </tr>
		<tr>
			<td>Week 2</td>		
			<td><input type="number"  class="week2"  value=<%=String.valueOf(t.getWeek2Mon())%> name=week2mon onkeyup="minmax2(0);"></td>
			<td><input type="number"  class="week2"  value=<%=String.valueOf(t.getWeek2Tue())%> name=week2tue onkeyup="minmax2(1);"></td>
			<td><input type="number"  class="week2"  value=<%=String.valueOf(t.getWeek2Wed())%> name=week2wed onkeyup="minmax2(2);"></td>
			<td><input type="number"  class="week2"  value=<%=String.valueOf(t.getWeek2Thu())%> name=week2thu onkeyup="minmax2(3);"></td>
			<td><input type="number"  class="week2"  value=<%=String.valueOf(t.getWeek2Fri())%> name=week2fri onkeyup="minmax2(4);"></td>
			<td><input type="number"  class="week2"  value=<%=String.valueOf(t.getWeek2Sat())%> name=week2sat onkeyup="minmax2(5);"></td>
			<td><input type="number"  class="week2"  value=<%=String.valueOf(t.getWeek2Sun())%> name=week2sun onkeyup="minmax2(6);"></td>
			<td><input type="number"  id="totweek2"  readonly="readonly" value=<%=String.valueOf(t.getTotalWeek2())%> name=totweek2></td>
		</tr>
		<tr>
			<td colspan="8"><label>Comments:</label><textarea rows="3" cols="70"  name="stucmts" id="stucmts" ><%=t.getStudentComments()%></textarea> </td>
			<td><input type="text" id=totweek readonly="readonly" value= <%=String.valueOf(t.getTotalWeek())%> name=totweek></td>
		</tr>
		<tr class="blank_row1"></tr>
		<tr>
			<td><input type="submit" name="submit" id="back" value="Back"></td>
			<td></td><td></td><td></td>
			<td><input type="button" value="Validate"  id="validate" onclick="calculateTotal();"></td>
			<td><input type="submit" value="Update"    name="submit"></td>
			<td><input type="submit" value="Delete"    id="delete" name="submit"></td>
			<td></td><td></td>
		</tr>
		<tr>
			<td><input type="hidden" value=<%=String.valueOf(t.getNeiuId())%> name="neiuId"></td>
			<td><input type="hidden" value=<%=t.getTimesheetId()%> name="timesheetId"></td>
		</tr>
	</table>
	</form>
	</body>
	</html>
