<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>view Individual Student Profile</title>
	</head>
<body>
<%
	//connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();
	
	//retrieving form data

	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String neiuId=request.getParameter("neiuId");
	String neiuUsername=request.getParameter("id");
	String email=request.getParameter("emailId");

	//check whether the form fields are empty

	if(fname!="" && lname!="" && neiuId!="" && neiuUsername!="" && email!="")
	{
		//Update query to update the student details.

		int rs=st.executeUpdate("update studentProfile set fname='"+fname+"',lname='"+lname+"',neiuId='"+neiuId+"',emailId='"+email+"'" );
		%>
		<script>window.location.href="veiwProfile.jsp";window.alert("Profile updated successfully.");
		</script>
		<%
	}
	else
	{
	
	%>
	<script>window.location.href="veiwProfile.jsp";window.alert("Fields Should not be empty");
	</script>
	<%
	
	}

%>

</body>
</html>