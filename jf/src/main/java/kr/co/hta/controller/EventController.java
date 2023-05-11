package kr.co.hta.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.hta.movies.dao.EventDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Event;
import kr.co.hta.vo.Notice;
import kr.co.hta.vo.Pagination;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class EventController {
	
	private EventDao eventDao = new EventDao();
	
	@RequestMapping("/admin/eventlist.jf")
	public ModelAndView select(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/eventlist.jsp");
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno*size);
		criteria.setBegin((pno - 1)*size + 1);
		criteria.setEnd(pno*size);
		
		// 글 갯수 조회
		int records = eventDao.selectCountEvent();
		// 페이지번호에 해당하는 글 목록조회
		List<Event> events = eventDao.selectEventByRange(criteria);
		// 페이지 내비게이션 처리에 필요한 Pagination 객체 생성
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("pagination", pagination);
		mav.addAttribute("events", events);
		mav.addAttribute("records", records);
		
		
		
		return mav;
	}
	
	@RequestMapping("/admin/eventform.jf")
	public ModelAndView eventform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/eventform.jsp");

		
		
		return mav;
	}
	
	@RequestMapping("/admin/insert.jf")
	public ModelAndView insert(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:eventlist.jf?pno=1");
		
		String saveDirectory = "C:\\projects\\web_workspace\\jf\\WebContent\\photos\\eventPhotos";
		
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, 1024*1024*50, "utf-8", new DefaultFileRenamePolicy());
		
		String category = mr.getParameter("category");
		String title = mr.getParameter("title");
		String startDate = mr.getParameter("startDate");
		String endDate = mr.getParameter("endDate");
		String imgName = mr.getFilesystemName("imgName");
		String contentImg = mr.getFilesystemName("contentImg");
		
		
		Event event = new Event();
		event.setCategory(category);
		event.setTitle(title);
		event.setStartDate(startDate);
		event.setEndDate(endDate);
		event.setImgName(imgName);
		event.setContent(contentImg);
		eventDao.insertEvent(event);
		return mav;
	}
	@RequestMapping("/semi/eventlist.jf")
	public ModelAndView eventList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/event/event.jsp");
		
		List<Event> eventRecent = eventDao.selectEventRange3();
		mav.addAttribute("eventRecent", eventRecent);
		
		String category = "";
		try {
			category = req.getParameter("cat");
		} catch (Exception e) {
			category = "";
		}
		
		List<Event> AllEvent = eventDao.selectAllEventByIng(category);
		mav.addAttribute("AllEvent", AllEvent);
		
		return mav;
	}
	
	@RequestMapping("/semi/eventDetail.jf")
	public ModelAndView eventDetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/event/eventDetail.jsp");
	
		int eventNo = Integer.parseInt(req.getParameter("eno"));
		Event event = eventDao.selectEventByNo(eventNo);
		mav.addAttribute("event", event);
		
		return mav;
	}
}
