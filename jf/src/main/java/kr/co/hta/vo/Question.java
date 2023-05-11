package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Question {
	private int no;
	private String title;
	private String contents;
	private Date createDate;
	private String status;
	private String theaterName;
	private String answerContents;
	private Date answerCreateDate;
	private String nickname;
	private int theaterNo;
	private String memberId;
	
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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getAnswerContents() {
		return answerContents;
	}
	public void setAnswerContents(String answerContents) {
		this.answerContents = answerContents;
	}
	public Date getAnswerCreateDate() {
		return answerCreateDate;
	}
	public void setAnswerCreateDate(Date answerCreateDate) {
		this.answerCreateDate = answerCreateDate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String memberId) {
		this.nickname = memberId;
	}
}
