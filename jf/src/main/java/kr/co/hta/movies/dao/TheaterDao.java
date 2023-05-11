package kr.co.hta.movies.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.CityAndTheater;
import kr.co.hta.vo.Room;
import kr.co.hta.vo.RoomDetailInfo;
import kr.co.hta.vo.ScreeningInfo;
import kr.co.hta.vo.Theater;

public class TheaterDao {
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<Theater> getAllTheaters() throws Exception{
		return sqlMap.queryForList("getAllTheaters");
	}
	public Theater getTheaterByNo(int tno) throws Exception{
		return (Theater)sqlMap.queryForObject("getTheaterByNo",tno);
	}
	@SuppressWarnings("unchecked")
	public List<CityAndTheater> getAllCitiesAndTheater() throws Exception{
		return (List<CityAndTheater>) sqlMap.queryForList("getAllCitiesAndTheater");
	}
	@SuppressWarnings("unchecked")
	public List<String> getAllCities() throws Exception{
		return sqlMap.queryForList("getAllCities");
	}
	@SuppressWarnings("unchecked")
	public List<Theater> getTheaterByCity(String city) throws Exception{
		return sqlMap.queryForList("getTheaterByCity",city);
	}
	
	public int getSeatsByTheaterNo(int tno) throws Exception{
		return (Integer) sqlMap.queryForObject("getSeatsByTheaterNo",tno);
	}
	public int getRoomsByTheaterNo(int tno) throws Exception{
		return (Integer) sqlMap.queryForObject("getRoomsByTheaterNo",tno);
	}
	
	@SuppressWarnings("unchecked")
	public List<String> get7DaysByTheaterNo (Map<String, Object> map) throws Exception{
		return (List<String>) sqlMap.queryForList("get7DaysByTheaterNo",map);
	}
	@SuppressWarnings("unchecked")
	public List<RoomDetailInfo> getScreeningRoomDetail(Map<String,Object> map) throws Exception{
		return (List<RoomDetailInfo>) sqlMap.queryForList("getScreeningRoomDetail",map);
	}
	@SuppressWarnings("unchecked")
	public List<ScreeningInfo> getScreeningByTheaterAndDate(Map<String, Object> map) throws Exception{
		return (List<ScreeningInfo>) sqlMap.queryForList("getScreeningByTheaterAndDate",map);
	}
	@SuppressWarnings("unchecked")
	public List<Room> getRoomsByMovie(Map<String,Object> map) throws Exception{
		return sqlMap.queryForList("getRoomsByMovie",map);
	}
}
