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
	 * Servlet implementation class StudentUpdateServlet
	 */
	public class StudentUpdateServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		   
		/**
		 * @see HttpServlet#HttpServlet()
		 */
		public StudentUpdateServlet() {
			super();
			
		}

		/**this method handles all get requests 
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		}

		/** this method handles all post requests
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			
			String code= request.getParameter("submit");
			
			if(!(code.equalsIgnoreCase("back"))){
				
						TimesheetDataBean bean = new TimesheetDataBean();
						String neiuId = String.valueOf(request.getParameter("neiuId"));
						int neiu = Integer.parseInt(request.getParameter("neiuId"));
						int timeSheet= Integer.parseInt(request.getParameter("timesheetId"));
						int week1 = Integer.parseInt(request.getParameter("totweek1"));
						int week2 = Integer.parseInt(request.getParameter("totweek2"));
						int wm1 = Integer.parseInt(request.getParameter("week1mon"));
						int wt1 = Integer.parseInt(request.getParameter("week1tue"));
						int ww1 = Integer.parseInt(request.getParameter("week1wed"));
						int wth1 = Integer.parseInt(request.getParameter("week1thu"));
						int wf1 = Integer.parseInt(request.getParameter("week1fri"));
						int ws1 = Integer.parseInt(request.getParameter("week1sat"));
						int wsu1 = Integer.parseInt(request.getParameter("week1sun"));
						int wm2 = Integer.parseInt(request.getParameter("week2mon"));
						int wt2 = Integer.parseInt(request.getParameter("week2tue"));
						int ww2 = Integer.parseInt(request.getParameter("week2wed"));
						int wth2 = Integer.parseInt(request.getParameter("week2thu"));
						int wf2 = Integer.parseInt(request.getParameter("week2fri"));
						int ws2 = Integer.parseInt(request.getParameter("week2sat"));
						int wsu2 = Integer.parseInt(request.getParameter("week2sun"));
						String cmmts = request.getParameter("stucmts");
						int totweek = Integer.parseInt(request.getParameter("totweek"));
						String payPeriod = request.getParameter("pay");
						//setting values to timesheet bean 
						bean.setNeiuId(neiu);
						bean.setTimesheetId(timeSheet);
						bean.setTotalWeek1(week1);
						bean.setTotalWeek2(week2);
						bean.setTotalWeek(totweek);
						bean.setWeek1Mon(wm1);
						bean.setWeek1Tue(wt1);
						bean.setWeek1Wed(ww1);
						bean.setWeek1Thu(wth1);
						bean.setWeek1Fri(wf1);
						bean.setWeek1Sat(ws1);
						bean.setWeek1Sun(wsu1);
						bean.setWeek2Mon(wm2);
						bean.setWeek2Tue(wt2);
						bean.setWeek2Wed(ww2);
						bean.setWeek2Thu(wth2);
						bean.setWeek2Fri(wf2);
						bean.setWeek2Sat(ws2);
						bean.setWeek2Sun(wsu2);
						bean.setStudentComments(cmmts);
						bean.setPayPeriod(payPeriod);
						// calling update method 
						TimesheetDAO.StudentUpdate(bean, neiuId, code);
						System.out.println("in redirect");
						String redirectURL= "studentViewTimesheets.jsp";  
						response.sendRedirect(redirectURL);  
				}		
				}
		}


