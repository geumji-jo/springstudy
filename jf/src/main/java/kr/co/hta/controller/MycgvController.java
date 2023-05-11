package kr.co.hta.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;

import kr.co.hta.movies.dao.MemberDao;
import kr.co.hta.movies.dao.MovieDao;
import kr.co.hta.movies.dao.MyTheaterDao;
import kr.co.hta.movies.dao.QnaDao;
import kr.co.hta.movies.dao.QuestionDao;
import kr.co.hta.movies.dao.TheaterDao;
import kr.co.hta.movies.dao.WatchedMovieDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.MyTheater;
import kr.co.hta.vo.Pagination;
import kr.co.hta.vo.Question;
import kr.co.hta.vo.Reservation;
import kr.co.hta.vo.Theater;
import kr.co.hta.vo.WishList;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class MycgvController {
	
	MemberDao memberDao = new MemberDao();
	MovieDao movieDao = new MovieDao();
	MyTheaterDao myTheaterDao = new MyTheaterDao();
	TheaterDao theaterDao = new TheaterDao();
	private QnaDao qnaDao = new QnaDao();
	QuestionDao questionDao = new QuestionDao();
	
	@RequestMapping("/member/mycgvpage.jf")
	public ModelAndView MyCgvwishList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/mycgv.jsp");
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
		
		// 문의정보 갯수
		Map<String, Object> questionMap = new HashMap<String, Object>();
		questionMap.put("memberId", memberId);
		int QuestionCount = qnaDao.questionTotalCount(questionMap);
		mav.addAttribute("QuestionCount", QuestionCount);
		mav.addAttribute("wishLists", wishLists);
		mav.addAttribute("wishListsCount", wishListsCount);
		mav.addAttribute("movies", movies);
		//
		
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
		
		List<Question> questions = qnaDao.questionListByRange(map);
		
		
		int records = qnaDao.questionTotalCount(map);
		
		
		int no = (int)Math.ceil((double)records/10);
		
		Pagination pagination = new Pagination(pno, 10, records);
		
		mav.addAttribute("no", no);
		mav.addAttribute("questions", questions);
		mav.addAttribute("pagination", pagination);
		//추가끝
		
		
		
		
		// 예매내역
		WatchedMovieDao watchedDao = new WatchedMovieDao();
		int reservationCount = watchedDao.CountReservationList(memberId);
		List<Reservation> reservationList = watchedDao.getAllReservationList(memberId);
		
		mav.addAttribute("reservationCount", reservationCount);
		mav.addAttribute("reservationList", reservationList);
		
		return mav;
	}
	
	@RequestMapping("/member/showTheater.jf")
	public ModelAndView showTheaters(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());

		String city = req.getParameter("city");
		List<Theater> theaters = myTheaterDao.getTheatersByCity(city);
		
		
		mav.addAttribute("theaters", theaters);
		return mav;
	}
	
	@RequestMapping("/member/addMyTheater.jf")
	public ModelAndView addMyTheater(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());

		int tno  = Integer.parseInt(req.getParameter("theater"));
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		
		String memberId = member.getId();

		MyTheater myTheater = new MyTheater();
		
		myTheater.setTheaterNo(tno);
		myTheater.setMemberId(memberId);

		myTheaterDao.addMyTheater(myTheater);
		// ---------^^^^자주찾는극장 추가^^^------------
		
		
		// 자주가는 극장 
		List<MyTheater> MyTheaters = myTheaterDao.selectMyTheatersById(memberId);
		mav.addAttribute("MyTheaters", MyTheaters);
		

		return mav;
	}
	
	@RequestMapping("/member/removeMyTheater.jf")
	public ModelAndView remove(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setView(new JSONView());

		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		String memberId = member.getId();
		

		// 자주가는 극장 제거
		int mytheaterNo = Integer.parseInt(req.getParameter("mytheaterNo"));
		myTheaterDao.modifyMytheaterByNo(mytheaterNo);

		
		// 자주가는 극장 
		List<MyTheater> MyTheaters = myTheaterDao.selectMyTheatersById(memberId);
		mav.addAttribute("MyTheaters", MyTheaters);
		
		return mav;
	}
	@RequestMapping("/member/changeInfo.jf")
	public ModelAndView changeInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/changeMyInfo.jsp");
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
		//추가끝
		mav.setViewName("semi/member/changeMyInfo.jsp");
		return mav;
	}
	@RequestMapping("/member/process_changeInfo.jf")
	public ModelAndView processChangeInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String pwd = req.getParameter("userpwd");
		String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(pwd);
		if(!member.getPwd().equals(digestPwd)) {
			mav.setViewName("redirect:changeInfo.jf?result=fail");
			return mav;
		}
		
		mav.setViewName("redirect:changeInfoForm.jf");
		return mav;
	}
	@RequestMapping("/member/changeInfoForm.jf")
	public ModelAndView changeInfoForm(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/mycgv.jsp");
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
		
		//추가끝
		mav.setViewName("semi/member/changeMyInfoForm.jsp");
		return mav;
	}
	@RequestMapping("/member/process_success_changeInfo.jf")
	public ModelAndView processSuccessChangeInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		
		// 사용자가 입력한 정보 얻어오기
		String pwd = req.getParameter("userpwd");
		if(pwd != "") {
			String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(pwd);
			member.setPwd(digestPwd);
		}
		String nickName = req.getParameter("usernickName");
		String phone = req.getParameter("userphone");
		String email = req.getParameter("useremail");
		String hint = req.getParameter("userhint");
		member.setNickName(nickName);
		member.setPhone(phone);
		member.setEmail(email);
		member.setHint(hint);
		
		memberDao.updateMemberById(member);
		// 끝
		mav.setViewName("redirect:changeInfoSuccess.jf");
		return mav;
	}
	@RequestMapping("/member/changeInfoSuccess.jf")
	public ModelAndView changeInfoSuccess(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/changeInfoSuccess.jsp");
		return mav;
	}
}
