<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Approve/Reject Leave</title>
	</head>
<body>
<%
	// Connection to database 

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","root");
	Statement st= conn.createStatement();

	String leaveId=request.getParameter("leaveId");
	String comments=request.getParameter("managerComments");
	String option = request.getParameter("submit");

	if(leaveId!="")
	{
		//Checks if manager has clicked on approve and updates the status of leave request to approve

		if(option.equalsIgnoreCase("approve"))
		{
			int leaveID=Integer.parseInt(leaveId);
			int rs=st.executeUpdate("update userleave set lStatus='approved',managerComment='"+comments+"' where leaveID='"+leaveID+"'");
			String redirectURL= "viewAllLeaveRequests.jsp";  
    			response.sendRedirect(redirectURL);  
		}

		//Checks if manager has clicked on reject and updates the status of leave request to reject
	
		else if(option.equalsIgnoreCase("reject"))
		{
			int leaveID=Integer.parseInt(leaveId);
			int rs=st.executeUpdate("update userleave set lStatus='rejected',managerComment='"+comments+"'where leaveID='"+leaveID+"'");
			String redirectURL= "viewAllLeaveRequests.jsp";  
        		response.sendRedirect(redirectURL);  
		}

	}
%>

</body>
</html>