package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int no;
	private int gpa;
	private String rcomment;
	private int production;
	private int ost;
	private int story;
	private int actor;
	private int beauty;
	private String memberId;
	private int movieNo;
	private Date createDate;
	private int likes;
	
	
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGpa() {
		return gpa;
	}
	public void setGpa(int gpa) {
		this.gpa = gpa;
	}
	
	public String getRcomment() {
		return rcomment;
	}
	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}
	public int getProduction() {
		return production;
	}
	public void setProduction(int production) {
		this.production = production;
	}
	public int getOst() {
		return ost;
	}
	public void setOst(int ost) {
		this.ost = ost;
	}
	public int getStory() {
		return story;
	}
	public void setStory(int story) {
		this.story = story;
	}
	public int getActor() {
		return actor;
	}
	public void setActor(int actor) {
		this.actor = actor;
	}
	public int getBeauty() {
		return beauty;
	}
	public void setBeauty(int beauty) {
		this.beauty = beauty;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	
	
}
