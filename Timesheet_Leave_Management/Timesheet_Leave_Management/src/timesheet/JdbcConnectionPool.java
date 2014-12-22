// Author      : Jyoti Behera
// Description : This java file is for connection to the database.

package timesheet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnectionPool {
	
	public Connection getConnection() throws SQLException, ClassNotFoundException {

	    Connection conn = null;
	   
	    Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(
	                   "jdbc:mysql://localhost:3306/test","root","root"			// localhost database, user id and password
	        		 );
	        		 
	    	    
	    return conn;
	}
	
	

}
