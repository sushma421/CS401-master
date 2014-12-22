// Author      : Jyoti Behera
// Description : This class file contains all the getter and setter methods.

package timesheet;

import java.util.Date;


public class LeaveInfo
{
	private int leaveID;
	private String netID;
	private Date fDate;
	private Date tDate;
	private String reason;
	private String managerComment;
	private String lStatus;
	
	public Date gettDate() 						// gets the toDate
	{					
		return tDate;
	}
	public void settDate(Date tDate)				// sets the todate				
	{
		this.tDate = tDate;
	}
	
	
	public String getReason()					// gets the leave reason 
	{								
		return reason;
	}
	public void setReason(String reason)				// sets the leave reason
	{								
		this.reason = reason;
	}
	
	
	public String getManagerComment() 				// gets the manager comment
	{							
		return managerComment;
	}

	public void setManagerComment(String managerComment) 		// sets the manager comment
	{
		this.managerComment = managerComment;
	}
	
	
	public String getlStatus()					// gets the leave status
	{
		return lStatus;
	}

	public void setlStatus(String lStatus)				// sets the leave status
	{
		this.lStatus = lStatus;
	}
	
	
	public String getNetID() 					// gets the netID
	{
		return netID;
	}

	public void setNetID(String netID)				// sets the netID
	{
		this.netID = netID;
	}
	
	
	public Date getfDate()						// gets the from  date
	{
		return fDate;
	}

	public void setfDate(Date fDate)				// sets the from date
	{
		this.fDate = fDate;
	}

	public int getLeaveID() 					// gets the leaveID
	{
		return leaveID;
	}

	public void setLeaveID(int leaveID) 				// sets the leaveID
	{
		this.leaveID = leaveID;
	}
	
	
}