/** @Author: Sushma Adepu
	 *  @description: This java file acts as  an abstract interface to MYSQL DB and Servlet.
	    UserDAO provide  specific data operations like retrieving student info from their respective username and NetId without exposing details of the database.
	 */
	package timesheet;

	import java.sql.Connection;
	import java.sql.ResultSet;
	import java.sql.Statement;


	public class UserDAO
	{
		static Connection currentCon = null;
		static ResultSet resultSet = null;
		/*method to retrieve Student info from DB based on Student Id*/
		public static UserDataBean StudentJobCodes(String id) 
		{
			  
			Statement stmt = null;
			UserDataBean bean = new UserDataBean();
			try {
				// connect to DB
				currentCon = ConnectionManager.getConnection();
				stmt = currentCon.createStatement();
				String neiuId=id;
				
				resultSet = stmt
						.executeQuery("select * from studentProfile where neiuId='"+neiuId+"'");
				
				while (resultSet.next()) {
						bean.setOrgId(resultSet.getInt("orgId"));
						bean.setFundId(resultSet.getInt("fundId"));
						//bean.setUnivId(resultSet.getInt("univId"));
						bean.setJobId(resultSet.getInt("jobId"));
						bean.setFirstName(resultSet.getString("fName"));
						bean.setLastName(resultSet.getString("lname"));
						bean.setNeiuNetId(resultSet.getInt("neiuId"));
						
				}
				
			} catch (Exception ex) {
				System.out.println("some exception" + ex);
			}

			// some exception handling
			finally {
				if (resultSet != null) {
					try {
						resultSet.close();
					} catch (Exception e) {
					}
					resultSet = null;
				}

				if (stmt != null) {
					try {
						stmt.close();
					} catch (Exception e) {
					}
					stmt = null;
				}

				if (currentCon != null) {
					try {
						currentCon.close();
					} catch (Exception e) {
					}

					currentCon = null;
				}
			}

			return bean;

		}
		
				/*method to retrieve Student info from DB based on Student User NetID*/
		public static UserDataBean StudentDetails(String id) {
			  
			Statement stmt = null;
			UserDataBean bean = new UserDataBean();
			try {
				// connect to DB
				currentCon = ConnectionManager.getConnection();
				stmt = currentCon.createStatement();
				String neiuId=id;
				System.out.println(neiuId);
				resultSet = stmt
						.executeQuery("select * from studentProfile where neiuUserName='"+neiuId+"'");
				
				while (resultSet.next()) {
					
						bean.setOrgId(resultSet.getInt("orgId"));
						bean.setFundId(resultSet.getInt("fundId"));
						//bean.setUnivId(resultSet.getInt("univId"));
						bean.setJobId(resultSet.getInt("jobId"));
						bean.setFirstName(resultSet.getString("fName"));
						bean.setLastName(resultSet.getString("lname"));
						//bean.setNeiuNetId(resultSet.getInt("neiuUserName"));
						bean.setNeiuId(resultSet.getString("neiuId"));
				}
				
			} catch (Exception ex) {
				System.out.println("some exception" + ex);
			}

			// some exception handling
			finally {
				if (resultSet != null) {
					try {
						resultSet.close();
					} catch (Exception e) {
					}
					resultSet = null;
				}

				if (stmt != null) {
					try {
						stmt.close();
					} catch (Exception e) {
					}
					stmt = null;
				}

				if (currentCon != null) {
					try {
						currentCon.close();
					} catch (Exception e) {
					}

					currentCon = null;
				}
			}

			return bean;

		}
		
	}