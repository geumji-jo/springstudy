package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScreeningDetail {
	private int no;
	private Date screeningDate;
	private String time;
	private String korTitle;
	private String roomName;
	private String theaterName;
	
	
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getScreeningDate() {
		return screeningDate;
	}
	public void setScreeningDate(Date screeningDate) {
		this.screeningDate = screeningDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	public String getKorTitle() {
		return korTitle;
	}
	public void setKorTitle(String korTitle) {
		this.korTitle = korTitle;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	
	
}
