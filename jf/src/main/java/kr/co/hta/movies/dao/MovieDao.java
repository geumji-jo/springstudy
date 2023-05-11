package kr.co.hta.movies.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Movie;

public class MovieDao {
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<Movie> getAllMovies() throws Exception{
		return (List<Movie>) sqlMap.queryForList("selectAllMovies");
	}
	@SuppressWarnings("unchecked")
	public List<Movie> setlect4MoviesRankByGpa() throws Exception{
		return (List<Movie>) sqlMap.queryForList("setlect4MoviesRankByGpa");
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> setlect8MoviesRankByGpa() throws Exception{
		return (List<Movie>) sqlMap.queryForList("setlect8MoviesRankByGpa");
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> setlect12MoviesRankByGpa() throws Exception{
		return (List<Movie>) sqlMap.queryForList("setlect12MoviesRankByGpa");
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> selectMoviesRangeRankByGpa(Map<String, Object> map) throws Exception{
		return (List<Movie>) sqlMap.queryForList("selectMoviesRangeRankByGpa",map);
	}
	public Movie getMovieByNo(int mno) throws Exception{
		return (Movie) sqlMap.queryForObject("getMovieByNo", mno);
	}
	public Movie getRank1MovieByGPA() throws Exception{
		return (Movie) sqlMap.queryForObject("getRank1MovieByGPA");
	}
	public void updateGPAByReview(Map<String,Object> map) throws Exception{
		sqlMap.update("updateGPAByReview",map);
	}
	public void updateMovieByNo(Movie movie) throws Exception{
		sqlMap.update("updateMovieByNo",movie);
	}
	
}
