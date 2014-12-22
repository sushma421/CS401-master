// Author      : Jyoti Behera
// Description : This servlet updates the leave after it is edited 

package timesheet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SubmitUpdatedLeaveHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitUpdatedLeaveHandler() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String fdate = request.getParameter("fDatepicker");					//retrives all the data submited by student to edit leave
		String tdate = request.getParameter("tDatepicker");
		String reason = request.getParameter("reason");
		String lID = request.getParameter("leaveid").trim();
		int leaveID = Integer.parseInt(lID);
		String netID = request.getSession().getAttribute("username").toString();
		
		JavaUtil jutil = new JavaUtil();
		Date frmdt = jutil.stringToDate(fdate);
		Date todt = jutil.stringToDate(tdate);
		
		LeaveInfo lInfo = new LeaveInfo();
		lInfo.setfDate(frmdt);
		lInfo.settDate(todt);
		lInfo.setReason(reason);
		lInfo.setNetID(netID);
		lInfo.setLeaveID(leaveID);
		
		LeaveDbo ldbo= new LeaveDbo();
		try 
		{
			
			ldbo.updateLeave(lInfo);							// updates the leave
			ServletContext sc = this.getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/EditLeaveHandler");
			request.setAttribute("leaveupdate", "Y");
			rd.forward(request, response);
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	
	}

}
