package kr.co.hta.movies.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.DiaryMovieDetail;
import kr.co.hta.vo.Moviediary;

public class MoviediaryDAO {
	SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<DiaryMovieDetail> selectDiaryMovieDetailById(String id) throws Exception {
		return (List<DiaryMovieDetail>) sqlMap.queryForList("selectDiaryMovieDetailById", id);
	}
	@SuppressWarnings("unchecked")
	public List<Moviediary> selectByDiary(String id) throws Exception {
		return (List<Moviediary>) sqlMap.queryForList("selectByDiary", id);
	}
	
	public int selectDiaryCountById(String id) throws Exception {
		return (Integer) sqlMap.queryForObject("selectDiaryCountById",id);
	}
	
	public DiaryMovieDetail selectDiaryMovieDetailByNo(int no) throws Exception {
		return (DiaryMovieDetail) sqlMap.queryForObject("selectDiaryMovieDetailByNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Moviediary> selectByDiary() throws Exception {
		return (List<Moviediary>) sqlMap.queryForList("selectByDiary");
	}
	
	public void insertDiary(Moviediary diary) throws Exception {
		sqlMap.insert("insertDiary", diary);
	}
}