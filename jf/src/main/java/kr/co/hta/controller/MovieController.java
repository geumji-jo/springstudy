package kr.co.hta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hta.movies.dao.FinderDao;
import kr.co.hta.movies.dao.MemberDao;
import kr.co.hta.movies.dao.MovieChartDao;
import kr.co.hta.vo.Finder;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.WishList;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class MovieController {

	MovieChartDao chartDao = new MovieChartDao();
	FinderDao finderDao = new FinderDao();
	MemberDao memberDao = new MemberDao();
	
	@RequestMapping("/movie/chart.jf")
	public ModelAndView chart(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/movie/chart.jsp");
		//하트 표시 시작
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		String heart = "";
		mav.addAttribute("heart", heart);
		
		if(member !=null) {
			List<WishList> wishLists = memberDao.getWishListById(member.getId());
			mav.addAttribute("wishLists", wishLists);
		}
		// 하트 끝
		
		// sort=0주고, 정렬기준값(sort)를 넘기기
		int sort = 0;
		try {		// null일 경우 sort=1 (예매율순)으로
			sort = Integer.parseInt(req.getParameter("sort"));			
		} catch(Exception e) {
			sort = 1;
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("sort", sort);
		
		// 정렬 1위 , 나머지 뽑는 무비차트
		Movie rank1movie = chartDao.getRank1MovieBySort(map);
		mav.addAttribute("rank1", rank1movie);
		
		List<Movie> movies = chartDao.getMoviesChartBySort(map);
		mav.addAttribute("movies", movies);
		
		return mav;
	}
	
	@RequestMapping("/movie/result.jf")
	public ModelAndView result(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/movie/finder.jsp");

		String[] genre = req.getParameterValues("genre");
		String[] country = req.getParameterValues("country");
		String[] age = req.getParameterValues("grade");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String keyword = req.getParameter("keyword");
		
		Finder finder = new Finder();
				
		if (age != null) {
			StringJoiner joiner = new StringJoiner(",");
			for (String a : age) {
				joiner.add("'" + a + "'");
			}
			finder.setAge("(" + joiner.toString() + ")");
			System.out.println(finder.getAge());
		}
		
		if (country != null) {
			StringJoiner joiner = new StringJoiner(",");
			for (String c : country) {
				joiner.add("'" + c + "'");
			}
			finder.setCountry("(" + joiner.toString() + ")");
			System.out.println(finder.getCountry());
		}
		
		
		if (genre != null) {
			StringJoiner joiner = new StringJoiner(",");
			for (String g : genre) {
				joiner.add("'" + g + "'");
			}
			finder.setGenre("(" + joiner.toString() + ")");
			System.out.println(finder.getGenre());
		}
		
		finder.setKeyword(keyword);
		
		if (!endDate.isEmpty()) {
			finder.setEndDate(endDate);			
		}
		if (!startDate.isEmpty()) {
			finder.setStartDate(startDate);			
		}
		
		List<Movie> finderMovies = finderDao.getAllresult(finder);
		int count = finderDao.countResult(finder);
		
		mav.addAttribute("finder", finder);
		mav.addAttribute("finderMovies", finderMovies);
		mav.addAttribute("count", count);
		
		return mav;
	}
	
	@RequestMapping("/movie/finder.jf")
	public ModelAndView finder(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/movie/finder.jsp");
		//하트 표시 시작
				HttpSession session = req.getSession();
				Member member = (Member) session.getAttribute("LOGINMEMBER");
				String heart = "";
				mav.addAttribute("heart", heart);
				
				if(member !=null) {
					List<WishList> wishLists = memberDao.getWishListById(member.getId());
					mav.addAttribute("wishLists", wishLists);
				}
				// 하트 끝
		
		// sort=0주고, 정렬기준값(sort)를 넘기기
				int sort = 0;
				try {		// null일 경우 sort=1 (예매율순)으로
					sort = Integer.parseInt(req.getParameter("sort"));			
				} catch(Exception e) {
					sort = 1;
				}
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("sort", sort);
				
				// 정렬 1위 , 나머지 뽑는 무비차트
				Movie rank1movie = chartDao.getRank1MovieBySort(map);
				mav.addAttribute("rank1", rank1movie);
				
				List<Movie> movies = chartDao.getMoviesChartBySort(map);
				mav.addAttribute("movies", movies);

		return mav;
	}
}
