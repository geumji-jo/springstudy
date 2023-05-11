package kr.co.hta.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FivePoint {
	private int production;
	private int ost;
	private int story;
	private int actor;
	private int beauty;
	
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
	
	
}
