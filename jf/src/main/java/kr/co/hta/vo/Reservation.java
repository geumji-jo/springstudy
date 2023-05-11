package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {

	private int no;
	private String memberId;
	private int screeningNo;
	private Date reservationDate;
	private String reservationYn;
	private int reservationCount;
	
	private String theaterNo;
	private String theaterName;
	private String roomName;
	private Date screeningDate;
	private String screeningTime;
	private String movieKorTitle;
	private String moviePoster;
	private int movieNo;
	private String movieEngTitle;
	
	//public Reservation() {}
	
	
	
	public String getTheaterNo() {
		return theaterNo;
	}


	
	
	public String getScreeningTime() {
		return screeningTime;
	}



	public void setScreeningTime(String screeningTime) {
		this.screeningTime = screeningTime;
	}



	public void setTheaterNo(String theaterNo) {
		this.theaterNo = theaterNo;
	}



	public String getMovieEngTitle() {
		return movieEngTitle;
	}



	public void setMovieEngTitle(String movieEngTitle) {
		this.movieEngTitle = movieEngTitle;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getScreeningNo() {
		return screeningNo;
	}

	public void setScreeningNo(int screeningNo) {
		this.screeningNo = screeningNo;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationYn() {
		return reservationYn;
	}

	public void setReservationYn(String reservationYn) {
		this.reservationYn = reservationYn;
	}

	public int getReservationCount() {
		return reservationCount;
	}

	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Date getScreeningDate() {
		return screeningDate;
	}

	public void setScreeningDate(Date screeningDate) {
		this.screeningDate = screeningDate;
	}

	public String getMovieKorTitle() {
		return movieKorTitle;
	}

	public void setMovieKorTitle(String movieKorTitle) {
		this.movieKorTitle = movieKorTitle;
	}

	public String getMoviePoster() {
		return moviePoster;
	}

	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	
	
}