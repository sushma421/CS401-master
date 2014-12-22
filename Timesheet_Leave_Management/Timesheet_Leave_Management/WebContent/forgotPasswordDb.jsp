<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.swing.JOptionPane;" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="Stylesheet"  type="text/css" href="template.css">

	<title>Forgot Password</title>
	</head>
<body>

<div id="logo">
	<table>
	<tr>
	<td><img src="images/Neiu2.png"></td>
	</tr>
	</table>
</div>

<div id="line"></div>
<%! String secQuestion=null; %>
<%
	//connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();

	String username=request.getParameter("username");

	session.setAttribute("username",username);

	// Retrieve security question for the given username

	ResultSet rs=st.executeQuery("select * from login where userId='"+username+"'");
	if(rs.next())
	{
    		
		int secQuesId=rs.getInt(5);
		ResultSet rs2=st.executeQuery("select * from security where secQuesId='"+secQuesId+"'");
		if(rs2.next())
		{
		secQuestion=rs2.getString(2);
		}	
	}
	else
	{
	
		JOptionPane.showMessageDialog(null, "Username does not exist.Please try again.");
		String redirectURL= "forgotPassword.jsp";  
    		response.sendRedirect(redirectURL); 
	}

%>

<div id="content">
<form action="forgotPasswordDb2.jsp" method="post">  
        <fieldset style="width: 1000px">  
             
            <table>
            <tr><td><font color='red'>* All fields are required</font></td></tr>
                <tr>  
                    <td>Security Question <font color='red'>*</font> :</td>  
                    <td><input type="text" name="username" value="<%= secQuestion %>" size="50" readonly/></td>  
                </tr> 
                  <tr>  
                    <td>Answer <font color='red'>*</font> :</td>  
                    <td><input type="text" name="answer" size="50" required/></td>  
                </tr> 
                  
                <tr>  
                    <td><input type="submit" value="Submit" /></td>  
                </tr>  
            </table>  
            <br>
            
             <a href="index.jsp">Back to Login</a>
        </fieldset>  
</form>
</div>
</body>
</html>
