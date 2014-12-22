/*  

 - Author(s)      : Lakshmi Thammishetty, Sushma Adepu
 - Description : This java file acts as interface between database and servlet. This file contains various methods used by servlet 
                 updating, retrieving, deleting data from database .
 */

package timesheet;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimesheetDAO {

	static Connection currentCon = null;
	static ResultSet resultSet = null;

	// Method to retreive pending timesheets to be displayed to manager.
	public static List<TimesheetDataBean> retrieve() {
		List<TimesheetDataBean> timesheets = new ArrayList<TimesheetDataBean>();
		Statement stmt = null;
		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			resultSet = stmt
					.executeQuery("select * from timesheet where timesheetStatus='pending'");

			while (resultSet.next()) {
				TimesheetDataBean timesheet = new TimesheetDataBean();
				timesheet.setTimesheetId(resultSet.getInt("timesheetId"));
				timesheet.setNeiuId(resultSet.getInt("neiuId"));
				timesheet.setTotalWeek1(resultSet.getInt("totalweek1"));
				timesheet.setTotalWeek2(resultSet.getInt("totalweek2"));
				timesheet.setTotalWeek(resultSet.getInt("totalweek"));
				timesheet.setStudentComments(resultSet
						.getString("studentComments"));
				timesheet
						.setDateSubmitted(resultSet.getString("dateSubmitted"));
				timesheet.setPayPeriod(resultSet.getString("payPeriod"));
				timesheet.setTimesheetStatus(resultSet
						.getString("timesheetStatus"));

				timesheets.add(timesheet);

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

		return timesheets;

	}

	// Method to Retrieve a particular timesheet for manager review.
	public static TimesheetDataBean ManagerReview(String id) {

		Statement stmt = null;
		TimesheetDataBean bean = new TimesheetDataBean();
		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String timesheetId = id;
			resultSet = stmt
					.executeQuery("select * from timesheet where timesheetId="
							+ timesheetId);

			while (resultSet.next()) {
				bean.setTimesheetId(resultSet.getInt("timesheetId"));
				bean.setNeiuId(resultSet.getInt("neiuId"));
				bean.setTotalWeek1(resultSet.getInt("totalweek1"));
				bean.setTotalWeek2(resultSet.getInt("totalweek2"));
				bean.setTotalWeek(resultSet.getInt("totalweek"));
				bean.setWeek1Mon(resultSet.getInt("week1mon"));
				bean.setWeek1Tue(resultSet.getInt("week1tue"));
				bean.setWeek1Wed(resultSet.getInt("week1wed"));
				bean.setWeek1Thu(resultSet.getInt("week1thu"));
				bean.setWeek1Fri(resultSet.getInt("week1fri"));
				bean.setWeek1Sat(resultSet.getInt("week1sat"));
				bean.setWeek1Sun(resultSet.getInt("week1sun"));
				bean.setWeek2Mon(resultSet.getInt("week2mon"));
				bean.setWeek2Tue(resultSet.getInt("week2tue"));
				bean.setWeek2Wed(resultSet.getInt("week2wed"));
				bean.setWeek2Thu(resultSet.getInt("week2thu"));
				bean.setWeek2Fri(resultSet.getInt("week2fri"));
				bean.setWeek2Sat(resultSet.getInt("week2sat"));
				bean.setWeek2Sun(resultSet.getInt("week2sun"));
				bean.setPayPeriod(resultSet.getString("payPeriod"));

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

	// Method for retrieving a particular timesheet based on Timesheet Id to be
	// displayed to Student.
	public static TimesheetDataBean StudentView(String id) {

		Statement stmt = null;
		TimesheetDataBean bean = new TimesheetDataBean();
		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String timesheetId = id;
			resultSet = stmt
					.executeQuery("select * from timesheet where timesheetId="
							+ timesheetId);
			while (resultSet.next()) {
				bean.setTimesheetId(resultSet.getInt("timesheetId"));
				bean.setNeiuId(resultSet.getInt("neiuId"));
				bean.setTotalWeek1(resultSet.getInt("totalweek1"));
				bean.setTotalWeek2(resultSet.getInt("totalweek2"));
				bean.setTotalWeek(resultSet.getInt("totalweek"));
				bean.setWeek1Mon(resultSet.getInt("week1mon"));
				bean.setWeek1Tue(resultSet.getInt("week1tue"));
				bean.setWeek1Wed(resultSet.getInt("week1wed"));
				bean.setWeek1Thu(resultSet.getInt("week1thu"));
				bean.setWeek1Fri(resultSet.getInt("week1fri"));
				bean.setWeek1Sat(resultSet.getInt("week1sat"));
				bean.setWeek1Sun(resultSet.getInt("week1sun"));
				bean.setWeek2Mon(resultSet.getInt("week2mon"));
				bean.setWeek2Tue(resultSet.getInt("week2tue"));
				bean.setWeek2Wed(resultSet.getInt("week2wed"));
				bean.setWeek2Thu(resultSet.getInt("week2thu"));
				bean.setWeek2Fri(resultSet.getInt("week2fri"));
				bean.setWeek2Sat(resultSet.getInt("week2sat"));
				bean.setWeek2Sun(resultSet.getInt("week2sun"));
				bean.setStudentComments(resultSet.getString("studentComments"));
				bean.setPayPeriod(resultSet.getString("payPeriod"));
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

	// Method to written for student to update the timesheet data to the
	// database.
	public static void StudentUpdate(TimesheetDataBean bean, String neiuId,
			String code) {
		Statement stmt = null;
		// TODO Auto-generated method stub
		try {
			// connect to dB
			currentCon = ConnectionManager.getConnection();
			if (code.equalsIgnoreCase("update")) {
				System.out.println("code is " + code);

				String delStmt = "Delete from timesheet where timesheetId="
						+ bean.getTimesheetId();

				stmt = currentCon.createStatement();
				stmt.executeUpdate(delStmt);
				String cmmts = bean.getStudentComments();
				String updateStmt = "Insert into timesheet (neiuId,dateSubmitted,payPeriod,studentComments, week1mon, week1tue, week1wed, week1thu, week1fri,week1sat, week1sun, week2mon, week2tue,week2wed,week2thu,week2fri,week2sat,week2sun, totalweek1, totalweek2, totalweek) Values ("
						+ bean.getNeiuId()
						+ ","
						+ "now()"
						+ ","
						+ "'"
						+ bean.getPayPeriod()
						+ "'"
						+ ",'"
						+ cmmts
						+ "',"
						+ bean.getWeek1Mon()
						+ ","
						+ bean.getWeek1Tue()
						+ ","
						+ bean.getWeek1Wed()
						+ ","
						+ bean.getWeek1Thu()
						+ ","
						+ bean.getWeek1Fri()
						+ ","
						+ bean.getWeek1Sat()
						+ ","
						+ bean.getWeek1Sun()
						+ ","
						+ bean.getWeek2Mon()
						+ ","
						+ bean.getWeek2Tue()
						+ ","
						+ bean.getWeek2Wed()
						+ ","
						+ bean.getWeek2Thu()
						+ ","
						+ bean.getWeek2Fri()
						+ ","
						+ bean.getWeek2Sat()
						+ ","
						+ bean.getWeek2Sun()
						+ ","
						+ bean.getTotalWeek1()
						+ ","
						+ bean.getTotalWeek2()
						+ "," + bean.getTotalWeek() + ")";
				stmt.executeUpdate(updateStmt);

			} else {
				String delStmt = "Delete from timesheet where timesheetId="
						+ bean.getTimesheetId();
				stmt = currentCon.createStatement();
				stmt.executeUpdate(delStmt);
			}
		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	}

	// Method to retreive timesheets based on student's Id
	public static List<TimesheetDataBean> StudentRetrieve(String neiuId) {

		List<TimesheetDataBean> timesheets = new ArrayList<TimesheetDataBean>();
		Statement stmt = null;
		try {
			// connect to DB
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.createStatement();
			String id = neiuId;
			resultSet = stmt
					.executeQuery("select * from timesheet where neiuId=" + id);

			while (resultSet.next()) {
				TimesheetDataBean timesheet = new TimesheetDataBean();
				timesheet.setTimesheetId(resultSet.getInt("timesheetId"));
				timesheet.setNeiuId(resultSet.getInt("neiuId"));
				timesheet.setTotalWeek(resultSet.getInt("totalweek"));
				timesheet.setManagerComments(resultSet
						.getString("managerComments"));
				timesheet.setStudentComments(resultSet
						.getString("studentComments"));
				timesheet.setTimesheetStatus(resultSet
						.getString("timesheetStatus"));
				timesheet.setPayPeriod(resultSet.getString("payPeriod"));
				timesheet
						.setDateSubmitted(resultSet.getString("dateSubmitted"));

				timesheets.add(timesheet);

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

		return timesheets;

	}

	// Method to update timesheet status and manager comments to database.
	public static void update(String[] timesheetIdValues, String code,
			String[] comments) {
		Statement stmt = null;
		System.out.println("comm"+ comments[0]);
		for (int i = 0; i < timesheetIdValues.length; i++) {
			try {
				// connect to DB
				currentCon = ConnectionManager.getConnection();

				if (code.equalsIgnoreCase("approve")) {
					String temp = "Approved";
					String timesheetId = timesheetIdValues[i];
					String comment = comments[i];
					String updateStmt = "update timesheet set timesheetStatus='"
							+ temp
							+ "',managerComments='"
							+ comment
							+ "' where timesheetId=" + timesheetId;
					stmt = currentCon.createStatement();
					stmt.executeUpdate(updateStmt);
				} else if (code.equalsIgnoreCase("reject")) {
					String temp = "Rejected";
					String timesheetId = timesheetIdValues[i];
					String comment = comments[i];
					String updateStmt = "update timesheet set timesheetStatus='"
							+ temp
							+ "',managerComments='"
							+ comment
							+ "' where timesheetId=" + timesheetId;
					stmt = currentCon.createStatement();
					stmt.executeUpdate(updateStmt);
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
		}

	}

	// Method to create a timesheet.
	public static boolean StudentCreate(TimesheetDataBean bean, String neiuId,
			String code) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		// TODO Auto-generated method stub
		try {
			// connect to dB
			currentCon = ConnectionManager.getConnection();
			if (code.equalsIgnoreCase("submit")) {
				stmt = currentCon.createStatement();
				String cmmts = bean.getStudentComments();
				String insertStmt = "Insert into timesheet (neiuId,dateSubmitted,payPeriod,studentComments, week1mon, week1tue, week1wed, week1thu, week1fri,week1sat, week1sun, week2mon, week2tue,week2wed,week2thu,week2fri,week2sat,week2sun, totalweek1, totalweek2, totalweek) Values ("
						+ bean.getNeiuId()
						+ ","
						+ "now()"
						+ ",'"
						+ bean.getPayPeriod()
						+ "','"
						+ cmmts
						+ "',"
						+ bean.getWeek1Mon()
						+ ","
						+ bean.getWeek1Tue()
						+ ","
						+ bean.getWeek1Wed()
						+ ","
						+ bean.getWeek1Thu()
						+ ","
						+ bean.getWeek1Fri()
						+ ","
						+ bean.getWeek1Sat()
						+ ","
						+ bean.getWeek1Sun()
						+ ","
						+ bean.getWeek2Mon()
						+ ","
						+ bean.getWeek2Tue()
						+ ","
						+ bean.getWeek2Wed()
						+ ","
						+ bean.getWeek2Thu()
						+ ","
						+ bean.getWeek2Fri()
						+ ","
						+ bean.getWeek2Sat()
						+ ","
						+ bean.getWeek2Sun()
						+ ","
						+ bean.getTotalWeek1()
						+ ","
						+ bean.getTotalWeek2()
						+ "," + bean.getTotalWeek() + ")";
				stmt.executeUpdate(insertStmt);
				return true;

			} 
		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
		return false;
	}

}
