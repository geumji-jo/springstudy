package kr.co.hta.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Moviediary {
	private int diaryNo;
	private String diaryContents;
	private Date diaryCreateDate;
	private String memberId;
	private String friend;
	private String trailer;
	private String steelCut;
	private String photo;
	private int detailNo;
	
	public int getDetailNo() {
		return detailNo;
	}
	public void setDetailNo(int detailNo) {
		this.detailNo = detailNo;
	}
	public String getFriend() {
		return friend;
	}
	public void setFriend(String friend) {
		this.friend = friend;
	}
	public String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}
	public String getSteelCut() {
		return steelCut;
	}
	public void setSteelCut(String steelCut) {
		this.steelCut = steelCut;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}
	public String getDiaryContents() {
		return diaryContents;
	}
	public void setDiaryContents(String diaryContents) {
		this.diaryContents = diaryContents;
	}
	public Date getDiaryCreateDate() {
		return diaryCreateDate;
	}
	public void setDiaryCreateDate(Date diaryCreateDate) {
		this.diaryCreateDate = diaryCreateDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
}
