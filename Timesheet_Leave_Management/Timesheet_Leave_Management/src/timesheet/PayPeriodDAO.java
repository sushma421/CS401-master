
	/** @Author: Sushma Adepu
	 *  @description: This java file acts as  abstract interface to MYSQL DB.
	    PayPeriodDAO provide specific data operations without exposing details of the database.
	 */
	package timesheet;

	import java.util.ArrayList;
	import java.util.List;
	import java.sql.Connection;
	import java.sql.ResultSet;
	import java.sql.Statement;

	public  class PayPeriodDAO
	{
		static Connection currentCon = null;
		static ResultSet resultSet = null;
		/* method to retrieve pay calendar values  */
		public static List<PayPeriodBean> populateDates()
		{
			List<PayPeriodBean> dates = new ArrayList<PayPeriodBean>();
			Statement stmt=null;
		try{
			//connect to dB
				currentCon = ConnectionManager.getConnection();
				stmt = currentCon.createStatement();
				resultSet = stmt
						.executeQuery("select datecal from PayCal"); //select statement retrieves all rows 

				while (resultSet.next()) {
					PayPeriodBean pb = new PayPeriodBean();
					pb.setDate(resultSet.getString("datecal"));
					dates.add(pb);
				}
			}
			//exception handling	
		catch(Exception e)
			{
			System.out.print(e);
			e.printStackTrace();
			}
			
		finally 
			{
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

		return dates;

		}

	}
