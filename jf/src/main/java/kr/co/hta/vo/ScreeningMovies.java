package kr.co.hta.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScreeningMovies {
	private String movieNames;
	private ArrayList<ScreeningInfo> infosByMovieName;
	
	public String getMovieNames() {
		return movieNames;
	}
	public void setMovieNames(String movieNames) {
		this.movieNames = movieNames;
	}
	public ArrayList<ScreeningInfo> getInfosByMovieName() {
		return infosByMovieName;
	}
	public void setInfosByMovieName(ArrayList<ScreeningInfo> infosByMovieName) {
		this.infosByMovieName = infosByMovieName;
	}
	
	
	
}
