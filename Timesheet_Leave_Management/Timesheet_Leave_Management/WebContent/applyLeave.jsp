<%--
 - Author      : Jyoti Behera
 - Description : This jsp is created to allow the student to apply a new leave .
--%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!String neiuID=null;%>
 <%neiuID=session.getAttribute("username").toString();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>LEAVE MANAGEMENT</title>
<link rel="stylesheet" href="css/leave.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">




<script src="js/external/jquery/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/leave.js"></script>
  <script type="text/javascript">
  $(function() {
    $("#fDatepicker").datepicker();
  });
  
  $(function() {
	    $("#tDatepicker").datepicker();
	  });
  </script>
</head>
<body><%
if(request.getAttribute("errorMessage")!=null){
                %><h3 style="color:blue;" ><%out.println(request.getAttribute("errorMessage"));}%></h3>
<form action="ApplyLeaveHandler" method="post" id="leaveform">

<table id="leave" width="95%" height="300px" border="0">
<tr class="firstrow"><th  colspan="2">Apply Leave</th></tr>
	<tr align="center" height="30%">
		<td width="50%">From Date:&nbsp;&nbsp;<input type="text" id="fDatepicker" name="fDatepicker" required></td>
		<td width="50%">To Date:&nbsp;&nbsp;<input type="text" id="tDatepicker" name="tDatepicker" required></td>
	</tr>

	<tr align="center" height="40%">
  		<td colspan="2" valign="middle">Reason:<br><textarea cols="50" rows="3" name="reason" id="reason" required></textarea></td>
	</tr>

	<tr align="center" height="30%">
		<td colspan="2">
    		<input type="submit" name="submit" border="1" value="SUBMIT" onclick="return validateform()">
    	</td>
	</tr>  
</table>

</form>
</body>
</html>