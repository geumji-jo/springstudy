package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticketing {

	private int movieNo;
	private String movieTitle;
	private String theaterCity;
	private String theaterName;
	private Date screeningDate;
	private String screeningTime;
	private String roomName;
	private int roomSeat;
	private int screeningNo;
	
	public int getScreeningNo() {
		return screeningNo;
	}
	public void setScreeningNo(int screeningNo) {
		this.screeningNo = screeningNo;
	}
	
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getTheaterCity() {
		return theaterCity;
	}
	public void setTheaterCity(String theaterCity) {
		this.theaterCity = theaterCity;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public Date getScreeningDate() {
		return screeningDate;
	}
	public void setScreeningDate(Date screeningDate) {
		this.screeningDate = screeningDate;
	}
	public String getScreeningTime() {
		return screeningTime;
	}
	public void setScreeningTime(String screeningTime) {
		this.screeningTime = screeningTime;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomSeat() {
		return roomSeat;
	}
	public void setRoomSeat(int roomSeat) {
		this.roomSeat = roomSeat;
	}
	
}
