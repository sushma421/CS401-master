/*  

 - Author      : Lakshmi Thammishetty
 - Description : This java file is a servlet connects to Database and updates the manager's decision to either approve or reject to database.

 */

package timesheet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class ManagerTimesheetsServlet
 */
public class ManagerTimesheetsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ManagerTimesheetsServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// / TODO Auto-generated method stub
	
		//retrieving necessary form data  to update to database
		
		String[] timesheetIdValues = request.getParameterValues("timesheetId");
		String code = request.getParameter("submit");
		String[] comments = request.getParameterValues("comments");

		if (code.equalsIgnoreCase("approve") || code.equalsIgnoreCase("reject")) {

			if (timesheetIdValues == null) {

				String redirectURL = "managerTimesheets.jsp";
				response.sendRedirect(redirectURL);
				JOptionPane.showMessageDialog(null,
						"Please select atleast one Timesheet", "",
						JOptionPane.INFORMATION_MESSAGE);
			} else {
				
				// connecting to database via TimesheetDAO
				TimesheetDAO.update(timesheetIdValues, code, comments);

				String redirectURL = "managerTimesheets.jsp";
				response.sendRedirect(redirectURL);
			}
		} else {
			request.setAttribute("id", code);
			javax.servlet.RequestDispatcher rd = this.getServletContext()
					.getRequestDispatcher("/managerReview.jsp");
			rd.forward(request, response);
		}

	}
}
