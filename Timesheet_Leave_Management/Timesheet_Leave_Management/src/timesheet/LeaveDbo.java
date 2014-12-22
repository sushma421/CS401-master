// Author      : Jyoti Behera
// Description : This class file contains all the function of the leave module for ceating, editing and updating the leave.

package timesheet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import timesheet.JavaUtil;
import timesheet.LeaveInfo;

public class LeaveDbo 
{
	JavaUtil jutil = new JavaUtil();
	String format = "yyyy-MM-dd";
	
	public void createLeave(LeaveInfo linfo) throws SQLException					// This function creates a new leave for the student
	{
		JdbcConnectionPool dbcon = new JdbcConnectionPool();
		Connection conn = null ;
		StringBuffer query = new StringBuffer();
		query.append("insert into userleave(netID,fDate,tdate,reason,managerComment,lStatus) values(");
		query.append("'"+linfo.getNetID()+"'");
		query.append(",");
		query.append("'"+jutil.dateToString(linfo.getfDate(),format)+"'");
		query.append(",");
		query.append("'"+jutil.dateToString(linfo.gettDate(),format)+"'");
		query.append(",");
		query.append("'"+linfo.getReason()+"'");
		query.append(",");
		query.append("''");
		query.append(",");
		query.append("'"+"Pending"+"'");
		query.append(")");
		
		try
		{
			conn = dbcon.getConnection();
			Statement statement = conn.createStatement();
			int result = statement.executeUpdate(query.toString());
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(conn != null)
			{
				conn.close();
			}
		}
		
	}


	public ArrayList<LeaveInfo> getLeaveDetails(LeaveInfo linfoInput) throws SQLException		  // This function retrives all the data for the leave applied from the database 
	{
		JdbcConnectionPool dbcon = new JdbcConnectionPool();
		Connection conn = null ;
		StringBuffer query = new StringBuffer();
		query.append("Select * from userleave where netID = ");
		query.append("'"+linfoInput.getNetID()+"'");
		ArrayList<LeaveInfo> lInfoList = new ArrayList<LeaveInfo>();
		
		try
		{
			conn = dbcon.getConnection();
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(query.toString());
			while (rs.next()) {
	            	LeaveInfo lInfo = new LeaveInfo();
	            	int leaveID = rs.getInt("leaveID");
	            	String netID = rs.getString("netID");
	            	Date fdate = rs.getDate("fDate");
	            	Date tdate = rs.getDate("tDate");
	            	String reason = rs.getString("reason");
	            	String managerComment = rs.getString("ManagerComment");
	            	String lStatus = rs.getString("lStatus");
	            	
	          
	            	lInfo.setLeaveID(leaveID);
	            	lInfo.setNetID(netID);
	            	lInfo.setfDate(fdate);
	    	    	lInfo.settDate(tdate);
	            	lInfo.setReason(reason);
	    	    	lInfo.setManagerComment(managerComment);
	            	lInfo.setlStatus(lStatus);
	    	    	lInfoList.add(lInfo);
	    		

	        }
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(conn != null)
			{
				conn.close();
			}
		}
		return lInfoList;
		
	}


	public LeaveInfo getDetailsByLeaveID(LeaveInfo lInput) throws SQLException{		// This function retrives all the leave applied by a particular student using the leaveID 
		JdbcConnectionPool dbcon = new JdbcConnectionPool();
		Connection conn = null ;
		StringBuffer query = new StringBuffer();
		query.append("Select * from userleave where LeaveID = ");
		query.append(lInput.getLeaveID());
		LeaveInfo lInfo = new LeaveInfo();
		 
		try
		{
			conn = dbcon.getConnection();
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(query.toString());
			while (rs.next()) {
	           
	                int leaveID = rs.getInt("leaveID");
	                String netID = rs.getString("netID");
	                Date fdate = rs.getDate("fDate");
	                Date tdate = rs.getDate("tDate");
	                String reason = rs.getString("reason");
	                String managerComment = rs.getString("ManagerComment");
	                String lStatus = rs.getString("lStatus");
	                
	          
	                lInfo.setLeaveID(leaveID);
	                lInfo.setNetID(netID);
	                lInfo.setfDate(fdate);
	    		lInfo.settDate(tdate);
	    		lInfo.setReason(reason);
	    		lInfo.setManagerComment(managerComment);
	    		lInfo.setlStatus(lStatus);
				}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(conn != null)
			{
				conn.close();
			}
		}
		return lInfo;
			
	}


	public void updateLeave(LeaveInfo lInfo) throws SQLException{				// This function updates the leave when it is edited


		JdbcConnectionPool dbcon = new JdbcConnectionPool();
		Connection conn = null ;
		StringBuffer query = new StringBuffer();
		query.append("update userleave ");
		query.append ("SET fDate=");
		query.append("'"+jutil.dateToString(lInfo.getfDate(),format)+"'");
		query.append(" , tDate=");
		query.append("'"+jutil.dateToString(lInfo.gettDate(),format)+"'");
		query.append(" , reason =");
		query.append("'"+lInfo.getReason()+"'");
		query.append(", managerComment=' '");
		query.append(", lStatus = 'Pending'");
		query.append(" WHERE leaveID =");
		query.append(lInfo.getLeaveID());
		
		
		try
		{
			conn = dbcon.getConnection();
			Statement statement = conn.createStatement();
			int result = statement.executeUpdate(query.toString());
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(conn != null)
			{
				conn.close();
			}
		}
		
		}
}
