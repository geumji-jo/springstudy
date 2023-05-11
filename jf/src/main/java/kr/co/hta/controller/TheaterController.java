package kr.co.hta.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hta.movies.dao.MyTheaterDao;
import kr.co.hta.movies.dao.NoticeDao;
import kr.co.hta.movies.dao.ReservationDao;
import kr.co.hta.movies.dao.TheaterDao;
import kr.co.hta.vo.CityAndTheater;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.MyTheater;
import kr.co.hta.vo.Notice;
import kr.co.hta.vo.Room;
import kr.co.hta.vo.RoomDetailInfo;
import kr.co.hta.vo.ScreeningDate;
import kr.co.hta.vo.ScreeningInfo;
import kr.co.hta.vo.Theater;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class TheaterController {
	TheaterDao theaterDao = new TheaterDao(); 
	NoticeDao noticeDao = new NoticeDao();
	MyTheaterDao myTheaterDao = new MyTheaterDao();
	
	@RequestMapping("/member/ajaxTimeTable.jf")
	public ModelAndView ajaxGetTimetable(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String inputDate = req.getParameter("date");
		 
		if(inputDate == null) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
			inputDate = sdf.format(date);
		}
		
		int tno = 0;
		try {
			tno = Integer.parseInt(req.getParameter("tno"));
		} catch (Exception e) {
			tno = 1;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("tno", tno);
		map.put("sdate",inputDate);
		
		List<ScreeningInfo> screeningInfos = theaterDao.getScreeningByTheaterAndDate(map);
		ArrayList<ScreeningInfo> screeningInfos2 = new ArrayList<ScreeningInfo>();
		
		for(ScreeningInfo screening : screeningInfos) {
			int mno = screening.getMovieNo();
			ScreeningInfo screeningInfo = new ScreeningInfo();
			screeningInfo.setMovieNo(screening.getMovieNo());
			screeningInfo.setMovieName(screening.getMovieName());
			screeningInfo.setAgeLimit(screening.getAgeLimit());
			screeningInfo.setRno(screening.getRno());
			screeningInfo.setGenre(screening.getGenre());
			screeningInfo.setRunningTime(screening.getRunningTime());
			screeningInfo.setSeat(screening.getSeat());
			screeningInfo.setReleaseDate(screening.getReleaseDate());
			
			Map<String,Object> roomMap = new HashMap<String, Object>();
			roomMap.put("tno", tno);
			roomMap.put("sdate", inputDate);
			roomMap.put("mno",mno);
			
			ArrayList<Room> rooms = (ArrayList<Room>) theaterDao.getRoomsByMovie(roomMap);
			ArrayList<Room> rooms2	 = new ArrayList<Room>();
			
			for(Room room : rooms) {
				Room newRoom = new Room();
				newRoom.setRoomNo(room.getRoomNo());
				newRoom.setTotalSeat(room.getTotalSeat());
				
				Map<String, Object> roomDetailMap = new HashMap<String, Object>();
				roomDetailMap.put("rno", room.getRoomNo());
				roomDetailMap.put("sdate",inputDate);
				roomDetailMap.put("mno",mno);
				
				ArrayList<RoomDetailInfo> roomDetailInfos = (ArrayList<RoomDetailInfo>) theaterDao.getScreeningRoomDetail(roomDetailMap);
				//시작	
				ReservationDao reservationDao = new ReservationDao();
				List<Map<String, Object>> lists = reservationDao.getReservationCount();
				
				for(RoomDetailInfo roomDetailInfo : roomDetailInfos) {
					int leftSeat = roomDetailInfo.getLeftSeat();
					int screeningNo = roomDetailInfo.getScreeningNo();
					
					for(Map<String,Object> list : lists) {
						if(screeningNo == ((BigDecimal)list.get("SCREENINGNO")).intValue()) {
							leftSeat -= ((BigDecimal)list.get("COUNT")).intValue();
						}
					}
					roomDetailInfo.setLeftSeat(leftSeat);
				}
				//				
				newRoom.setRoomDetail(roomDetailInfos);
				rooms2.add(newRoom);
			}
			screeningInfo.setRooms(rooms2);
			screeningInfos2.add(screeningInfo);
		}
		mav.addAttribute("screenings", screeningInfos2);
		
		mav.setView(new JSONView());
		return mav;
	}
	@RequestMapping("/cgv/cgvtheaters.jf")
	public ModelAndView cgvTheaters(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("semi/CGVTheater/CGVtheater.jsp");
		
		String inputDate = req.getParameter("date");
		
		if(inputDate == null) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
			inputDate = sdf.format(date);
		}
		
		String city = req.getParameter("city");
		if (city == null) {
			city = "서울";
		}
		
		int tno = 0;
		try {
			tno = Integer.parseInt(req.getParameter("tno"));
		} catch (Exception e) {
			tno = 1;
		}
		List<Theater> theaters = theaterDao.getTheaterByCity(city);
		
		Theater theater = theaterDao.getTheaterByNo(tno);
		int roomsCount = theaterDao.getRoomsByTheaterNo(tno);
		int seatsCount = theaterDao.getSeatsByTheaterNo(tno);
		List<Notice> notices = noticeDao.selectNotice2ByRecent();
		List<String> cities = theaterDao.getAllCities();
		List<CityAndTheater> cats = theaterDao.getAllCitiesAndTheater(); 
		List<ScreeningDate> monthAndDates = new ArrayList<>();
		
		Map<String, Object> datesMap = new HashMap<String, Object>();
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		
		datesMap.put("tno", tno);
		datesMap.put("sdate",sdf.format(now));
		
		List<String> dates = theaterDao.get7DaysByTheaterNo(datesMap);
		for(String date : dates) {
			String[] words = date.split("-");
			ScreeningDate screeningDate = new ScreeningDate();
			screeningDate.setMonth(words[0]);
			screeningDate.setDate(words[1]);
			screeningDate.setFullDate(date);
			monthAndDates.add(screeningDate);
		}
		//ajax 용 today 날짜
		String today = sdf.format(now);
		//ajax 용 today 날짜
		mav.addAttribute("cats", cats);
		mav.addAttribute("theaters", theaters);
		mav.addAttribute("theater", theater);
		mav.addAttribute("cities", cities);
		mav.addAttribute("roomsCount", roomsCount);
		mav.addAttribute("seatsCount", seatsCount);
		mav.addAttribute("notices", notices);
		mav.addAttribute("monthAndDates", monthAndDates);
		mav.addAttribute("today", today);
		mav.addAttribute("inputDate", inputDate);
		

		// made by 해훈
		// 자주 가는 극장
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

	
	@RequestMapping("/cgv/showTheater.jf")
	public ModelAndView showTheaters2(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setView(new JSONView());

		String city = req.getParameter("city");
		List<Theater> theaters = myTheaterDao.getTheatersByCity(city);
		
		
		mav.addAttribute("theaters", theaters);
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		String memberId = member.getId();
		
		MyTheaterDao myTheaterDao = new MyTheaterDao();
		List<MyTheater> MyTheaters = (List<MyTheater>) myTheaterDao.selectMyTheatersById(memberId);
		mav.addAttribute("Mytheaters", MyTheaters);
		
		
		return mav;
	}
	
	@RequestMapping("/cgv/addMyTheater.jf")
	public ModelAndView addMyTheater2(HttpServletRequest req, HttpServletResponse res) throws Exception {
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
	
	@RequestMapping("/cgv/removeMyTheater.jf")
	public ModelAndView remove2(HttpServletRequest req, HttpServletResponse res) throws Exception {
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
	@RequestMapping("/cgv/price.jf")
	public ModelAndView moviePrice(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("semi/CGVTheater/price.jsp");
		return mav;
	}
}
