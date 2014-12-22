<%--
 - Author      : Jyoti Behera
 - Description : This jsp is created to display all the leaves applied by the particular student 
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="timesheet.LeaveInfo" %>
<jsp:useBean id="editleave" scope="request" class="java.util.ArrayList"></jsp:useBean>
<html>
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="timesheet.css" type="text/css" rel="stylesheet" />

</head>
<body>	
	<%if("Y".equals(request.getAttribute("leaveupdate"))){%>
	<script>		
		alert("Leave has been updated.");
	</script>
	<%}%>
	
	
	<table  width="95%" cellspacing="2" cellpadding="1">
	<thead class="firstrow">
	<tr>
	<th>LeaveID</th>
	<th>From Date</th>
	<th>To Date</th>
	<th>Reason</th>
	<th>Manager Comment</th>
	<th>Status</th>
	<th>Edit</th>
	</tr>
	</thead>
	<%
	Iterator<LeaveInfo> itr = editleave.iterator();
	int counter = 0;
	while(itr.hasNext()){
		counter++;
		LeaveInfo lInfo = new LeaveInfo();
		lInfo = itr.next();
	%>	
	<tr>
	<td><%= lInfo.getLeaveID() %></td>
	<td><%= lInfo.getfDate() %></td>
	<td><%= lInfo.gettDate() %></td>
	<td><%= lInfo.getReason() %></td>
	<td><%= lInfo.getManagerComment() %></td>
	<td><%= lInfo.getlStatus() %></td>
	<%
		if((lInfo.getlStatus() !=null) && (!lInfo.getlStatus().equalsIgnoreCase("Approved"))){			
	%>
	<td><a href="UpdateLeaveHandler?leaveID=<%= lInfo.getLeaveID() %>">Edit</a></td>
	<%}else{%>	
	<td></td>
	<%}%>
	</tr>
	<%}%>
	<%
	if(counter==0){
	%>
	<tr><td><p>No available leaves.</p></td></tr>
	<%}%>	
	</table>
	<%
	request.setAttribute("leaveupdate", "N");
	%>
</body>
</html>