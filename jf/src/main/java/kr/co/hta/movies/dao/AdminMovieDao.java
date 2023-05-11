package kr.co.hta.movies.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Criteria;

import kr.co.hta.vo.Movie;

public class AdminMovieDao {
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	//영화검색
	@SuppressWarnings("unchecked")
	public List<Movie> searchMovies(Criteria criteria) throws Exception{
		return(List<Movie>) sqlMap.queryForList("searchMovies", criteria);
	}
	
	//영화등록
	public void insertMovie(Movie movie) throws Exception {
		sqlMap.insert("insertMovie", movie);
	}
	
	//영화번호 받아오기
	public Movie selectMovieByNo(int no) throws Exception{
		return(Movie)sqlMap.queryForObject("selectMovieByNo", no);
	}
	
	//영화수정
	public void updateMovieByNo (int mno) throws Exception{
		sqlMap.update("updateMovieByNo", mno);
	}
	
	//상영종료
	public void closeMovie(int mno) throws Exception{
		sqlMap.update("closeMovie", mno);
	}
	
	// 영화정보
	public int adminMovieDetil(Movie movie) throws Exception{
		return (Integer) sqlMap.queryForObject("adminMovieDetil", movie);
	}
	
	// 페이지당8개씩
	@SuppressWarnings("unchecked")
	public List<Movie> adminMovieListByRange(Criteria criteria) throws Exception{
		return sqlMap.queryForList("adminMovieListByRange", criteria);
	}
	
	// 총 갯수
	public int movieTotalCount(Criteria criteria) throws Exception{
		return (Integer) sqlMap.queryForObject("movieTotalCount", criteria);
	}
}
