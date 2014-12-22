<%--
 - Author      : Jyoti Behera
 - Description : This jsp is created for the student to edit and update leave .
--%>


<%@page import="timesheet.JavaUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="timesheet.LeaveInfo" %>
<jsp:useBean id="updateleave" scope="request" class="timesheet.LeaveInfo"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/leave.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<script src="js/external/jquery/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/leave.js"></script>

  <script>
  $(function() {
    $( "#fDatepicker" ).datepicker();
  });
  
  $(function() {
	    $( "#tDatepicker" ).datepicker();
	  });
  
  </script>
</head>
<body>
<%
JavaUtil jUtil = new JavaUtil();
String format = "MM/dd/yyyy";
if(session.getAttribute("username") == null){
	session.setAttribute("username", "jyoti");
}
%>
<h3 align="center" style="color:blue">Update Leave</h3>
<form action="SubmitUpdatedLeaveHandler" method="post" id="leaveform">

<input type="text" name="leaveid" hidden value=" <%=updateleave.getLeaveID() %>"><br>


<table width="95%" height="300px" border="0">
	<tr>
		<td><p align="center">From Date:<input type="text" id="fDatepicker" name="fDatepicker" value="<%= jUtil.dateToString(updateleave.getfDate(),format) %>"></p></td>
		<td><p align="center">To Date: <input type="text" id="tDatepicker" name="tDatepicker" value="<%= jUtil.dateToString(updateleave.gettDate(),format) %>"></p></td>
	</tr>
	<tr align="center">
		<td colspan="2"> Reason:<br> <textarea cols="50" rows="3" name="reason" id="reason"><%= updateleave.getReason() %></textarea></td>
	</tr>
	<tr align="center">
		<td><input type="button" onclick="history.back();" value="Back"></td>
		<td colspan="2"><input type="submit" name="submit" border="1" value="SUBMIT" onclick="return validateform()"></td>
  </tr>
</table>
</form>

</body>
</html>