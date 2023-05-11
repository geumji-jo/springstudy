package kr.co.hta.movies.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.Screening;
import kr.co.hta.vo.ScreeningDetail;
import kr.co.hta.vo.ScreeningRoom;
import kr.co.hta.vo.Theater;

public class ScreeningDao {
	SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	public Movie selectMovieNameByNo(int no) throws Exception {
		return (Movie) sqlMap.queryForObject("selectMovieNameByNo", no);
	}
	public int countScreening() throws Exception {
		return (Integer) sqlMap.queryForObject("countScreening");
	}
	public int selectScreeningSearchCount(Criteria criteria) throws Exception {
		return (Integer) sqlMap.queryForObject("selectScreeningSearchCount", criteria);
	}
	@SuppressWarnings("unchecked")
	public List<Theater> selectTheater() throws Exception {
		return (List<Theater>) sqlMap.queryForList("selectTheater");
	}
	@SuppressWarnings("unchecked")
	public List<ScreeningRoom> selectRoomByTheater(int theaterNo) throws Exception {
		return (List<ScreeningRoom>) sqlMap.queryForList("selectRoomByTheater", theaterNo);
	}
	@SuppressWarnings("unchecked")
	public List<ScreeningDetail> selectScreening(Criteria criteria ) throws Exception {
		return (List<ScreeningDetail>) sqlMap.queryForList("selectScreening", criteria );
	}
	public void insertScreening(Screening sc) throws Exception {
		sqlMap.insert("insertScreening", sc);
	}
	public void deleteScreening(int mno) throws Exception {
		sqlMap.delete("deleteScreening", mno);
	}
	
}