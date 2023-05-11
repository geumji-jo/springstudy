package kr.co.hta.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScreeningDate {
	private String month;
	private String date;
	private String fullDate;
	
	public String getFullDate() {
		return fullDate;
	}
	public void setFullDate(String fullDate) {
		this.fullDate = fullDate;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
