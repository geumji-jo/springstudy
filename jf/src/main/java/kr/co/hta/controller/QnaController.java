package kr.co.hta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hta.movies.dao.MyTheaterDao;
import kr.co.hta.movies.dao.QnaDao;
import kr.co.hta.movies.dao.QuestionDao;
import kr.co.hta.movies.dao.TheaterDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.Criteria;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.MyTheater;
import kr.co.hta.vo.Pagination;
import kr.co.hta.vo.Question;
import kr.co.hta.vo.Theater;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class QnaController {
	
	private QnaDao qnaDao = new QnaDao();
	TheaterDao theaterDao = new TheaterDao();
	QuestionDao questionDao = new QuestionDao();
	MyTheaterDao myTheaterDao = new MyTheaterDao();
	
	//1대1문의 답변 보는 페이지
	@RequestMapping("/member/questionanserform.jf")
	public ModelAndView questionanserform(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/questionanserform.jsp");
		
		int qno = Integer.parseInt(req.getParameter("qno"));
		
		Question question = questionDao.selectQuestionByNo(qno);
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		
		String memberId = member.getId();
		//자주가는 극장
		List<MyTheater> MyTheaters = (List<MyTheater>) myTheaterDao.selectMyTheatersById(memberId);
		mav.addAttribute("MyTheaters", MyTheaters);
		//
		// 도시명
				List<String> cities = theaterDao.getAllCities();
				mav.addAttribute("cities", cities);
		//
		mav.addAttribute("question", question);
		return mav;
	}

	//1대1문의 리스트 페이지
	@RequestMapping("/member/questionlist.jf")
	public ModelAndView questionlist(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		
		String opt = req.getParameter("opt");
		String keyword = req.getParameter("keyword");
		
		Criteria c = new Criteria();
		
		if (keyword != null && !keyword.isEmpty()) {
			c.setOption(opt);
			c.setKeyword(keyword);
		}
		
		c.setBegin((pno-1)*10+1);
		c.setEnd(pno*10);
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if(member == null) {
			mav.setViewName("redirect:/jf/member/login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		//자주가는 극장
		List<MyTheater> MyTheaters = (List<MyTheater>) myTheaterDao.selectMyTheatersById(memberId);
		mav.addAttribute("MyTheaters", MyTheaters);
		//
		// 도시명
				List<String> cities = theaterDao.getAllCities();
				mav.addAttribute("cities", cities);
		//
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", c);
		map.put("memberId",memberId );
		
		List<Question> questions = qnaDao.questionListByRange(map);
		
		
		int records = qnaDao.questionTotalCount(map);
		
		
		int no = (int)Math.ceil((double)records/10);
		
		Pagination pagination = new Pagination(pno, 10, records);
		
		mav.addAttribute("no", no);
		mav.addAttribute("questions", questions);
		mav.addAttribute("pagination", pagination);
	
		mav.setViewName("semi/member/questionlist.jsp");

		return mav;
	}
	
	
	//1대1문의(디테일) 등록 페이지
	@RequestMapping("/member/questiondetail.jf")
	public ModelAndView questiondetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/questiondetail.jsp");
		List<String> cities = theaterDao.getAllCities();
		mav.addAttribute("toggleNo", 4);
		mav.addAttribute("cities", cities);
		
		return mav;
	}
	
	// ajax로 지역에 따른 극장 가져와서 보여주기
	@RequestMapping("/member/showtheaters.jf")
	public ModelAndView showtheaters(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		// JSON타입으로 데이터를 내려주기
		mav.setView(new JSONView());
		// xhr 요청 uri로 보내준 city 꺼내기
		String city = req.getParameter("city");
		// DB에서 city에 해당하는 극장 리스트 가져오기
		List<Theater> theaters = theaterDao.getTheaterByCity(city);
		// jsp로 다시 보내주기
		mav.addAttribute("theaters", theaters);

		return mav;
	}
	// 문의 등록하기
	@RequestMapping("/member/insertQuestion.jf")
	public ModelAndView insertQuestion(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:questionlist.jf?pno=1");

		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		String memberId = member.getId();
		
		Question question = new Question();
		
		String title = req.getParameter("questionTitle");
		String content = req.getParameter("questionContent");
		String theaterNo = req.getParameter("theater");
		
		question.setTitle(title);
		question.setContents(content);
		question.setTheaterNo(Integer.parseInt(theaterNo));
		question.setMemberId(memberId);
		
		qnaDao.insertQuestion(question);
		
		return mav;
	}
	
	//문의 삭제하기
	@RequestMapping("/member/questiondel.jf")
	public ModelAndView deleteQuestions(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String[] values = req.getParameterValues("qno");
		
		for(String qno: values) {
			 qnaDao.deleteQuestions(Integer.parseInt(qno));
		}
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		mav.setViewName("redirect:questionlist.jf?pno=" + pno);		
		return mav;
	}
}
