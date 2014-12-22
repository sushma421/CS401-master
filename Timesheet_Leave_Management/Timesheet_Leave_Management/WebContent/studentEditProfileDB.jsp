
<%--
 - Author      : Anusha Bestha, Lakshmi Thammishetty
 - Description : This jsp is created to update student profile to database .
--%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%! String username=null;%>
    <%username=session.getAttribute("username").toString(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Student Profile</title>
</head>
<body>
<%
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","root");
Statement st= conn.createStatement();
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String neiuUsername=session.getAttribute("studentUsername").toString();

if(fname!="" && lname!="" && email!="")
{
			
	int rs=st.executeUpdate("update studentProfile set fname='"+fname+"',lname='"+lname+"',emailId='"+email+"' where neiuUserName='"+neiuUsername+"'" );
	%>
	<script>window.alert("Student Profile updated successfully.");
	</script>
	<%
		
	
}

%>

</body>
</html>