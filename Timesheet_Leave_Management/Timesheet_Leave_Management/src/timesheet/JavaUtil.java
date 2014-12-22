package timesheet;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class JavaUtil{
	
	public Date stringToDate(String datestr){
		System.out.println("Stringtodate: " + datestr);
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		Date ddate = new Date();
		try {
			ddate = df.parse(datestr);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(datestr +" : " + ddate.toString());
		return ddate;
	}
	
	public int dcompare(Date frmdt,Date todt){
		if(todt.compareTo(frmdt)>0){
			return 1;
		}
		else if(todt.compareTo(frmdt)<0){
			return -1;
		}
		else
			
		return 0;
		}
	
	public String dateToString(Date date, String format)
	{		
//		format : yyyy-MM-dd while writing into DB
//		format : MM/dd/yyyy while displaying on UI
		DateFormat df1 = new SimpleDateFormat(format);
		return (df1.format(date));
	}
		
	}
	
