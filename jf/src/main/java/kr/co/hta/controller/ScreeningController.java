package kr.co.hta.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.hta.movies.dao.AdminMovieDao;
import kr.co.hta.movies.dao.MovieDao;
import kr.co.hta.movies.dao.ScreeningDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.Notice;
import kr.co.hta.vo.Pagination;
import kr.co.hta.vo.Screening;
import kr.co.hta.vo.ScreeningDetail;
import kr.co.hta.vo.ScreeningRoom;
import kr.co.hta.vo.Theater;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;


@Controller
public class ScreeningController {
	ScreeningDao dao = new ScreeningDao();
	SimpleDateFormat format = new SimpleDateFormat();
	AdminMovieDao adminMovieDao = new AdminMovieDao();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	MovieDao movieDao = new MovieDao();
	
	
	@RequestMapping("/admin/screening.jf")
	public ModelAndView Screening1(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/screening.jsp");
		
		int no = Integer.parseInt(req.getParameter("mno"));
		
		Movie movie = dao.selectMovieNameByNo(no);
		
		List<Theater> theaters = dao.selectTheater();
		
		
		mav.addAttribute("movie", movie);
		mav.addAttribute("theaters", theaters);
		
		return mav;
	}
	@RequestMapping("/admin/screening1.jf")
	public ModelAndView screening1(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(req.getParameter("tno"));
		
			
		List<ScreeningRoom> rooms = dao.selectRoomByTheater(no);
		mav.addAttribute("rooms", rooms);
		
		mav.setView(new JSONView());
		return mav;
	}
	
	@RequestMapping("/admin/screeninginsert.jf")
	public ModelAndView insert(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int screeningroom = Integer.parseInt(req.getParameter("screeningroom"));
		int movieNo =Integer.parseInt(req.getParameter("movieNo"));
		Date screeningDate = sdf.parse(req.getParameter("screeningDate"));
		String time = req.getParameter("time");
		
		Screening sc = new Screening();
		sc.setRoomNo(screeningroom);
		sc.setMovieNo(movieNo);
		sc.setScreeningDate(screeningDate);
		sc.setTime(time);
		
		dao.insertScreening(sc);
		
		mav.setViewName("redirect:screeningmovielistresult.jf?pno=1");
		
		return mav;
	}
	
	@RequestMapping("/admin/deletescreening.jf")
	public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:screeningmovielistresult.jf?pno=1");
		

		String[] boxes = req.getParameterValues("box");
		
		for(String box : boxes) {
			dao.deleteScreening(Integer.parseInt(box));
		}
		
		
		return mav;
	}
	
	@RequestMapping("/admin/screeningmovielist.jf")
	public ModelAndView movielist(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/screeningmovielist.jsp");
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		

		int pno = 1;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
		} catch (NumberFormatException e) {}
		
		String opt = req.getParameter("opt");
		String keyword = req.getParameter("keyword");
		
		Criteria c = new Criteria();
		
		if (keyword != null && !keyword.isEmpty()) {			
			c.setOption(opt);
			c.setKeyword(keyword);
			
		}
		c.setBegin((pno-1)*8+1);
		c.setEnd(pno*8);
		c.setBeginIndex((pno - 1)*size + 1);
		c.setEndIndex(pno*size);
		List<Movie> movies = adminMovieDao.adminMovieListByRange(c);
		
		int records = adminMovieDao.movieTotalCount(c);
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("movies", movies);
		mav.addAttribute("pagination", pagination);
		mav.addAttribute("records", records);
		
		return mav;
	}
	@RequestMapping("/admin/screeningmovielistresult.jf")
	public ModelAndView movielistResult(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/screeningmovielistresult.jsp");
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		String opt = req.getParameter("opt");
		String keyword = req.getParameter("keyword");
		
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno*size);
		criteria.setBegin((pno-1)*8+1);
		criteria.setEnd(pno*8);
		
		if (keyword != null && !keyword.isEmpty()) {			
			criteria.setOption(opt);
			criteria.setKeyword(keyword);
			
		}
		
		
		// 글 갯수 조회
		int records = dao.selectScreeningSearchCount(criteria);
		// 페이지번호에 해당하는 글 목록조회
		List<ScreeningDetail> details = dao.selectScreening(criteria);
		// 페이지 내비게이션 처리에 필요한 Pagination 객체 생성
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("pagination", pagination);
		mav.addAttribute("details", details);
		mav.addAttribute("records", records);
		
		return mav;
	
	}
}
