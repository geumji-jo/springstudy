package kr.co.hta.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.hta.movies.dao.MemberDao;
import kr.co.hta.movies.dao.MovieDao;
import kr.co.hta.movies.dao.MoviediaryDAO;
import kr.co.hta.movies.dao.MyTheaterDao;
import kr.co.hta.movies.dao.QnaDao;
import kr.co.hta.movies.dao.ReviewDao;
import kr.co.hta.movies.dao.TheaterDao;
import kr.co.hta.movies.dao.WatchedMovieDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.MyTheater;
import kr.co.hta.vo.MyWishList;
import kr.co.hta.vo.Pagination;
import kr.co.hta.vo.Review;
import kr.co.hta.vo.WishList;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class MemberController {
	
	MemberDao memberDao = new MemberDao();
	MovieDao movieDao = new MovieDao();
	ReviewDao reviewDao = new ReviewDao();
	TheaterDao theaterDao = new TheaterDao();
	MyTheaterDao myTheaterDao = new MyTheaterDao();
	QnaDao qnaDao = new QnaDao();
	
	public Member getMemberBySession(HttpServletRequest req,HttpServletResponse res) throws Exception{
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		return member;
		
	}

	@RequestMapping("/member/process_checkId.jf")
	public ModelAndView checkId(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		String memberId = req.getParameter("memberId");
		Member member = memberDao.getMemberById(memberId);
		String isEmpty = "N";
		if(member == null) {
			isEmpty = "Y";
		}
		mav.addAttribute("isEmpty", isEmpty);
		mav.setView(new JSONView());
		return mav;
	}
	@RequestMapping("/member/login.jf")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/login.jsp");
		return mav;
	}
	
	@RequestMapping("/member/process_login.jf")
	public ModelAndView processLogin(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = req.getParameter("userid");
		String pwd = req.getParameter("userpwd");
		Member member = memberDao.getMemberById(id);
		String from = req.getParameter("from");
		String sno = req.getParameter("sno");
		
		Movie rank1movie = movieDao.getRank1MovieByGPA();
		
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"),rank1movie.getNo());
		int thumbno = CommonUtils.stringToNumber(req.getParameter("thumbno"), 1);
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=fail");
			return mav;
		}
		String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(pwd);
		if(!member.getPwd().equals(digestPwd)) {
			mav.setViewName("redirect:login.jf?result=fail&from="+from+"&thumbno="+thumbno+"&mno="+mno);
			return mav;
		}
		
		HttpSession session = req.getSession(); 		// HttpSession 객체 얻기
		session.setAttribute("LOGINMEMBER", member);
		if(from !=null) {
			if("myMovieGpa".equals(from)) {
				mav.setViewName("redirect:mymoviegpa.jf");
				return mav;
			}
			if("gpa".equals(from)) {
				mav.setViewName("redirect:/jf/movie/gpa.jf?thumbno="+thumbno+"&mno="+mno);
				return mav;
			}
			if("detail".equals(from)) {
				mav.setViewName("redirect:/jf/movie/moviedetail.jf?mno="+mno);
				return mav;
			}
			if("chart".equals(from)) {
				mav.setViewName("redirect:/jf/movie/"+from+".jf");
				return mav;
			}

			if("res".equals(from)) {
				mav.setViewName("redirect:/jf/reservation/reservation.jf?sno=" + sno);
				return mav;
			}
//			else{
//				mav.setViewName("redirect:/jf/"+from);
//				return mav;
//			}
		}
		mav.setViewName("redirect:/jf/main.jf");
		return mav;
	}
	@RequestMapping("/member/withdrawal.jf")
	public ModelAndView withDrawal(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/withdrawal.jsp");
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		List<WishList> wishLists= memberDao.getWishListById(memberId);
		List<Movie> movies = new ArrayList<Movie>();
		
		for(WishList wishList : wishLists) {
			Movie movie = new Movie();
			int movieNo = wishList.getMovieNo();
			movie = movieDao.getMovieByNo(movieNo);
			movies.add(movie);
		}
		
		// 자주가는 극장
		List<MyTheater> MyTheaters = (List<MyTheater>) myTheaterDao.selectMyTheatersById(memberId);
		mav.addAttribute("MyTheaters", MyTheaters);
		
		
		// 도시명
		List<String> cities = theaterDao.getAllCities();
		mav.addAttribute("cities", cities);
		
		
		//추가시작
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		
		String opt = req.getParameter("opt");
		String keyword = req.getParameter("keyword");
		
		Criteria c = new Criteria();
		
		if (keyword != null && !keyword.isEmpty()) {
			c.setOption(opt);
			c.setKeyword(keyword);
		}
		
		c.setBegin((pno-1)*10+1);
		c.setEnd(pno*10);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", c);
		map.put("memberId",memberId );
		
		int records = qnaDao.questionTotalCount(map);
		
		
		int no = (int)Math.ceil((double)records/10);
		
		Pagination pagination = new Pagination(pno, 10, records);
		
		mav.addAttribute("no", no);
		mav.addAttribute("pagination", pagination);
		return mav;
	}
	@RequestMapping("/member/process_withDrawal.jf")
	public ModelAndView processWithDrawal(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		Member member = getMemberBySession(req, res);
		String pwd = req.getParameter("userpwd");
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=fail");
			return mav;
		}
		String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(pwd);
		if(!member.getPwd().equals(digestPwd)) {
			mav.setViewName("redirect:withdrawal.jf?result=fail");
			return mav;
		}
		member.setUsedYn("N");
		memberDao.updateMemberById(member);
		HttpSession session = req.getSession();
		session.invalidate();
		mav.setViewName("redirect:/jf/member/withDrawalSuccess.jf");
		return mav;
	}
	@RequestMapping("/member/withDrawalSuccess.jf")
	public ModelAndView withDrawalSuccess(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/withDrawalSuccess.jsp");
		return mav;
	}
	@RequestMapping("/member/process_logout.jf")
	public ModelAndView processLogout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		session.invalidate();
		mav.setViewName("redirect:/jf/main.jf");
		return mav;
	}
	
	@RequestMapping("/member/register.jf")
	public ModelAndView register(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/register.jsp");
		
		return mav;
	}
	
	@RequestMapping("/member/complete.jf")
	public ModelAndView complete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/complete.jsp");
		return mav;
	}
	@RequestMapping("/member/process_register.jf")
	public ModelAndView processRegister(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		String saveDirectory = "C:\\projects\\web_workspace\\jf\\WebContent\\photos\\memberPhotos";
		MultipartRequest mr = new MultipartRequest(req, saveDirectory,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());
		
		String id = mr.getParameter("userid");
		String pwd = mr.getParameter("userpwd");
		String name = mr.getParameter("username");
		String nickName = mr.getParameter("usernickName");
		String phone = mr.getParameter("userphone");
		String email = mr.getParameter("useremail");
		String birth = mr.getParameter("userbirth");
		String gender = mr.getParameter("usergender");
		String hint = mr.getParameter("userhint");
		String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(pwd);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthDate = sdf.parse(birth);
		
		Member member = null;
		member = memberDao.getMemberById(id);
		
		if(member == null) {
			try {
				member = new Member();
				member.setId(id);
				member.setPwd(digestPwd);
				member.setName(name);
				member.setNickName(nickName);
				member.setPhone(phone);
				member.setEmail(email);
				member.setBirth(birthDate);
				member.setGender(gender);
				member.setHint(hint);
				member.setUsedYn("Y");
				memberDao.insertMember(member);
				
				mav.setViewName("redirect:complete.jf");
				
			} catch (Exception e) {
				mav.setViewName("redirect:register.jf?result=none");
			}
			return mav;
		} else {
			
			mav.setViewName("redirect:register.jf?result=fail");
		}
		return mav;
	}
	@RequestMapping("/member/wishlist.jf")
	public ModelAndView wishList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/wishList.jsp");
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		List<WishList> wishLists= memberDao.getWishListById(memberId);
		List<Movie> movies = new ArrayList<Movie>();
		int wishListsCount = memberDao.getCountWishListById(memberId);
		
		for(WishList wishList : wishLists) {
			Movie movie = new Movie();
			int movieNo = wishList.getMovieNo();
			movie = movieDao.getMovieByNo(movieNo);
			movies.add(movie);
		}
		
		MoviediaryDAO movieDiaryDAO = new MoviediaryDAO();
		WatchedMovieDao watchedDao = new WatchedMovieDao();
		int watchedCount = watchedDao.countAllWatched(memberId);
		int diaryCount = movieDiaryDAO.selectDiaryCountById(memberId);
		
		mav.addAttribute("diaryCount", diaryCount);
		mav.addAttribute("watchedCount", watchedCount);
		mav.addAttribute("wishLists", wishLists);
		mav.addAttribute("wishListsCount", wishListsCount);
		mav.addAttribute("movies", movies);
		
		return mav;
	}
	@RequestMapping("/member/process_addWishList.jf")
	public ModelAndView addWishList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Movie rank1Movie = movieDao.getRank1MovieByGPA();
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), rank1Movie.getNo());
		
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		Map<String, Object> wishListMap = new HashMap<String, Object>();
		wishListMap.put("memberId", member.getId());
		wishListMap.put("mno",mno);
		WishList wishList = memberDao.getWishListByIdandMovieNo(wishListMap);
		
		if(wishList == null) {
			WishList newWishList = new WishList();
			newWishList.setMemberId(memberId);
			newWishList.setMovieNo(mno);
			newWishList.setYn("Y");
			memberDao.insertWishList(newWishList);
			Movie movie = movieDao.getMovieByNo(mno);
			movie.setWishList(movie.getWishList()+1);
			movieDao.updateMovieByNo(movie);
			mav.setViewName("redirect:wishlist.jf");
			return mav;
		} else {
			wishList.setYn("N");
			memberDao.updateWishList(wishList);
			Movie movie = movieDao.getMovieByNo(mno);
			movie.setWishList(movie.getWishList()-1);
			movieDao.updateMovieByNo(movie);
			mav.setViewName("redirect:/jf/movie/gpa.jf");
			return mav;
		}
	}
	
	@RequestMapping("/member/process_addNewWishList.jf")
	public ModelAndView addNewWishList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Movie rank1Movie = movieDao.getRank1MovieByGPA();
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), rank1Movie.getNo());
		
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		
		String memberId = member.getId();
		WishList newWishList = new WishList();
		newWishList.setMemberId(memberId);
		newWishList.setMovieNo(mno);
		newWishList.setYn("Y");
		memberDao.insertWishList(newWishList);
		Movie movie = movieDao.getMovieByNo(mno);
		movie.setWishList(movie.getWishList()+1);
		movieDao.updateMovieByNo(movie);
		mav.setViewName("redirect:wishlist.jf");
		
		return mav;
	}
	
	@RequestMapping("/member/ajax_process_addNewWishList.jf")
	public ModelAndView ajax_process_addNewWishList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Movie rank1Movie = movieDao.getRank1MovieByGPA();
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), rank1Movie.getNo());
		
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		
		String memberId = member.getId();
		WishList newWishList = new WishList();
		newWishList.setMemberId(memberId);
		newWishList.setMovieNo(mno);
		newWishList.setYn("Y");
		memberDao.insertWishList(newWishList);
		Movie movie = movieDao.getMovieByNo(mno);
		movie.setWishList(movie.getWishList()+1);
		movieDao.updateMovieByNo(movie);
		
		
		mav.setView(new JSONView());
		return mav;
	}
	@RequestMapping("/member/process_removeWishList.jf")
	public ModelAndView removeWishList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), 0);
		
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		Map<String, Object> wishListMap = new HashMap<String, Object>();
		
		wishListMap.put("memberId", memberId);
		wishListMap.put("mno",mno);
		WishList wishList = memberDao.getWishListByIdandMovieNo(wishListMap);
		wishList.setYn("N");
		Movie movie = movieDao.getMovieByNo(mno);
		movie.setWishList(movie.getWishList()-1);
		movieDao.updateMovieByNo(movie);
		memberDao.updateWishList(wishList);
		
		
		mav.setViewName("redirect:wishlist.jf");
		return mav;
	}
	
	@RequestMapping("/member/process_removeWishListinGPA.jf")
	public ModelAndView removeWishListinGPA(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), 0);
		int thumbno = CommonUtils.stringToNumber(req.getParameter("thumbno"), 1);
		String from = req.getParameter("from");
		if(from !=null) {
			if("myMovieGpa".equals(from)) {
				mav.setViewName("redirect:mymoviegpa.jf");
				return mav;
			}
			if("gpa".equals(from)) {
				mav.setViewName("redirect:/jf/movie/gpa.jf?thumbno="+thumbno+"&mno="+mno);
				return mav;
			}
			if("detail".equals(from)) {
				mav.setViewName("redirect:/jf/movie/moviedetail.jf?mno="+mno);
				return mav;
			}
			if("chart".equals(from)) {
				mav.setViewName("redirect:/jf/movie/"+from+".jf?");
				return mav;
			}
		}
		mav.addAttribute("thumbno", thumbno);
		
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		Map<String, Object> wishListMap = new HashMap<String, Object>();
		
		wishListMap.put("memberId", memberId);
		wishListMap.put("mno",mno);
		WishList wishList = memberDao.getWishListByIdandMovieNo(wishListMap);
		wishList.setYn("N");
		Movie movie = movieDao.getMovieByNo(mno);
		movie.setWishList(movie.getWishList()-1);
		movieDao.updateMovieByNo(movie);
		memberDao.updateWishList(wishList);
		
		mav.setViewName("redirect:/jf/movie/gpa.jf");
		return mav;
	}
	@RequestMapping("/member/ajax_process_removeWishListinGPA.jf")
	public ModelAndView ajaxRemoveWishListinGPA(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), 0);
		
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		Map<String, Object> wishListMap = new HashMap<String, Object>();
		
		wishListMap.put("memberId", memberId);
		wishListMap.put("mno",mno);
		WishList wishList = memberDao.getWishListByIdandMovieNo(wishListMap);
		wishList.setYn("N");
		Movie movie = movieDao.getMovieByNo(mno);
		movie.setWishList(movie.getWishList()-1);
		movieDao.updateMovieByNo(movie);
		memberDao.updateWishList(wishList);
		
		mav.setView(new JSONView());
		return mav;
	}
	@RequestMapping("/member/process_removeWishListinChart.jf")
	public ModelAndView removeWishListinGPAinChart(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), 0);
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		Map<String, Object> wishListMap = new HashMap<String, Object>();
		
		wishListMap.put("memberId", memberId);
		wishListMap.put("mno",mno);
		WishList wishList = memberDao.getWishListByIdandMovieNo(wishListMap);
		wishList.setYn("N");
		Movie movie = movieDao.getMovieByNo(mno);
		movie.setWishList(movie.getWishList()-1);
		movieDao.updateMovieByNo(movie);
		memberDao.updateWishList(wishList);
		
		mav.setViewName("redirect:/jf/movie/chart.jf");
		return mav;
	}
	@RequestMapping("/member/mymoviegpa.jf")
	public ModelAndView myMovieGpa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		Member member = getMemberBySession(req, res);
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		List<Review> reviews = reviewDao.getReviewsById(memberId);
		List<MyWishList> myWishLists = new ArrayList<MyWishList>();
			
		for(Review review : reviews) {
			int mno = review.getMovieNo();
			Movie movie = movieDao.getMovieByNo(mno);
			
			MyWishList myWishList = new MyWishList();
			myWishList.setMemberId(memberId);
			myWishList.setReviewNo(review.getNo());
			myWishList.setMovieNo(mno);
			myWishList.setName(movie.getKorTitle());
			myWishList.setPoster(movie.getPoster());
			myWishList.setReviewCreateDate(review.getCreateDate());
			myWishList.setReviewContents(review.getRcomment());
			myWishList.setReviewLikes(review.getLikes());
			myWishLists.add(myWishList);
		}
		
		int toggleNo = CommonUtils.stringToNumber("toggleNo", 2);
		mav.addAttribute("toggleNo", toggleNo);
		mav.addAttribute("myWishLists", myWishLists);
		mav.setViewName("semi/member/mymoviegpa.jsp");
		return mav;
	}
	@RequestMapping("/member/searchid.jf")
	public ModelAndView searchId(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/searchid.jsp");
		return mav;
	}
	
	@RequestMapping("/member/searchid_result.jf")
	public ModelAndView processSearchId(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String userName = req.getParameter("username");
		String userBirth = req.getParameter("userbirth");
		String userPhone = req.getParameter("userphone");
		
		if(("").equals(userName) || ("").equals(userBirth) || ("").equals(userPhone)  ) {
			mav.setViewName("redirect:searchid.jf?result=infoEmpty");
			return mav;
		}
		
		Map<String, Object> userMap = new HashMap<String, Object>();
		userMap.put("userName", userName);
		userMap.put("userBirth", userBirth);
		userMap.put("userPhone", userPhone);
		String userId = memberDao.getIdByInfoes(userMap);
		if(userId == null) {
			mav.setViewName("redirect:searchid.jf?result=idEmpty");
			return mav;
		}
		
		mav.addAttribute("userId", userId);
		mav.setViewName("semi/member/searchidResult.jsp");
		return mav;
	}
	@RequestMapping("/member/searchpwd.jf")
	public ModelAndView searchPwd(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/searchpwd.jsp");
		
		return mav;
	}
	@RequestMapping("/member/searchpwd_result.jf")
	public ModelAndView searchPwdResult(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		String userId = req.getParameter("userid");
		String userPhone = req.getParameter("userphone");
		String userHint = req.getParameter("userhint");
		
		Member member = memberDao.getMemberById(userId);
		if(member == null) {
			mav.setViewName("redirect:searchpwd.jf?result=noId");
			return mav;
		}
		if(member.getPhone().equals(userPhone) && member.getHint().equals(userHint)) {
			mav.setViewName("semi/member/searchpwdResult.jsp");
			mav.addAttribute("userId", userId);
			return mav;
		} else {
			mav.setViewName("redirect:searchpwd.jf?result=noId");
			return mav;
		}
	}
	@RequestMapping("/member/process_changepwd_result.jf")
	public ModelAndView changePwd(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		
		Member member = memberDao.getMemberById(userId);
		if(member == null) {
			mav.setViewName("redirect:searchpwd.jf?result=noSession");
			return mav;
		}
		String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(userPwd);
		member.setPwd(digestPwd);
		mav.setViewName("redirect:searchpwd.jf?result=noSession");
		memberDao.updateMemberById(member);
		
		mav.setViewName("redirect:changePwdComplete.jf");
		return mav;
	}
	@RequestMapping("/member/changePwdComplete.jf")
	public ModelAndView pwdComplete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/changePwdComplete.jsp");
		return mav;
	}
	@RequestMapping("/member/checkReservation.jf")
	public ModelAndView checkReservation(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		Member member = getMemberBySession(req, res);
		String memberId = member.getId();
		List<Integer> resNums = memberDao.getReservationNumsById(memberId);
		
		mav.setView(new JSONView());
		return mav;
	}
	
}
