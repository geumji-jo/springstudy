package kr.co.hta.movies.dao;


import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.hta.util.IbatisUtils;
import kr.co.hta.vo.Event;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.WishList;

public class MemberDao {
	
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<Member> getAllMembers() throws Exception{
		return sqlMap.queryForList("getAllMembers");
	}
	public Member getMemberById(String id) throws Exception{
		return (Member) sqlMap.queryForObject("getMemberById",id);
	}
	public void insertMember(Member member) throws Exception{
		sqlMap.insert("insertMember",member);
	}
	public void updateMemberById(Member member) throws Exception{
		sqlMap.update("updateMemberById",member);
	}
	
	@SuppressWarnings("unchecked")
	public List<WishList> getWishListById(String id) throws Exception{
		return (List<WishList>) sqlMap.queryForList("getWishListById",id);
	}
	public void insertWishList(WishList wishList) throws Exception{
		sqlMap.insert("insertWishListById",wishList);
	}
	public WishList getWishListByIdandMovieNo(Map<String, Object> map) throws Exception{
		return (WishList) sqlMap.queryForObject("getWishListByIdandMovieNo",map);
	}
	public void updateWishList(WishList wishList) throws Exception{
		sqlMap.update("updateWishList",wishList);
	}
	public int getCountWishListById(String memberId) throws Exception{
		return (Integer) sqlMap.queryForObject("getCountWishListById",memberId);
	}
	public String getIdByInfoes(Map<String, Object> map) throws Exception{
		return (String) sqlMap.queryForObject("getIdByInfoes",map);
	}
	public String getMnoMemberIdByReview(Map<String, Object> map) throws Exception{
		return (String) sqlMap.queryForObject("getMnoMemberIdByReview",map);
	}
	@SuppressWarnings("unchecked")
	public List<Integer> getReservationNumsById(String memberId) throws Exception{
		return (List<Integer>)sqlMap.queryForList("getReservationNumsById",memberId);
	}
}