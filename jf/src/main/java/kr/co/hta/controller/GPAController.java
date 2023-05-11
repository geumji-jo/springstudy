package kr.co.hta.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hta.movies.dao.MemberDao;
import kr.co.hta.movies.dao.MovieDao;
import kr.co.hta.movies.dao.ReviewDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.FivePoint;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.Review;
import kr.co.hta.vo.WishList;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class GPAController {
	
	private MovieDao movieDao = new MovieDao();
	private ReviewDao reviewDao = new ReviewDao();
	private MemberDao memberDao = new MemberDao();
	
	public Member getMemberBySession(HttpServletRequest req,HttpServletResponse res) throws Exception{
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		return member;
		
	}
	@RequestMapping("/movie/ajaxReviews.jf")
	public ModelAndView reviews(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		Movie rank1movie = movieDao.getRank1MovieByGPA();
		
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), rank1movie.getNo());
		int rno = CommonUtils.stringToNumber(req.getParameter("rno"), 1);
		int ono = CommonUtils.stringToNumber(req.getParameter("ono"), 1);
		
		int begin = (rno-1)*8 +1;
		int end = rno*8;
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end",end);
		map.put("movieNo", mno);
		map.put("ono",ono);
		
		List<Review> reviews = reviewDao.getReviewsByRangeAndMovie(map);
		for(Review review : reviews) {
			review.setRcomment(review.getRcomment().replace("\r\n", "<br>"));
			String memberId = review.getMemberId();
			Member member = memberDao.getMemberById(memberId);
			review.setMemberId(member.getNickName());
		}
		mav.addAttribute("reviews", reviews);
		mav.setView(new JSONView());
		return mav;
	}
	
	@RequestMapping("/movie/gpa.jf")
	public ModelAndView a(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/gpa/gpa.jsp");
		
		Movie rank1movie = movieDao.getRank1MovieByGPA();
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), rank1movie.getNo());
		int rno = CommonUtils.stringToNumber(req.getParameter("rno"), 1);
		int ono = CommonUtils.stringToNumber(req.getParameter("ono"), 1);
		int thumbno = CommonUtils.stringToNumber(req.getParameter("thumbno"), 1);
		
		Movie movie = movieDao.getMovieByNo(mno);
		
		if(movie == null) {
			movie = movieDao.getMovieByNo(rank1movie.getNo());
		}
		
	//	캐러셀 영화 4개씩 얻어오기  시작
		int value = 10; // 캐러샐 겟수
		int value2 = 4; // 캐러샐에 들어갈 영화갯수
		
		List<List<Movie>> lists = new ArrayList<List<Movie>>();
		for(int i=1; i<=value; i++) {
			Map<String, Object> RangeMap4 = new HashMap<String, Object>();
			int movieBegin = (i*value2)-(value2-1);
			int movieEnd = i*value2;
			RangeMap4.put("begin", movieBegin);
			RangeMap4.put("end", movieEnd);
			List<Movie> movies = movieDao.selectMoviesRangeRankByGpa(RangeMap4);
			lists.add(movies);
		}
		for(int i=0; i<lists.size(); i++) {
			List<Movie> FourMovies = lists.get(i);
			mav.addAttribute("movies"+i, FourMovies);
		}
		mav.addAttribute("movieLists", lists);
		mav.addAttribute("caroselLength", lists.size());
	//	캐러셀 영화 4개씩 얻어오기  끝		
	// 리뷰 얻어오기 시작
		int reviewsCountByMovie = reviewDao.getReviewsCountByMovie(mno);
		int begin = (rno-1)*8 +1;
		int end = rno*8;
		int totalreviewsCount = (int)Math.ceil((double)reviewsCountByMovie/8);
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end",end);
		map.put("movieNo", mno);
		map.put("ono",ono);
		List<Review> reviews = reviewDao.getReviewsByRangeAndMovie(map);
	//	리뷰 얻어오기 끝
	// Review 하트 빨간색 기능 시작
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		String heart = "";
		mav.addAttribute("heart", heart);
		
		if(member !=null) {
			List<WishList> wishLists = memberDao.getWishListById(member.getId());
			mav.addAttribute("wishLists", wishLists);
		}
	// Review 하트 기능 끝
	// 그래프 표시 기능 시작
		FivePoint fivePoint = reviewDao.getFivePointByMovieNo(mno);
	// 그래프 표시 기능 끝
	// 일반평점, 내가 쓴 평점 빨간색 표시 시작
		int toggleNo = CommonUtils.stringToNumber("toggleNo", 1);
		mav.addAttribute("toggleNo", toggleNo);
	// 평점 빨간색 끝
	// 내가 본 영화 평점 작성 시작
		String isWatched = "N";
		if(member != null) {
			String memberId = member.getId();
			List<Integer> resNums = memberDao.getReservationNumsById(memberId);
			for(int resnum : resNums) {
				if(mno == resnum) {
					isWatched="Y";
					break;
				}
			}
		}
	// 끝
	// 리뷰 한번만 작성 시작
		String isWrote = "N";
		if(member !=null) {
			String memberId = member.getId();
			Map<String, Object> mmMap = new HashMap<String, Object>();
			mmMap.put("memberId", memberId);
			mmMap.put("mno", mno);
			String isWrite = memberDao.getMnoMemberIdByReview(mmMap);
			if(isWrite != null) {
				isWrote = "Y";
			}
		}
	//
		mav.addAttribute("isWrote", isWrote);
		mav.addAttribute("isWatched", isWatched);
		mav.addAttribute("m", movie);
		mav.addAttribute("thumbno", thumbno);
		mav.addAttribute("reviews", reviews);
		mav.addAttribute("currentMovie", movie);
		mav.addAttribute("totalreviewsCount", totalreviewsCount);
		mav.addAttribute("reviewsCountByMovie", reviewsCountByMovie);
		mav.addAttribute("rank1movie", rank1movie.getNo());
		mav.addAttribute("fivePoint", fivePoint);
		return mav;
	}
	
	@RequestMapping("/movie/ajax_gpa.jf")
	public ModelAndView ajaxGpa(HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		Movie rank1movie = movieDao.getRank1MovieByGPA();
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), rank1movie.getNo());
		int rno = CommonUtils.stringToNumber(req.getParameter("rno"), 1);
		int ono = CommonUtils.stringToNumber(req.getParameter("ono"), 1);
		
		Movie movie = movieDao.getMovieByNo(mno);
		
		if(movie == null) {
			movie = movieDao.getMovieByNo(rank1movie.getNo());
		}
		
		
		int reviewsCountByMovie = reviewDao.getReviewsCountByMovie(mno);
		List<Movie> movies = movieDao.setlect4MoviesRankByGpa();
		List<Movie> movies2 = movieDao.setlect8MoviesRankByGpa();
		List<Movie> movies3 = movieDao.setlect12MoviesRankByGpa();
		
		// 리뷰 얻어오기 시작
		int begin = (rno-1)*8 +1;
		int end = rno*8;
		int totalreviewsCount = (int)Math.ceil((double)reviewsCountByMovie/8);
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end",end);
		map.put("movieNo", mno);
		map.put("ono",ono);
		List<Review> reviews = reviewDao.getReviewsByRangeAndMovie(map);
		//	리뷰 얻어오기 끝
		// Review 하트 빨간색 기능 시작
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		String heart = "";
		mav.addAttribute("heart", heart);
		
		if(member !=null) {
			List<WishList> wishLists = memberDao.getWishListById(member.getId());
			mav.addAttribute("wishLists", wishLists);
		}
		// Review 하트 기능 끝
		// 그래프 표시 기능 시작
		FivePoint fivePoint = reviewDao.getFivePointByMovieNo(mno);
		// 그래프 표시 기능 끝
		// 일반평점, 내가 쓴 평점 빨간색 표시 시작
		int toggleNo = CommonUtils.stringToNumber("toggleNo", 1);
		mav.addAttribute("toggleNo", toggleNo);
		// 평점 빨간색 끝
		mav.addAttribute("reviews", reviews);
		mav.addAttribute("movies", movies);
		mav.addAttribute("movies2", movies2);
		mav.addAttribute("movies3", movies3);
		mav.addAttribute("currentMovie", movie);
		mav.addAttribute("totalreviewsCount", totalreviewsCount);
		mav.addAttribute("reviewsCountByMovie", reviewsCountByMovie);
		mav.addAttribute("rank1movie", rank1movie.getNo());
		mav.addAttribute("fivePoint", fivePoint);
		mav.addAttribute("ajaxMovieNo", mno);
		return mav;
	}
	
	@RequestMapping("/movie/addreview.jf")
	public ModelAndView addReview(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		Movie rank1movie = movieDao.getRank1MovieByGPA();
		int mno = CommonUtils.stringToNumber(req.getParameter("mno"), rank1movie.getNo());
		int rno = CommonUtils.stringToNumber(req.getParameter("rno"), 1);
		int thumbno = CommonUtils.stringToNumber(req.getParameter("thumbno"), 1);
		String from = req.getParameter("from");
		
		Movie movie = movieDao.getMovieByNo(mno);
		
		if(movie == null) {
			movie = movieDao.getMovieByNo(rank1movie.getNo());
		}
		
		int production = CommonUtils.stringToNumber(req.getParameter("production"), 0);
		int story = CommonUtils.stringToNumber(req.getParameter("story"), 0);
		int beauty = CommonUtils.stringToNumber(req.getParameter("beauty"), 0);
		int actor = CommonUtils.stringToNumber(req.getParameter("actor"), 0);
		int ost = CommonUtils.stringToNumber(req.getParameter("ost"), 0);
		

		Review review = new Review();
		String rcomment = req.getParameter("review_contents");
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if(member == null) {
			mav.setViewName("redirect:/jf/member/login.jf?result=please");
			return mav;
		}
		// 좋아요 인지? --> movieGpa,reviewGpa 추가
		int isLike = CommonUtils.stringToNumber(req.getParameter("like"), 1);
		if(isLike ==1) {
			review.setGpa(1);
			movie.setGpa(movie.getGpa()+1);
			movieDao.updateMovieByNo(movie);
		} else {
			review.setGpa(0);
		}
		// 좋아요 추가 끝
		
		String memberId = member.getId();
		
		review.setMovieNo(mno);
		review.setBeauty(beauty);
		review.setActor(actor);
		review.setMemberId(memberId);
		review.setProduction(production);
		review.setOst(ost);
		review.setStory(story);
		review.setRcomment(rcomment);
		reviewDao.insertReview(review);

		// 리뷰 갯수 카운트
		int reviewsCountByMovie =  reviewDao.getReviewsCountByMovie(mno);
		if(reviewsCountByMovie == 0) {
			reviewsCountByMovie = 1;
		}
		// 골든에그스코어 = 영화 Gpa 가져와서 
		double goldenEggScore = ((double)movie.getGpa() / (double)reviewsCountByMovie)*100;
		int newGoldenEggScore = (int)Math.round(goldenEggScore);
		
		movie.setGoldenEgg(newGoldenEggScore);
		movieDao.updateMovieByNo(movie);
		if(from!=null) {
			if("gpa".equals(from)) {
				mav.setViewName("redirect:gpa.jf?mno="+mno+"&rno="+rno+"&thumbno="+thumbno);
				return mav;
			} else if("detail".equals(from)){
				mav.setViewName("redirect:moviedetail.jf?mno="+mno+"&rno="+rno);
				return mav;
			}
		}
		return mav;
	}
	@RequestMapping("/movie/updateReview.jf")
	public ModelAndView updateLikes(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		Movie rank1movie = movieDao.getRank1MovieByGPA();
		int mno = 0;
		int rno = 0;
		try {
			mno = Integer.parseInt(req.getParameter("mno"));
		} catch (Exception e) {
			mno = rank1movie.getNo();
		}
		try {
			rno = Integer.parseInt(req.getParameter("rno"));
		} catch (Exception e) {
			rno = 1;
		}
		String from = req.getParameter("from");
		
		if(member == null) {
			mav.setViewName("redirect:/jf/member/login.jf?result=likefail");
			return mav;
		}
		int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));
		Review review = reviewDao.getReviewByNo(reviewNo);
		review.setLikes(review.getLikes()+1);
		reviewDao.updateReview(review);
		
		if(from!=null) {
			if("gpa".equals(from)) {
				mav.setViewName("redirect:gpa.jf?mno="+mno+"&rno="+rno);
				return mav;
			} else if("detail".equals(from)){
				mav.setViewName("redirect:moviedetail.jf?mno="+mno+"&rno="+rno);
				return mav;
			}
		}
		
		return mav;
	}
	@RequestMapping("/member/process_removeReview.jf")
	public ModelAndView removeReview(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		int rno = CommonUtils.stringToNumber(req.getParameter("rno"), 0);
		String from = req.getParameter("from");
		int thumbno = CommonUtils.stringToNumber(req.getParameter("thumbno"), 1);
		Review review = reviewDao.getReviewByNo(rno);
		int mno = review.getMovieNo();
		Movie movie = movieDao.getMovieByNo(mno);
		if(review.getGpa() == 1) {
			movie.setGpa(movie.getGpa()-1);
		}
		movieDao.updateMovieByNo(movie);
		
		reviewDao.deleteReviewByNo(rno);
		// 리뷰 갯수 카운트
			int reviewsCountByMovie =  reviewDao.getReviewsCountByMovie(mno);
			if(reviewsCountByMovie == 0) {
				reviewsCountByMovie = 1;
			}
			// 골든에그스코어 = 영화 Gpa 가져와서
			double goldenEggScore = ((double)(movie.getGpa()) / (double)reviewsCountByMovie)*100;
			int newGoldenEggScore = (int)Math.round(goldenEggScore);
			
			System.out.println("reviewsCountByMovie: " + reviewsCountByMovie);
			System.out.println("gpa: " + movie.getGpa());
			System.out.println("goldenEggScore: " + goldenEggScore);
			System.out.println("newGoldenEggScore: " + newGoldenEggScore);
			
			movie.setGoldenEgg(newGoldenEggScore);
			movieDao.updateMovieByNo(movie);
			if(from !=null) {
				if("gpa".equals(from)) {
					mav.setViewName("redirect:/jf/movie/gpa.jf?mno="+mno+"&thumbno="+thumbno+"&rno="+rno);
					return mav;
				}
				if("detail".equals(from)) {
					mav.setViewName("redirect:/jf/movie/moviedetail.jf?mno="+mno+"&rno="+rno);
					return mav;
				}
				
			}
		mav.setViewName("redirect:mymoviegpa.jf");
		return mav;
	}
	@RequestMapping("/member/isMyReview.jf")
	public ModelAndView isMyReview(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		Member member = getMemberBySession(req, res);
		String isMyReview = "N";
		int rno = CommonUtils.stringToNumber(req.getParameter("rno"), 0);
		
		if(member == null) {
			mav.setViewName("redirect:/jf/member/login.jf?result=default");
			return mav;
		}
		
		if(member.getId().equals(reviewDao.getMemberIdByReviewNo(rno))){
			isMyReview = "Y";
		}
		mav.addAttribute("isMyReview", isMyReview);
		mav.setView(new JSONView());
		return mav;
	}
}
