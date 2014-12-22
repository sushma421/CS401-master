/*  

 - Author      : Lakshmi Thammishetty
 - Description : This java file is created for database connection

 */

package timesheet;

import java.sql.*;

public class ConnectionManager {

	static Connection con;
	static String url;

	public static Connection getConnection() throws ClassNotFoundException {

		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root","root"
					);

		}

		catch (SQLException ex) {
			ex.printStackTrace();
		}

		return con;
	}
}
