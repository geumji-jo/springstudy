package kr.co.hta.movies.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.FivePoint;
import kr.co.hta.vo.Review;

public class ReviewDao {
	
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<Review> getReviews8(int mno) throws Exception{
		return (List<Review>) sqlMap.queryForList("selectReviews8",mno);
	}
	public int getReviewsCountByMovie(int mno) throws Exception{
		return (Integer) sqlMap.queryForObject("getReviewsCountByMovie",mno);
	}
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsByRangeAndMovie(Map<String, Integer> map) throws Exception{
		return (List<Review>) sqlMap.queryForList("getReviewsByRangeAndMovie",map);
	}
	public int getGPAByMovie(int mno) throws Exception{
		return (Integer) sqlMap.queryForObject("getGPAByMovie",mno);
	}
	public void insertReview(Review review) throws Exception{
		sqlMap.insert("insertReview",review);
	}
	public void updateReview(Review review) throws Exception{
		sqlMap.update("updateReview", review);
	}
	public Review getReviewByNo(int reviewNo) throws Exception{
		return (Review) sqlMap.queryForObject("getReviewByNo",reviewNo);
	}
	public FivePoint getFivePointByMovieNo(int mno) throws Exception{
		return (FivePoint) sqlMap.queryForObject("getFivePointByMovieNo",mno);
	}
	@SuppressWarnings("unchecked")
	public List<Review> getReviewsById(String memberId) throws Exception{
		return sqlMap.queryForList("getReviewsById",memberId);
	}
	public void deleteReviewByNo(int rno) throws Exception{
		sqlMap.delete("deleteReviewByNo",rno);
	}
	public String getMemberIdByReviewNo(int rno) throws Exception{
		return (String) sqlMap.queryForObject("getMemberIdByReviewNo",rno);
	}
}
