package kr.co.hta.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.hta.movies.dao.EventDao;
import kr.co.hta.movies.dao.FinderDao;
import kr.co.hta.vo.Event;
import kr.co.hta.vo.Movie;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class MainController {
	@RequestMapping("/main.jf")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		
		FinderDao finderDao = new FinderDao();
		
		Movie recentMovie = finderDao.getMovieByRecent();
		mav.addAttribute("recentMovie", recentMovie);
		
		EventDao eventDao = new EventDao();
		String cat = "";
		
		List<Event> events = eventDao.selectAllEventByIng(cat);
		mav.addAttribute("events", events);
		return mav;
	}

}
