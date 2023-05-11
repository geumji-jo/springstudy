package kr.co.hta.movies.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Question;

public class QuestionDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<Question> selectAllQuestion() throws Exception{
		return (List<Question>)sqlMap.queryForList("selectAllQuestion");
	}

	public Question selectQuestionByNo(int no) throws Exception{
		return (Question)sqlMap.queryForObject("selectQuestionByNo", no);
	}

	public void updateQuestion(Question question) throws Exception{
		sqlMap.update("updateQuestion", question);
	}
	

	
}
