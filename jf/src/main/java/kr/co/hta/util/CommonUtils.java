package kr.co.hta.util;

public class CommonUtils {
	public static int stringToZero(String str) {
		return stringToNumber(str,0);
	}
	
	public static int stringToNumber(String str, int defaultNumber) {
		if(str == null) {
			return defaultNumber;
		}
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}
	
}
