package kr.co.hta.movies.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Finder;
import kr.co.hta.vo.Movie;

public class FinderDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<Movie> getAllresult(Finder finder) throws Exception{
		return (List<Movie>) sqlMap.queryForList("getAllresult", finder);
	}
	
	public int countResult(Finder finder) throws Exception {
		return (int) sqlMap.queryForObject("countResult", finder);
	}
	
	public Movie getMovieByRecent() throws Exception{
		return (Movie) sqlMap.queryForObject("getMovieByRecent");
	}
}
