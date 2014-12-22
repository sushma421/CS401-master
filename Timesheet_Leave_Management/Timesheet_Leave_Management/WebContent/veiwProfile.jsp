<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!
	String fname=null;
	String lname=null;
	int neiuId=0;
	String neiuUsername=null;
	String email=null;
	String job=null;
	String username=null;
%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Student Profile</title>
	</head>
<body>
<%
	//connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();
	username=session.getAttribute("username").toString();

	if(username!="")
	{
		// select query to retrieve the student details and to populate them

		ResultSet rs=st.executeQuery("select * from studentProfile where neiuUserName='"+username+"'");
		if(rs.next())
		{
			fname=rs.getString(1);
			lname=rs.getString(2);
			neiuId=rs.getInt(3);
			neiuUsername=username;
			email=rs.getString(5);
			job=rs.getString(10);
		}
	}
%>
<form action="viewProfileDb.jsp" method="post">  
        <fieldset style="width: 500px">  
            <legend> Create Student Profile </legend>  
            <table>
                <tr>  
                    <td>First Name:</td>  
                    <td><input type="text" name="fname" value="<%=fname%>"/></td>  
                </tr> 
                <tr>  
                    <td>Last Name:</td>  
                    <td><input type="text" name="lname" value="<%=lname%>"/></td>  
                </tr>   
                <tr>  
                    <td>NEIU ID:</td>  
                    <td><input type="text" name="neiuId" value="<%=neiuId%>"/></td>  
                </tr> 
                <tr>  
                    <td>Email:</td>  
                    <td><input type="text" name="emailId" value="<%=email %>"/></td>  
                </tr>
                <tr>  
                    <td>Job Position:</td>  
                    <td><input type="text" name="jobPosition" value="<%=job %>" readonly disabled/></td>  
                </tr> 
                <tr>  
                    <td><input type="submit" value="Update" /></td>
                </tr>  
            </table>  
        </fieldset>  
</form>

</body>
</html>