package kr.co.hta.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Theater {
	private int no;
	private String name;
	private String location;
	private String tel;
	private String room;
	private String seat;
	private String trafficInfo;
	private String parkingInfo;
	private String city;
	private String photo;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getTrafficInfo() {
		return trafficInfo;
	}
	public void setTrafficInfo(String trafficInfo) {
		this.trafficInfo = trafficInfo;
	}
	public String getParkingInfo() {
		return parkingInfo;
	}
	public void setParkingInfo(String parkingInfo) {
		this.parkingInfo = parkingInfo;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	
}
