package kr.co.hta.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.hta.movies.dao.NoticeDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Notice;
import kr.co.hta.vo.Pagination;
import kr.co.hta.vo.Question;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class CustomerCenterController {
	NoticeDao noticeDao = new NoticeDao();
	
	@RequestMapping("/semi/admin/customercenter.jf")
	public ModelAndView customercenter(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/customercenter.jsp");
		int toggleNo = CommonUtils.stringToNumber(req.getParameter("toggleNo"), 1);
		mav.addAttribute("toggleNo", toggleNo);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		int	begin = (noticeDao.allCount() -4);
		int end = noticeDao.allCount();
		
		map.put("begin",begin);
		map.put("end",end);
		
		List<Notice> notices = noticeDao.selectNoticeByRange(map);
		int count = noticeDao.allCount();
		mav.addAttribute("notices", notices);
		mav.addAttribute("count", count);

		return mav;
	}
	
	
	@RequestMapping("/semi/admin/customercenter-noticeform.jf")
	public ModelAndView form(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		int toggleNo = CommonUtils.stringToNumber(req.getParameter("toggleNo"), 3);
		mav.setViewName("semi/admin/customercenter-noticeform.jsp");
		
		int no = Integer.parseInt(req.getParameter("nno"));
		noticeDao.viewUpdate(no);
		
		Notice before = noticeDao.selectNoticeByNo((no-1));
		Notice nextTitle = noticeDao.selectNoticeByNo((no+1));
		
		Notice notice = noticeDao.selectNoticeByNo(no);
		mav.addAttribute("toggleNo", toggleNo);
		mav.addAttribute("notice", notice);
		mav.addAttribute("before", before);
		mav.addAttribute("nextTitle", nextTitle);
		
		return mav;
	}
	
	@RequestMapping("/semi/admin/customercenter-noticelist.jf")
	public ModelAndView select(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/customercenter-noticelist.jsp");
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		int toggleNo = CommonUtils.stringToNumber(req.getParameter("toggleNo"), 3);
		mav.addAttribute("toggleNo", toggleNo);
		
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
}
