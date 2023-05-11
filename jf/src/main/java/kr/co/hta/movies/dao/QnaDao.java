package kr.co.hta.movies.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Question;

public class QnaDao {
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	
	
	//문의검색
	@SuppressWarnings("unchecked")
	public List<Question> searchQuestions(Criteria criteria) throws Exception{
		return(List<Question>) sqlMap.queryForList("searchQuestions", criteria);
	}
	
	//1대1문의등록
	public void insertQuestion(Question question) throws Exception {
		sqlMap.insert("insertQuestion", question);
	}
	
	//1대1문의삭제
	public void deleteQuestions(int no) throws Exception {
		sqlMap.delete("deleteQuestions", no);
	}
	
	//페이지당10개씩
	@SuppressWarnings("unchecked")
	public List<Question> questionListByRange (Map<String, Object> map) throws Exception{
		return sqlMap.queryForList("questionListByRange", map);
	}
	// 총 갯수 
	public int questionTotalCount(Map<String, Object> map ) throws Exception{
		return (Integer) sqlMap.queryForObject("questionTotalCount", map);
	}
	
}
