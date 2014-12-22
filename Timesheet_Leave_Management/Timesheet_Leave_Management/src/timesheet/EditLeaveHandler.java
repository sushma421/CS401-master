//  Author      : Jyoti Behera
//  Description : This servlet retrives the data from the database and displays it to the student, to see the status of the leave applied and edit it if editable.

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


public class EditLeaveHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditLeaveHandler() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		if(request.getSession().getAttribute("username") == null){			// getting the username from the seesion
			request.getSession().setAttribute("username", "test");
		}
		
		String netID = request.getSession().getAttribute("username").toString();
		LeaveInfo lInfo = new LeaveInfo();
		LeaveDbo ldbo= new LeaveDbo();
		lInfo.setNetID(netID);
		ArrayList<LeaveInfo> lInfoList = new ArrayList<LeaveInfo>();
		
		ServletContext sc = this.getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/editLeave.jsp");
		
		
		try {
			
			lInfoList = ldbo.getLeaveDetails(lInfo);				// retrives leave details from the database
			request.setAttribute("editleave", lInfoList);
			rd.forward(request, response);						// presents the leave details to the student which is retrived 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
