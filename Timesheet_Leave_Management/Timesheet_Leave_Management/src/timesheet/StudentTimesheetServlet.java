/** @Author: Sushma Adepu
	 * Student Timesheet servlet
	 */
	package timesheet;

	import java.io.IOException;
	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;


	/**
	 * Servlet implementation class StudentTimesheetServlet
	 */
	public class StudentTimesheetServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		   
		/**
		 * @see HttpServlet#HttpServlet()
		 */
		public StudentTimesheetServlet() {
			super();
			
		}

		/**this method handles all get requests
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			}

		/**this method handles al post requests
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String code=request.getParameter("submit");
			String id= request.getParameter("id");
			request.setAttribute("submit",code);
			request.setAttribute("id", id);
			javax.servlet.RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/studentView.jsp");
			rd.forward(request, response);
		}

	}
