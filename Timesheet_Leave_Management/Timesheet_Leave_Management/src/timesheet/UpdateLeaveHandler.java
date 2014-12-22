// Author      : Jyoti Behera
// Description : This servlet retrives data from database to edit for any specific leaveid

package timesheet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import timesheet.LeaveDbo;
import timesheet.LeaveInfo;


//@WebServlet("/UpdateLeaveHandler")
public class UpdateLeaveHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateLeaveHandler() {
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
		
		
		LeaveInfo lInput = new LeaveInfo();
		LeaveInfo lInfo = new LeaveInfo();
		String lID = request.getParameter("leaveID");
		int leaveID = Integer.parseInt(lID);
		LeaveDbo ldbo = new LeaveDbo();
		lInput.setLeaveID(leaveID);
		try {
			lInfo = ldbo.getDetailsByLeaveID(lInput);					//retrives data from database to edit for the specific leaveid
			ServletContext sc = this.getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/updateLeave.jsp");
			request.setAttribute("updateleave", lInfo);
			rd.forward(request, response);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

}
