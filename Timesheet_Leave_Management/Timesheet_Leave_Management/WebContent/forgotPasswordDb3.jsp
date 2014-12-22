<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.swing.JOptionPane;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! String username=null;%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Forgot Password</title>
	</head>
<body>
<%
	// Connection to databae

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= conn.createStatement();
	
	username=session.getAttribute("username").toString();
	String newPassword=request.getParameter("newPass");
	String confirmPassword=request.getParameter("confirmPass");

	//Check if new or confirm passwords is empty

	if(username!="" && newPassword!="" && confirmPassword!="")
	{
		//Check if new and confirm passwords match

		if(newPassword.equals(confirmPassword))
		{

			//Check if password is atleast 6 characters

			if(newPassword.length()>6)
			{
				st.executeUpdate("update login set password='"+newPassword+"' where userId='"+username+"'");
				JOptionPane.showMessageDialog(null, "Your Password is reset.Please Login");
				String redirectURL= "index.jsp";  
		    		response.sendRedirect(redirectURL); 
			}
			else
			{
			
			JOptionPane.showMessageDialog(null, "Password must be atleast 6 characters.Please try again.");
			String redirectURL= "forgotPassword.jsp";  
		    	response.sendRedirect(redirectURL); 
			}
			
		}
		else
		{
			JOptionPane.showMessageDialog(null, "New and Confirm Passwords does not match.Please try again.");
			String redirectURL= "forgotPassword.jsp";  
	    		response.sendRedirect(redirectURL); 
		
		}
	}
	else
	{
		JOptionPane.showMessageDialog(null, "New or Confirm Password is empty.Please try again.");
		String redirectURL= "forgotPassword.jsp";  
    		response.sendRedirect(redirectURL); 
	
	}
%>
</body>
</html>