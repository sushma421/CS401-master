// Author      : Jyoti Behera	
// Description : This servlet displays all the leaves applied by a particular student

package timesheet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class EditLeaveHandler
 */
//@WebServlet("/ViewLeaveHandler")
public class ViewLeaveHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewLeaveHandler() {
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
		
		String netID = request.getSession().getAttribute("username").toString();
		LeaveInfo lInfo = new LeaveInfo();
		LeaveDbo ldbo= new LeaveDbo();
		lInfo.setNetID(netID);
		ArrayList<LeaveInfo> lInfoList = new ArrayList<LeaveInfo>();
		
		ServletContext sc = this.getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("viewLeave.jsp");
		
		
		try {
			
			lInfoList = ldbo.getLeaveDetails(lInfo);						// This displays all the leaves applied by a particular student
			request.setAttribute("viewleave", lInfoList);
			rd.forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
