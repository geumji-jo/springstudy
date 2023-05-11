package kr.co.hta.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	
	public static String dateToString(Date date) {
		if(date == null) {
			return "";
		}
		return sdf.format(date);
	}
}
