package kr.co.hta.movies.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.MyTheater;
import kr.co.hta.vo.Theater;

public class MyTheaterDao {
	
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	@SuppressWarnings("unchecked")
	public List<MyTheater> selectMyTheatersById(String memberId) throws Exception{
		return (List<MyTheater>) sqlMap.queryForList("selectMyTheatersById", memberId);
	}
	
	public void addMyTheater(MyTheater myTheater) throws Exception {
		sqlMap.insert("addMyTheater", myTheater);
	}
	
	@SuppressWarnings("unchecked")
	public List<Theater> getTheatersByCity(String city) throws Exception {
		return (List<Theater>) sqlMap.queryForList("getTheatersByCity", city);
	}
	
	public String getTheaterByNo(int theaterNo) throws Exception {
		return (String) sqlMap.queryForObject("getTheaterByNo", theaterNo);
	}
	
	public int modifyMytheaterByNo(int mytheaterNo) throws Exception{
		return sqlMap.update("modifyMytheaterByNo", mytheaterNo);
	}
}
