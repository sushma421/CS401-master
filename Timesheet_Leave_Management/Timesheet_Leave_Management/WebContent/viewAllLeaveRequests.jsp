<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.swing.JOptionPane;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! String username=null;
%>
<%username=session.getAttribute("username").toString(); %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Leave Requesta</title>
	<link href="timesheet.css" type="text/css" rel="stylesheet" />
	<link href="template.css" type="text/css" rel="stylesheet" />
	</head>
<body>
<form name="leaves" action="approveLeave.jsp" method="post">
<%
	//connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();
	
	if(username!="")
	{
		//select query to retrieve all leave requests that are pending for approval and populate them

		ResultSet rs=st.executeQuery("select * from userleave where lStatus='Pending'");

		if(rs.isBeforeFirst())
		{
%>
			<table>
			<thead class="firstrow"><tr>
			<th></th>
			<th>Leave Id</th>
			<th>Student Id</th>
			<th>From Date</th>
			<th>To Date</th>
			<th>Reason for Leave</th>
			<th>Comments</th>
			<th colspan="2">Operations</th>
			</tr></thead>
			<tbody>
<%
		}
		else
		{
			JOptionPane.showMessageDialog(null, "No leaves to display");
		}

		while(rs.next())
		{
		%>
			<tr>
			<td><input type=hidden name="leaveId"value=<%=rs.getString(1)%>></td>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><input type="text" name="managerComments"/></td>
			<td width=100px><button name="submit"type="submit"  value="Approve">Approve </button></td>
			<td width=100px><button name='submit' type='submit' value="Reject">Reject </button></td>
			</tr>
		<%
		}
}
%>
</tbody>
</table>
</form>
</body>
</html>