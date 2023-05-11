package kr.co.hta.movies.dao;


import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Notice;

public class NoticeDao {
	
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	public void insertNotice(Notice notice) throws Exception {
		sqlMap.insert("insertNotice", notice);
	}
	
	public void viewUpdate(int no) throws Exception {
		sqlMap.update("viewUpdate", no);
	}
	
	public void deleteByNo(String no) throws Exception {
		sqlMap.delete("deleteByNo", no);
	}

	public void updateByNo(Notice notice) throws Exception {
		sqlMap.update("updateByNo", notice);
	}

	@SuppressWarnings("unchecked")
	public List<Notice> selectAllNotice() throws Exception {
		return (List<Notice>)sqlMap.queryForList("selectAllNotice");
	}
	
	public Notice selectNoticeByNo(int no) throws Exception {
		return (Notice) sqlMap.queryForObject("selectNoticeByNo", no);
	}
	
	public int selectNoticeByCriteriaCount(Criteria criteria) throws Exception {
		return (Integer) sqlMap.queryForObject("selectNoticeByCriteriaCount", criteria);
	}
	
	@SuppressWarnings("unchecked")
	public List<Notice> selectNoticeByCriteria(Criteria criteria) throws Exception {
		return (List<Notice>) sqlMap.queryForList("selectNoticeByCriteria", criteria);
	}
	
	@SuppressWarnings("unchecked")
	public List<Notice> selectSearchNotices(Map<String, Object> map) throws Exception {
		return (List<Notice>)sqlMap.queryForList("selectSearchNotices", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Notice> selectSearchNoticesByContent(Map<String, Object> map) throws Exception {
		return (List<Notice>)sqlMap.queryForList("selectSearchNoticesByContent", map);
	}
	public Integer selectSearchNoticesContentCount(String keyword) throws Exception {
		return (Integer)sqlMap.queryForObject("selectSearchNoticesContentCount", keyword);
	}
	public Integer selectSearchNoticesCount(String keyword) throws Exception {
		return (Integer)sqlMap.queryForObject("selectSearchNoticesCount", keyword);
	}

	public Integer allCount() throws Exception {
		return (Integer)sqlMap.queryForObject("allCount");
	}
	
	@SuppressWarnings("unchecked")
	public List<Notice> selectNoticeByRange(Map<String, Integer> map) throws Exception {
		return (List<Notice>)sqlMap.queryForList("selectNoticeByRange", map);
	}
	@SuppressWarnings("unchecked")
	public List<Notice> selectNotice2ByRecent() throws Exception{
		return sqlMap.queryForList("selectNotice2ByRecent");
	}
	
}
