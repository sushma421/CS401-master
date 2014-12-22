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
	<title>Forgot Passowrd</title>
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

<%! String secAnswer=null; 
%>
<%
	String username=(session.getAttribute("username")).toString();
	
	//connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");Statement st= conn.createStatement();

	String userAnswer=request.getParameter("answer");
	
	//check if user exists

	if(userAnswer!=" ")
	{
		ResultSet rs=st.executeQuery("select * from login where userId='"+username+"'");
		if(rs.next())
		{
			secAnswer=rs.getString(6);
			
			//check if security answer is correct

			if(userAnswer.equalsIgnoreCase(secAnswer))
			{
			%>
			<div id="content">
				<form action="forgotPasswordDb3.jsp" method="post">  
        			<fieldset style="width: 1000px"> 
         	 		<table>
            				<tr><td><font color='red'>* All fields are required</font></td></tr>
                			<tr>  
                    				<td>New Password <font color='red'>*</font>:</td>  
                    				<td><input type="password" name="newPass" size="25" required/></td>  
                			</tr> 
                  			<tr>  
                    				<td>Confirm Password <font color='red'>*</font> :</td>  
                    				<td><input type="password" name="confirmPass" size="25" required/></td>  
                			</tr> 
                  
                			<tr>  
                    				<td><input type="submit" value="Submit" /></td>  
               		 		</tr>  
            			</table>  
        			</fieldset>  
				</form>
				</div>
			<%
			}
			else
			{
		
				JOptionPane.showMessageDialog(null, "Answer provided does not match.Please try again.");
				String redirectURL= "forgotPassword.jsp";  
	    			response.sendRedirect(redirectURL); 
		
			}
		}
	}
	else
	{
		JOptionPane.showMessageDialog(null, "Username does not exist.Please try again.");
		String redirectURL= "forgotPassword.jsp";  
    		response.sendRedirect(redirectURL); 
	}

%>

</body>
</html>
