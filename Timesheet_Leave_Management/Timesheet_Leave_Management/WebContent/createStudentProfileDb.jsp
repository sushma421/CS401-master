<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%! String username=null;%>
<%username=session.getAttribute("username").toString(); %>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create Student Profile</title>
	</head>
<body>
<%
	//Connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();

	// Retrieving form values

	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String neiuId=request.getParameter("neiuId");
	String neiuUsername=request.getParameter("uname");
	String email=request.getParameter("emailId");
	String job=request.getParameter("job");
	int fundid =0,orgid=0;
	String jobPosition=null;

	// Retrieving the fundId, orgId values from the database for the selected job position

	ResultSet rs1=st.executeQuery("select * from jobs where jobId="+job);
	if(rs1.next())
	{
		fundid=rs1.getInt(3);
		orgid=rs1.getInt(4);
		jobPosition=rs1.getString(2);
	}

	// check whether the form fields are empty

	if(fname!="" && lname!="" && neiuId!="" && neiuUsername!="" && email!="" && job!="" )
	{
		//query to inser the student etails to the database
				
		int rs=st.executeUpdate("Insert into studentProfile(fname,lName,neiuId,neiuUserName,emailId,jobId,fundId,orgId,jobPosition,activationStatus)values"+"('"+fname+"','"+lname+"','"+neiuId+"','"+neiuUsername+"','"+email+"','"+job+"','"+fundid+"','"+orgid+"','"+jobPosition+"',1)");
		st.executeUpdate("Insert into login(userId,password,emailId,role,secQuesId,secAns)values('"+neiuUsername+"','test','"+email+"',0,1,'test')");

		
	%>
		<script>window.location.href="viewAllStudentProfiles.jsp";window.alert("Student Profile created succesfully");
		</script>
	<%
				
	}
	else
	{
	
	%>
		<script>window.location.href="createStudentProfile.jsp";window.alert("Fields Should not be empty");
		</script>
	<%
	
	}


%>

</body>
</html>