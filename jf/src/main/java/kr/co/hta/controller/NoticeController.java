package kr.co.hta.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.hta.movies.dao.EventDao;
import kr.co.hta.movies.dao.NoticeDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Event;
import kr.co.hta.vo.Notice;
import kr.co.hta.vo.Pagination;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;


@Controller
public class NoticeController {
	
	private NoticeDao noticeDao = new NoticeDao();
	
	@RequestMapping("/admin/noticelistsearch.jf")
	public ModelAndView selectByNotice(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/noticelistsearch.jsp");
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		int begin = (pno-1)*10 + 1;
		int end = pno*10;
		String keyword = req.getParameter("keyword");
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("keyword", keyword);
		
		List<Notice> notices = noticeDao.selectSearchNotices(map);
		
		int noticeCount = noticeDao.selectSearchNoticesContentCount(keyword);
		
		noticeCount = (int)Math.ceil((double)noticeCount/10);
		if(pno == 0) {
			mav.setViewName("redirect:noticelistsearch.jf?pno=1&keyword="+keyword);
			return mav;
		}
		if(pno == (noticeCount+1)) {
			mav.setViewName("redirect:noticelistsearch.jf?pno="+noticeCount+"&keyword="+keyword);
			return mav;
		}
		mav.addAttribute("count", noticeCount);
		
		
		int count = noticeDao.allCount();
		count = (int)Math.ceil((double)count/10);
		
		mav.addAttribute("notices", notices);
		
		return mav;
	}
	
	@RequestMapping("/admin/noticedelete.jf")
	public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("redirect:noticelist.jf?pno=1");
		
		String[] boxes = req.getParameterValues("box");
		
		for(String box : boxes) {
			noticeDao.deleteByNo(box);
		}
		
		return mav;
	}
	@RequestMapping("/admin/noticedetaildelete.jf")
	public ModelAndView noticedetaildelete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		String no = req.getParameter("nno");
		noticeDao.deleteByNo(no);
		mav.setViewName("redirect:noticelist.jf?pno=1");
		
		
		
		return mav;
	}
	
	@RequestMapping("/admin/noticelist.jf")
	public ModelAndView select(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/noticelist.jsp");
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		String sort = req.getParameter("sort");
		String keyword = req.getParameter("keyword");
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno*size);
		if (keyword != null && !keyword.isEmpty()) {
			criteria.setSort(sort);
			criteria.setKeyword(keyword);
		} 
		
		// 글 갯수 조회
		int records = noticeDao.selectNoticeByCriteriaCount(criteria);
		// 페이지번호에 해당하는 글 목록조회
		List<Notice> notices = noticeDao.selectNoticeByCriteria(criteria);
		// 페이지 내비게이션 처리에 필요한 Pagination 객체 생성
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("pagination", pagination);
		mav.addAttribute("notices", notices);
		mav.addAttribute("records", records);
		
		return mav;
	}
	
	@RequestMapping("/admin/noticedetail.jf")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/noticedetail.jsp");
		
		int no = Integer.parseInt(req.getParameter("nno"));
		
		Notice notice = noticeDao.selectNoticeByNo(no);
		
		mav.addAttribute("notice", notice);
		
		return mav;
	}
	
	@RequestMapping("/admin/noticemodifyform.jf")
	public ModelAndView modifyform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/noticemodifyform.jsp");
		
		int no = Integer.parseInt(req.getParameter("nno"));
		
		Notice notice = noticeDao.selectNoticeByNo(no);
		String contents = notice.getContents().replace("<br>","\r\n");
		notice.setContents(contents);
		
		mav.addAttribute("notice", notice);
		
		return mav;
	}
	
	@RequestMapping("/admin/noticemodify.jf")
	public ModelAndView modify(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:noticelist.jf?pno=1");
		
		int no = Integer.parseInt(req.getParameter("nno"));
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		contents = contents.replace("\r\n", "<br>");
		
		Notice upnotice = new Notice();
		upnotice.setTitle(title);
		upnotice.setContents(contents);
		upnotice.setNo(no);
		
		noticeDao.updateByNo(upnotice);
		
		
		return mav;
	}
	
	@RequestMapping("/admin/noticeform.jf")
	public ModelAndView noticeform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("semi/admin/noticeform.jsp");
		
		return mav;
	}
	
	@RequestMapping("/admin/addnotice.jf")
	public ModelAndView insert(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:noticelist.jf?pno=1");
		
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		contents = contents.replace("\r\n", "<br>");
		
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setContents(contents);
		
		noticeDao.insertNotice(notice);
		return mav;
	}
	
	
}
