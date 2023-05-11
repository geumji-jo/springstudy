package kr.co.hta.movies.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Reservation;

public class WatchedMovieDao {
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	@SuppressWarnings("unchecked")
	public List<Reservation> getAllWatchedMovieById(String memberId) throws Exception{
		return (List<Reservation>) sqlMap.queryForList("getAllWatchedMovieById", memberId);
	}
	
	public Integer countAllWatched(String memberId) throws Exception{
		return (Integer) sqlMap.queryForObject("countAllWatched", memberId);
	}
	
	@SuppressWarnings("unchecked")
	public List<Reservation> getAllReservationList(String memberId) throws Exception{
		return (List<Reservation>) sqlMap.queryForList("getAllReservationList", memberId);
	}
	
	public Integer CountReservationList(String memberId) throws Exception{
		return (Integer) sqlMap.queryForObject("CountReservationList", memberId);
	}
}
