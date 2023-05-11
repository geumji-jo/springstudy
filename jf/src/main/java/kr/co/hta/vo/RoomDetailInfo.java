package kr.co.hta.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomDetailInfo {
	private String times;
	private int leftSeat;
	private int screeningNo;
	private String dates;
	
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public int getLeftSeat() {
		return leftSeat;
	}
	public void setLeftSeat(int leftSeat) {
		this.leftSeat = leftSeat;
	}
	public int getScreeningNo() {
		return screeningNo;
	}
	public void setScreeningNo(int screeningNo) {
		this.screeningNo = screeningNo;
	}
	
	
}
