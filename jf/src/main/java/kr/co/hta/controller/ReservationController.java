package kr.co.hta.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hta.movies.dao.MovieDao;
import kr.co.hta.movies.dao.MyTheaterDao;
import kr.co.hta.movies.dao.ReservationDao;
import kr.co.hta.movies.dao.TheaterDao;
import kr.co.hta.vo.CityCount;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.MyTheater;
import kr.co.hta.vo.Reservation;
import kr.co.hta.vo.Theater;
import kr.co.hta.vo.Ticketing;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class ReservationController {
	
	MovieDao movieDao = new MovieDao();
	TheaterDao theaterDao = new TheaterDao();
	ReservationDao resDao = new ReservationDao();
	
	@RequestMapping("/reservation/selectedres.jf")
	public ModelAndView selectedres(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		int mno = Integer.parseInt(req.getParameter("mno"));
		
		Movie movie = resDao.getMovieInfosByMno(mno);
		
		mav.addAttribute("movie", movie);

		return mav;
	}

	@RequestMapping("/reservation/alreadyres.jf")
	public ModelAndView alreadyres(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		int sno = 0;
		try {
			sno = Integer.parseInt(req.getParameter("sno"));
		} catch(Exception e) {
			mav.setViewName("semi/reservation/reservation.jsp");
			return mav;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		Ticketing ticket = resDao.getTicketingBySno(sno);

		int mno = ticket.getMovieNo();
		Date sdate = ticket.getScreeningDate();
		String tname = ticket.getTheaterName();
		
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("MM-dd-E");
		String formatDate = format1.format(date);
		String formatSDate = format1.format(sdate);
		
		map.put("movieNo", mno);
		map.put("screeningDate", formatSDate);
		map.put("theaterName", tname);
		map.put("date", formatDate);
		
		// System.out.println(map);
		
		List<Map<String, Object>> counts = resDao.getReservationCount();
		List<Ticketing> screenings = resDao.getScreeningsByMDT(map);
		
		mav.addAttribute("ticket", ticket);
		mav.addAttribute("counts", counts);
		mav.addAttribute("screenings", screenings);

		return mav;
	}
	
	
	@RequestMapping("/reservation/reservation.jf")
	public ModelAndView reservation(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int sort = 0;
		try {
			sort = Integer.parseInt(req.getParameter("sort"));
		} catch(Exception e) {
			sort = 1;
		}
		
		int mno = 0;
		try {
			mno = Integer.parseInt(req.getParameter("mno"));
		} catch(Exception e) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("sort", sort);
			Movie movie = resDao.getRank1MovieByOrderBy(map);
			mno = movie.getNo();
		}
		mav.setViewName("semi/reservation/reservation.jsp");
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("sort", sort);
		
		
		List<Movie>	movies = resDao.getAllMoviesRankBySort(map);
		List<Theater> theaters = theaterDao.getAllTheaters();
		List<String> cities = theaterDao.getAllCities();
		List<CityCount> counts = resDao.getCountCitiesByMovieNo(mno);
		
		mav.addAttribute("theaters", theaters);
		mav.addAttribute("cities", cities);
		mav.addAttribute("movies", movies);
		mav.addAttribute("counts", counts);
		
		String memberId = "";
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		try {
			memberId = member.getId();
		} catch (Exception e) {
			memberId = "";
			return mav;
		}
		
		MyTheaterDao myTheaterDao = new MyTheaterDao();
		List<MyTheater> MyTheaters = (List<MyTheater>) myTheaterDao.selectMyTheatersById(memberId);
		mav.addAttribute("Mytheaters", MyTheaters);

		return mav;
	}
	
	@RequestMapping("/reservation/movietimetable.jf")
	public ModelAndView movietimetable(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/reservation/movietimetable.jsp");
		
		int mno = 0;
		int sort = 0;
		try {
			sort = Integer.parseInt(req.getParameter("sort"));
		} catch(Exception e) {
			sort = 1;
		}
		try {
			mno = Integer.parseInt(req.getParameter("mno"));
			sort = Integer.parseInt(req.getParameter("sort"));
		} catch(Exception e){
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("sort", sort);
			Movie movie = resDao.getRank1MovieByOrderBy(map);
			mno = movie.getNo();
		}
		Movie movie = movieDao.getMovieByNo(mno);
		
		String city = req.getParameter("city");
		if(city == null) {
			city = "서울";
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("sort", sort);
		
		List<Movie> movies = resDao.getAllMoviesRankBySort(map);
		List<Theater> theaters = theaterDao.getAllTheaters();
		List<String> cities = theaterDao.getAllCities();
		
		
		mav.addAttribute("theaters", theaters);
		mav.addAttribute("cities", cities);
		mav.addAttribute("movies", movies);
		mav.addAttribute("findMovie", movie);

		return mav;
	}
	
	@RequestMapping("/reservation/theatertimetable.jf")
	public ModelAndView theatertimetable(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String city = req.getParameter("city");
		if(city == null) {
			city = "서울";
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/reservation/theatertimetable.jsp?city=" + city);
		
		List<Theater> theaters = theaterDao.getAllTheaters();
		List<String> cities = theaterDao.getAllCities();
		
		
		mav.addAttribute("theaters", theaters);
		mav.addAttribute("cities", cities);
		
		String memberId = "";
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		try {
			memberId = member.getId();
		} catch (Exception e) {
			memberId = "";
			return mav;
		}
		
		MyTheaterDao myTheaterDao = new MyTheaterDao();
		List<MyTheater> MyTheaters = (List<MyTheater>) myTheaterDao.selectMyTheatersById(memberId);
		mav.addAttribute("Mytheaters", MyTheaters);
		
		return mav;
	}
	
	@RequestMapping("/reservation/selectmovie.jf")
	public ModelAndView selectMovie(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		int mno = Integer.parseInt(req.getParameter("mno"));
		
		
		List<Ticketing> ticketings = resDao.getTicketingsByMovieNo(mno);
		List<CityCount> counts = resDao.getCountCitiesByMovieNo(mno);
		List<String> cities = theaterDao.getAllCities();
		
		mav.addAttribute("counts", counts);
		mav.addAttribute("ticketings", ticketings);
		mav.addAttribute("cities", cities);

		return mav;
	}
	
	@RequestMapping("/reservation/selectcity.jf")
	public ModelAndView selectcity(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		int mno = 0;
		try {
			mno = Integer.parseInt(req.getParameter("mno"));
		} catch (Exception e) {
			mno = 1;
		}
		String city = req.getParameter("city");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("movieNo", mno);
		map.put("theaterCity", city);
		
		List<String> theaters = resDao.getTheaterNameByMnoCity(map);
		
		mav.addAttribute("theaters", theaters);
		
		return mav;
	}
	
	@RequestMapping("/reservation/selecttheater.jf")
	public ModelAndView selecttheater(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		int movieNo = Integer.parseInt(req.getParameter("mno"));
		String theaterName = req.getParameter("tname");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("movieNo", movieNo);
		map.put("theaterName", theaterName);
		
		List<String> dates = resDao.getDatesByMnoTname(map);
		
		mav.addAttribute("dates", dates);
		
		return mav;
	}
	
	@RequestMapping("/reservation/selectdate.jf")
	public ModelAndView selectdate(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());

		int mno = Integer.parseInt(req.getParameter("mno"));
		String sdate = req.getParameter("sdate");
		String tname = req.getParameter("tname");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("MM-dd-E");
		String formatDate = format1.format(date);
		
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		String formatSDate = "";
		if(sdate.length() != 10) {
			formatSDate = sdate;
		} else {
			Date d = format2.parse(sdate);
			formatSDate = format1.format(d);
		}
		
		map.put("movieNo", mno);
		map.put("screeningDate", formatSDate);
		map.put("theaterName", tname);
		map.put("date", formatDate);
	
		System.out.println(map);
		
		List<Ticketing> screenings = resDao.getScreeningsByMDT(map);
		List<Map<String, Object>> counts = resDao.getReservationCount();
		
		mav.addAttribute("screenings", screenings);
		mav.addAttribute("counts", counts);
		
		return mav;
	}
	
	@RequestMapping("/reservation/goreservation.jf")
	public ModelAndView goreservation(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/reservation/successres.jsp");
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		String memberId = member.getId();
		int count = 0;
		try {
			count = Integer.parseInt(req.getParameter("count"));
		} catch (Exception e) {
			count = 1;
		}
		System.out.println("count : " + count);
		int sno = 0;
		try {
			sno = Integer.parseInt(req.getParameter("sno"));
		} catch(Exception e) {
			sno = 0;
		}
		List<Movie> movies = movieDao.getAllMovies();
		
		int movieNo = resDao.getMovieNoBySno(sno);
		int realMembers = 0;
		int finalRealMembers = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i<movies.size(); i++) {
			if((i+1) == movieNo) {
				realMembers = resDao.getRealMembersByMno(movieNo);
				finalRealMembers = count + realMembers;
			} else {
				realMembers = resDao.getRealMembersByMno(i+1);
			}
		}
		
		int sumRealMembers = resDao.getSumRealMembers() + count;
		// System.out.println("sumRealMembers : " + sumRealMembers);
		double resRate = 0.0;
		for(int i=0; i<movies.size(); i++) {
			if((i+1) == movieNo) {
				resRate = Math.floor(((double)finalRealMembers/sumRealMembers)*100*10)/10.0;
				
				System.out.println(finalRealMembers);
				System.out.println(resRate);
				map.put("count", finalRealMembers);
				map.put("resRate", resRate);
				map.put("movieNo", movieNo);	
				resDao.updateMoviesByMno(map);
				// System.out.println("1::::" + map);
			} else {
				realMembers = resDao.getRealMembersByMno(i+1);
				resRate = Math.floor(((double)realMembers/sumRealMembers)*100*10)/10.0;
				map.put("count", realMembers);
				map.put("resRate", resRate);
				map.put("movieNo", i+1);
				resDao.updateMoviesByMno(map);
				// System.out.println("2::::" + map);
			}
		}
		
		Reservation reservation = new Reservation();
		reservation.setMemberId(memberId);
		reservation.setScreeningNo(sno);
		reservation.setReservationCount(count);
		
		resDao.insertReservation(reservation);
		
		return mav;
	}
	
	@RequestMapping("/reservation/showttformovie.jf")
	public ModelAndView showttformovie(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		int mno = 0;
		int sort = 0;
		try {
			sort = Integer.parseInt(req.getParameter("sort"));
		} catch(Exception e) {
			sort = 1;
		}
		try {
			mno = Integer.parseInt(req.getParameter("mno"));
			sort = Integer.parseInt(req.getParameter("sort"));
		} catch(Exception e){
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("sort", sort);
			Movie movie = resDao.getRank1MovieByOrderBy(map);
			mno = movie.getNo();
		}
		String theaterCity = req.getParameter("city");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theaterCity", theaterCity);
		map.put("movieNo", mno);
		
		List<Ticketing> ticketings = resDao.getTicketingsByMovieNo(mno);
		List<String> dates = resDao.getDatesByMC(map);
		Movie movie = resDao.getMovieInfosByMno(mno);
		
		mav.addAttribute("ticketings", ticketings);
		mav.addAttribute("dates", dates);
		mav.addAttribute("movie", movie);

		return mav;
	}
	
	@RequestMapping("/reservation/showttfordate.jf")
	public ModelAndView showttfordate(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		int mno = Integer.parseInt(req.getParameter("mno"));
		String sdate = req.getParameter("sdate");
		
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("MM-dd-E");
		String formatDate = format1.format(date);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movieNo", mno);
		map.put("screeningDate", sdate);
		map.put("date", formatDate);
		
		List<Ticketing> times = resDao.getScreeningsByMD(map);
		List<Map<String, Object>> resCount = resDao.getReservationCount();
		List<Theater> theaterInfos = theaterDao.getAllTheaters();
		
		mav.addAttribute("times", times);
		mav.addAttribute("resCount", resCount);
		mav.addAttribute("theaterInfos", theaterInfos);

		return mav;
	}
	
	@RequestMapping("/reservation/showmovie.jf")
	public ModelAndView showmovie(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		String tname = req.getParameter("tname");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", tname);
		map.put("theaterName", tname);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("tname", tname);
		
		List<Ticketing> movies = resDao.getTicketingsByTname(map2);
		List<String> dates = resDao.getDatesBySort(map);
		
		mav.addAttribute("movies", movies);
		mav.addAttribute("dates", dates);
		

		return mav;
	}
	
	@RequestMapping("/reservation/showtime.jf")
	public ModelAndView showtime(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		String tname = req.getParameter("tname");
		String sdate = req.getParameter("sdate");
		int mno = Integer.parseInt(req.getParameter("mno"));
		
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("MM-dd-E");
		String formatDate = format1.format(date);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theaterName", tname);
		map.put("screeningDate", sdate);
		// 오늘 날짜
		map.put("date", formatDate);
		
		System.out.println(map);
		
		List<Ticketing> screenings = resDao.getScreeningsByDT(map);
		List<Map<String, Integer>> ageLimits = resDao.getAllAgeLimit();
		List<Movie> movies = resDao.getAllMovieInfos();
		List<Map<String, Object>> resCount = resDao.getReservationCount();
		
		mav.addAttribute("screenings", screenings);
		mav.addAttribute("ageLimits", ageLimits);
		mav.addAttribute("movies", movies);
		mav.addAttribute("resCount", resCount);

		return mav;
	}
	
	@RequestMapping("/reservation/showttforcity.jf")
	public ModelAndView showttforcity(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		int sort = 0;
		try {
			sort = Integer.parseInt(req.getParameter("sort"));
		} catch(Exception e) {
			sort = 1;
		}
		int movieNo = 0;
		try {
			movieNo = Integer.parseInt(req.getParameter("mno"));
		} catch(Exception e) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("sort", sort);
			Movie movie = resDao.getRank1MovieByOrderBy(map);
			movieNo = movie.getNo();
		}
		String theaterCity = "";
		try {
			theaterCity = req.getParameter("city");
		} catch(Exception e) {
			theaterCity = "서울";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movieNo", movieNo);
		map.put("theaterCity", theaterCity);
		
		System.out.println(map);
		
		List<String> theaters = resDao.getTheaterNameByMnoCity(map);
		
		System.out.println(theaters);
		mav.addAttribute("theaters", theaters);

		return mav;
	}
	
	@RequestMapping("/reservation/showtheaters.jf")
	public ModelAndView showtheaters(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());
		
		String city = req.getParameter("city");
		int mno = 0;
		try {
			mno = Integer.parseInt(req.getParameter("mno"));
		} catch(Exception e) {
			mno = 1;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theaterCity", city);
		map.put("movieNo", mno);
		
		List<Ticketing> ticketings = resDao.getTicketingsByMovieNo(mno);
		List<String> dates = resDao.getDatesByMC(map);
		List<String> cities = resDao.getTheatersByCityName(city);
		
		mav.addAttribute("cities", cities);
		mav.addAttribute("dates", dates);
		mav.addAttribute("ticketings", ticketings);

		return mav;
	}
}
