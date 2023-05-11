package kr.co.hta.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CityCount {

	private int movieNo;
	private int seoul;
	private int incheon;
	private int bsus;
	private int gjj;
	private int kangwon;
	private int djcc;
	private int daegu;
	private int kyeongsang;
	private int kyeongi;

	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getSeoul() {
		return seoul;
	}
	public void setSeoul(int seoul) {
		this.seoul = seoul;
	}
	public int getIncheon() {
		return incheon;
	}
	public void setIncheon(int incheon) {
		this.incheon = incheon;
	}
	public int getBsus() {
		return bsus;
	}
	public void setBsus(int bsus) {
		this.bsus = bsus;
	}
	public int getGjj() {
		return gjj;
	}
	public void setGjj(int gjj) {
		this.gjj = gjj;
	}
	public int getKangwon() {
		return kangwon;
	}
	public void setKangwon(int kangwon) {
		this.kangwon = kangwon;
	}
	public int getDjcc() {
		return djcc;
	}
	public void setDjcc(int djcc) {
		this.djcc = djcc;
	}
	public int getDaegu() {
		return daegu;
	}
	public void setDaegu(int daegu) {
		this.daegu = daegu;
	}
	public int getKyeongsang() {
		return kyeongsang;
	}
	public void setKyeongsang(int kyeongsang) {
		this.kyeongsang = kyeongsang;
	}
	public int getKyeongi() {
		return kyeongi;
	}
	public void setKyeongi(int kyeongi) {
		this.kyeongi = kyeongi;
	}
	
	
}
