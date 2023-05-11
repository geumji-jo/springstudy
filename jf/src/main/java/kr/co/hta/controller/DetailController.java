package kr.co.hta.controller;

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
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class DetailController {
	
	private MovieDao movieDao = new MovieDao();
	private ReviewDao reviewDao = new ReviewDao();
	private MemberDao memberDao = new MemberDao();
	
	@RequestMapping("/movie/moviedetail.jf")
	public ModelAndView movieDetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/moviedetail/detail.jsp");
		int mno = 0;
		int rno = 0;
		int ono = CommonUtils.stringToNumber(req.getParameter("ono"), 1);
		try {
			mno = Integer.parseInt(req.getParameter("mno"));
		} catch (Exception e) {
			mno = 1;
		}
		try {
			rno = Integer.parseInt(req.getParameter("rno"));
		} catch (Exception e) {
			rno = 1;
		}
		
		Movie movie = movieDao.getMovieByNo(mno);
		List<Movie> movies = movieDao.setlect4MoviesRankByGpa();
		int begin = (rno-1)*8 +1;
		int end = rno*8;
		int reviewsCountByMovie = reviewDao.getReviewsCountByMovie(mno);
		int totalreviewsCount = (int)Math.ceil((double)reviewsCountByMovie/8);
		String[] steelcuts = movie.getSteelCut().split(",");
		// 내가 본 영화 평점 작성 시작
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
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
		FivePoint fivePoint = reviewDao.getFivePointByMovieNo(mno);
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end",end);
		map.put("movieNo", mno);
		map.put("ono",ono);
		List<Review> reviews = reviewDao.getReviewsByRangeAndMovie(map);
		
		mav.addAttribute("isWrote", isWrote);
		mav.addAttribute("isWatched", isWatched);
		mav.addAttribute("steelcuts", steelcuts);
		mav.addAttribute("fivePoint", fivePoint);
		mav.addAttribute("reviews", reviews);
		mav.addAttribute("movies", movies);
		mav.addAttribute("movie", movie);
		mav.addAttribute("currentMovie", movie);
		mav.addAttribute("totalreviewsCount", totalreviewsCount);
		mav.addAttribute("reviewsCountByMovie", reviewsCountByMovie);
		return mav;
	}
	
}
