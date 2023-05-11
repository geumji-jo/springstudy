package kr.co.hta.movies.dao;


import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Event;

public class EventDao {
	
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	public void insertEvent(Event event) throws Exception {
		sqlMap.insert("insertEvent", event);
	}
	@SuppressWarnings("unchecked")
	public List<Event> selectEventByRange(Criteria criteria) throws Exception {
		return (List<Event>)sqlMap.queryForList("selectEventByRange", criteria);
	}
	public Integer selectCountEvent() throws Exception {
		return (Integer)sqlMap.queryForObject("selectCountEvent");
	}
	
	// made by 해훈
	
	@SuppressWarnings("unchecked")
	public List<Event> selectEventRange3() throws Exception {
		return (List<Event>) sqlMap.queryForList("selectEventRange3");
	}
	
	@SuppressWarnings("unchecked")
	public List<Event> selectAllEventByIng(String cat) throws Exception {
		return (List<Event>) sqlMap.queryForList("selectAllEventByIng", cat);
	}
	
	public Event selectEventByNo(int eventNo) throws Exception{
		return (Event) sqlMap.queryForObject("selectEventByNo", eventNo);
	}
}
