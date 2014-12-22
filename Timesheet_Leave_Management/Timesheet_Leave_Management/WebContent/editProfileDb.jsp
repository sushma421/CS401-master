<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Edit Student Profile</title>
	</head>
<body>
<%
	//connection to database 

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();

	// Retrieving form parameters

	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String neiuId=request.getParameter("neiuId");
	String neiuUsername=session.getAttribute("studentUsername").toString();
	String email=request.getParameter("emailId");
	String job=request.getParameter("job");
	int fundid =0,orgid=0;
	String jobPosition=null;

	ResultSet rs1=st.executeQuery("select * from jobs where jobId="+job);
	if(rs1.next())
	{
		fundid=rs1.getInt(3);
		orgid=rs1.getInt(4);
		jobPosition=rs1.getString(2);
	}


	if(fname!="" && lname!="" && neiuId!="" && neiuUsername!="" && email!="" && job!="" )
	{

		//Update query to update the student details
			
		int rs=st.executeUpdate("update studentProfile set fname='"+fname+"',lname='"+lname+"',neiuId='"+neiuId+"',emailId='"+email+"',fundId='"+fundid+"',orgId='"+orgid+"',jobPosition='"+jobPosition+"' where neiuUserName='"+neiuUsername+"'" );
		%>
		<script>window.location.href="viewAllStudentProfiles.jsp";window.alert("Student Profile updated successfully.");
		</script>
		<%
		
	
	}

%>

</body>
</html>