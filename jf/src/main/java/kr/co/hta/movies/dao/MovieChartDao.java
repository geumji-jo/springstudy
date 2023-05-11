package kr.co.hta.movies.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Movie;

public class MovieChartDao {
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	public Movie getRank1MovieBySort(Map<String, Integer> map) throws Exception{
		return (Movie) sqlMap.queryForObject("getRank1MovieBySort", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> getMoviesChartBySort(Map<String, Integer> map)throws Exception{
		return (List<Movie>) sqlMap.queryForList("getMoviesChartBySort", map);
	}
	
}