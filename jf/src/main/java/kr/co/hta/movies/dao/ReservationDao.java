package kr.co.hta.movies.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.CityCount;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.Reservation;
import kr.co.hta.vo.Ticketing;

public class ReservationDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	// 은정이
	@SuppressWarnings("unchecked")
	public List<Movie> getAllMoviesRankByResRate() throws Exception {
		return (List<Movie>) sqlMap.queryForList("getAllMoviesRankByResRate");
	}
	
	public Movie getRank1MovieByResRate() throws Exception {
		return (Movie) sqlMap.queryForObject("getRank1MovieByResRate");
	}
	
	@SuppressWarnings("unchecked")
	public List<Ticketing> getTicketingsByMovieNo(int movieNo) throws Exception {
		return (List<Ticketing>) sqlMap.queryForList("getTicketingsByMovieNo", movieNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<CityCount> getCountCitiesByMovieNo(int movieNo) throws Exception {
		return (List<CityCount>) sqlMap.queryForList("getCountCitiesByMovieNo", movieNo);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getTheaterNameByMnoCity(Map<String, Object> map) throws Exception {
		return (List<String>) sqlMap.queryForList("getTheaterNameByMnoCity", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getDatesByMnoTname(Map<String, Object> map) throws Exception {
		return (List<String>) sqlMap.queryForList("getDatesByMnoTname", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Ticketing> getScreeningsByMDT(Map<String, Object> map) throws Exception {
		return (List<Ticketing>) sqlMap.queryForList("getScreeningsByMDT", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getReservationCount() throws Exception {
		return sqlMap.queryForList("getReservationCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> getAllMoviesRankBySort(Map<String, Integer> map) throws Exception {
		return (List<Movie>) sqlMap.queryForList("getAllMoviesRankBySort", map);
	}
	
	public void insertReservation(Reservation reservation) throws Exception {
		sqlMap.insert("insertReservation", reservation);
	}
	
	public Movie getRank1MovieByOrderBy(Map<String, Integer> map) throws Exception {
		return (Movie) sqlMap.queryForObject("getRank1MovieByOrderBy", map);
	}
	
	public Integer getMovieNoBySno(int sno) throws Exception {
		return (Integer) sqlMap.queryForObject("getMovieNoBySno", sno);
	}
	
	public Integer getSumRealMembers() throws Exception {
		return (Integer) sqlMap.queryForObject("getSumRealMembers");
	}
	
	public Integer getRealMembersByMno(int mno) throws Exception {
		return (Integer) sqlMap.queryForObject("getRealMembersByMno", mno);
	}
	
	public void updateMoviesByMno(Map<String, Object> map) throws Exception {
		sqlMap.update("updateMoviesByMno", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getDatesBySort(Map<String, Object> map) throws Exception {
		return (List<String>) sqlMap.queryForList("getDatesBySort", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Ticketing> getScreeningsByMD(Map<String, Object> map) throws Exception {
		return (List<Ticketing>) sqlMap.queryForList("getScreeningsByMD", map);
	}
	
	public Movie getMovieInfosByMno(int mno) throws Exception {
		return (Movie) sqlMap.queryForObject("getMovieInfosByMno", mno);
	}
	
	@SuppressWarnings("unchecked")
	public List<Ticketing> getTicketingsByTname(Map<String, Object> map) throws Exception {
		return (List<Ticketing>) sqlMap.queryForList("getTicketingsByTname", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Integer>> getAllAgeLimit() throws Exception {
		return (List<Map<String, Integer>>) sqlMap.queryForList("getAllAgeLimit");
	}
	
	@SuppressWarnings("unchecked")
	public List<Movie> getAllMovieInfos() throws Exception {
		return (List<Movie>) sqlMap.queryForList("getAllMovieInfos");
	}
	
	@SuppressWarnings("unchecked")
	public List<String>	getTheatersByCityName(String city) throws Exception {
		return (List<String>) sqlMap.queryForList("getTheatersByCityName", city);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getDatesByMC(Map<String, Object> map) throws Exception {
		return (List<String>) sqlMap.queryForList("getDatesByMC", map);
	}
	
	public Ticketing getTicketingBySno(int sno) throws Exception {
		return (Ticketing) sqlMap.queryForObject("getTicketingBySno", sno);
	}
	
	@SuppressWarnings("unchecked")
	public List<Ticketing> getScreeningsByDT(Map<String, Object> map) throws Exception {
		return (List<Ticketing>) sqlMap.queryForList("getScreeningsByDT", map);
	}
	
}
