package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiaryMovieDetail {
	private int detailNo;
	private int reservationCount;
	private Date screeningDate;
	private String poster;
	private String roomName;
	private String korTitle;
	private String engTitle;
	private String screeningTime;
	private String theaterName;
	private String steelcut;
	private String trailer;
	public int getDetailNo() {
		return detailNo;
	}
	public void setDetailNo(int detailNo) {
		this.detailNo = detailNo;
	}
	public int getReservationCount() {
		return reservationCount;
	}
	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	}
	public Date getScreeningDate() {
		return screeningDate;
	}
	public void setScreeningDate(Date screeningDate) {
		this.screeningDate = screeningDate;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getKorTitle() {
		return korTitle;
	}
	public void setKorTitle(String korTitle) {
		this.korTitle = korTitle;
	}
	public String getEngTitle() {
		return engTitle;
	}
	public void setEngTitle(String engTitle) {
		this.engTitle = engTitle;
	}
	public String getScreeningTime() {
		return screeningTime;
	}
	public void setScreeningTime(String screeningTime) {
		this.screeningTime = screeningTime;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getSteelcut() {
		return steelcut;
	}
	public void setSteelcut(String steelcut) {
		this.steelcut = steelcut;
	}
	public String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}
	
	
}
