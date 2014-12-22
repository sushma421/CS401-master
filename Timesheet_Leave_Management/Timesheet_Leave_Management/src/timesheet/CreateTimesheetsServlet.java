
	/** @Author: Sushma Adepu
	 * Student create timesheet servlet
	 */
	package timesheet;
	import java.io.IOException;
	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	/**
	 * Servlet implementation class CreateTimesheetsServlet
	 */
	public class CreateTimesheetsServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		   
		/**
		 * @see HttpServlet#HttpServlet()
		 */
		public CreateTimesheetsServlet() {
			super();
		}

		/**this method will handle all get requests
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

		/** this method will handle all post requests
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String code= request.getParameter("submit");
			if((code.equalsIgnoreCase("submit"))){
						TimesheetDataBean bean = new TimesheetDataBean();
						String neiuId = String.valueOf(request.getParameter("neiuId"));
						int neiu = Integer.parseInt(neiuId);
						int week1 = Integer.parseInt(request.getParameter("totweek1"));
						int week2 = Integer.parseInt(request.getParameter("totweek2"));
						int tot = Integer.parseInt(request.getParameter("totweek"));
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
						String stucmts = request.getParameter("stucmts");
						String payperiod = request.getParameter("pay");
						
						bean.setStudentComments(stucmts);
						bean.setPayPeriod(payperiod);		
						bean.setTotalWeek(tot);
						bean.setNeiuId(neiu);
						bean.setTotalWeek1(week1);
						bean.setTotalWeek2(week2);
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
			
						//DAO calls timesheet Create method
						if(TimesheetDAO.StudentCreate(bean, neiuId, code)){
						request.setAttribute("errorMessage", "Timesheet Submitted Sucessfully");  
						RequestDispatcher rd=request.getRequestDispatcher("/createTimesheet.jsp");    
						rd.forward(request,response); 
						}
						else{
						request.setAttribute("errorMessage", "Sorry Something went wrong try again");  
						RequestDispatcher rd=request.getRequestDispatcher("/createTimesheet.jsp");    
						rd.forward(request,response);
						}
						
						  
				}
					
				else{
								
					   
					}
					
				}
		}


