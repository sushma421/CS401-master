<%-- 
	  - @Author(s): Sushma Adepu
	  - @Description: This jsp allows Student User to edit  or view alredy submitted timesheet.
 --%>
<%@page import="timesheet.UserDataBean"%>
<%@page import="timesheet.UserDAO"%>
<%@page import="timesheet.PayPeriodBean"%>
<%@page import="timesheet.PayPeriodDAO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%!String neiuID = null;%>
<%
	neiuID=session.getAttribute("username").toString();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="timesheet.css" rel="Stylesheet" type="text/css">
<link href="template.css" rel="Stylesheet" type="text/css">

<script src="js/timesheet.js"></script>

</head>
<body>
    
    <%--Retrieving user information based on session variable--%>

	<%
		UserDataBean user = UserDAO.StudentDetails(neiuID);    //retrieves User details from Student's username

		// displays error message to user in case if soemthing went wrong

		if (request.getAttribute("errorMessage") != null) {
	%><h3 id="message">
		<%
			out.println(request.getAttribute("errorMessage"));
			}
		%>
	</h3>




	<form name="createsheet" method="post" action="CreateTimesheetsServlet">
		<table>

			<tr class="firstrow">
				<th colspan="2">Student ID</th>
				<td><%=user.getNeiuId()%></td>
				<th colspan="1">Student Name</th>
				<td colspan="2"><%=user.getFirstName()%>, <%=user.getLastName()%></td>
				<th colspan="3"></th>
				<td></td>
			</tr>
			<tr class="secondrow">


				<th colspan="2">ORG</th>
				<td><%=user.getOrgId()%></td>

				<th colspan="1">Fund</th>
				<td><%=user.getFundId()%></td>
				<th></th>
				<th colspan="1">PayPeriod Date</th>
				<td colspan="3"><select name="pay">
						<%
							List<PayPeriodBean> list = PayPeriodDAO.populateDates();

							for (PayPeriodBean t : list) {
						%>

						<option name="pay" value=<%=String.valueOf(t.getDate())%>><%=t.getDate()%></option>

						<%
							}
						%>
				</select></td>
			</tr>
			<%--
		<th colspan="1">PayPeriod Date<th>
		<td colspan="1"><input type="text" name="pay"/></td>
	   --%>

			<td></td>

			</tr>
			<tr class="blank_row">
			</tr>


			<tr>
				<th></th>
				<th>Monday</th>
				<th>Tuesday</th>
				<th>Wednesday</th>
				<th>Thursday</th>
				<th>Friday</th>
				<th>Saturday</th>
				<th>Sunday</th>
				<th>Hours</th>
			</tr>
			<tr class="blank_row1">
			</tr>
			<tr>
				<td>Week 1</td>
				<td><input type="number" class="week1" value="" name=week1mon
					onkeyup="minmax(0);"></td>
				<td><input type="number" class="week1" value="" name=week1tue
					onkeyup="minmax(1);"></td>
				<td><input type="number" class="week1" value="" name=week1wed
					onkeyup="minmax(2);"></td>
				<td><input type="number" class="week1" value="" name=week1thu
					onkeyup="minmax(3);"></td>
				<td><input type="number" class="week1" value="" name=week1fri
					onkeyup="minmax(4);"></td>
				<td><input type="number" class="week1" value="" name=week1sat
					onkeyup="minmax(5);"></td>
				<td><input type="number" class="week1" value="" name=week1sun
					onkeyup="minmax(6);"></td>
				<td><input type="number" id="totweek1" name=totweek1></td>
			</tr>
			<tr class="blank_row2">
			</tr>
			<tr>
				<td>Week 2</td>
				<td><input type="number" class="week2" value="" name=week2mon
					onkeyup="minmax2(0);"></td>
				<td><input type="number" class="week2" value="" name=week2tue
					onkeyup="minmax2(1);"></td>
				<td><input type="number" class="week2" value="" name=week2wed
					onkeyup="minmax2(2);"></td>
				<td><input type="number" class="week2" value="" name=week2thu
					onkeyup="minmax2(3);"></td>
				<td><input type="number" class="week2" value="" name=week2fri
					onkeyup="minmax2(4);"></td>
				<td><input type="number" class="week2" value="" name=week2sat
					onkeyup="minmax2(5);"></td>
				<td><input type="number" class="week2" value="" name=week2sun
					onkeyup="minmax2(6);"></td>
				<td><input type="number" id="totweek2" name=totweek2></td>
			</tr>
			<tr>
				<td colspan="8"><label>Comments:</label>
				<textarea rows="3" cols="70" name="stucmts"></textarea></td>
				<td><input type="text" id="totweek" value="" name=totweek></td>
			</tr>

			<tr class="blank_row1">
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><input type="button" id="validate" value="Validate"
					onclick="calculateTotal();"></td>
				<td></td>
				<td><input type="submit" id="submit" name="submit"
					disabled="disabled" value="Submit"></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="hidden" name="neiuId"
					value=<%=String.valueOf(user.getNeiuId())%>></td>
			</tr>

		</table>
	</form>


</body>
</html>