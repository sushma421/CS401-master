<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.swing.JOptionPane;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	</head>
<body>

<%
	//connection to database

	Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 
	Statement st= conn.createStatement();

	String username=request.getParameter("username");
	String password=request.getParameter("userpass");

	//Check if username or password is empty

	if(username!="" && password!="")
	{
		session.setAttribute("username",username);
		//session.setAttribute("refreshCount","0");
		ResultSet rs=st.executeQuery("select * from login where userId='"+username+"'");
		if(rs.next())
		{
			//Check if user password matches with database password
	
			if(rs.getString(2).equals(password))
			{
				//retrieving the role of user form the database 1-Manager and 0 - student
						
				int role=rs.getInt(4);

				if(role==1)
				{
					response.sendRedirect("managerHome.jsp");
				}
				else
				{
			
					response.sendRedirect("studentHome.jsp");
				}
		
			}
			else
			{
				JOptionPane.showMessageDialog(null, "Invalid username or password.");
				String redirectURL= "index.jsp";  
		    		response.sendRedirect(redirectURL);  
	 
			}
		}
		else
		{
			JOptionPane.showMessageDialog(null, "Invalid username or password.");
			String redirectURL= "index.jsp";  
	    		response.sendRedirect(redirectURL);  
 
		}
		
	}
	else
	{
		JOptionPane.showMessageDialog(null, "Username or password should not be empty");
				String redirectURL= "index.jsp";  
		    		response.sendRedirect(redirectURL);  
	}
%>

</body>
</html>




