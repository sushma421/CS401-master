//  Author      : Jyoti Behera
//  Description : This servlet is used to create a new leave for the student worker.

package timesheet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import timesheet.LeaveDbo;
import timesheet.JavaUtil;
import timesheet.LeaveInfo;


public class ApplyLeaveHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyLeaveHandler() {
        
    super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
		String fdate = request.getParameter("fDatepicker");				//retrives all the data submited by student for applying leave
		String tdate = request.getParameter("tDatepicker");
		String reason = request.getParameter("reason");
		String netID = request.getSession().getAttribute("username").toString();
		
		JavaUtil jutil = new JavaUtil();
		Date frmdt = jutil.stringToDate(fdate);
		Date todt = jutil.stringToDate(tdate);
		
		LeaveInfo lInfo = new LeaveInfo();
		lInfo.setfDate(frmdt);
		lInfo.settDate(todt);
		lInfo.setReason(reason);
		lInfo.setNetID(netID);
		
		LeaveDbo ldbo= new LeaveDbo();
		try 
		{
			

			ldbo.createLeave(lInfo);   						// creates a new leave for the student worker
			request.setAttribute("errorMessage", "Leave has been submitted");  
			RequestDispatcher rd=request.getRequestDispatcher("/applyLeave.jsp");    
			rd.forward(request,response); 	
		
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
