package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor

public class MyTheater {

	private int no;
	private int theaterNo;
	private String memberId;
	private Date createDate;
	private String theaterName;
	private String used;
	private String city;
	
	public MyTheater() {}
	
	
	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getTheaterName() {
		return theaterName;
	}


	

	public String getUsed() {
		return used;
	}



	public void setUsed(String used) {
		this.used = used;
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

	public int getTheaterNo() {
		return theaterNo;
	}

	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
