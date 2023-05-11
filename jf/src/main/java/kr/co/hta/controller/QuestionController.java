package kr.co.hta.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hta.movies.dao.MyTheaterDao;
import kr.co.hta.movies.dao.QuestionDao;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.MyTheater;
import kr.co.hta.vo.Question;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class QuestionController {
	
	QuestionDao questionDao = new QuestionDao();
	
	
	@RequestMapping("/admin/questionlist.jf")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if(member == null) {
			mav.setViewName("/jf/member/login.jf");
			return mav;
		}
		mav.setViewName("semi/admin/questionlist.jsp");
		int toggleNo = CommonUtils.stringToNumber(req.getParameter("toggleNo"), 4);
		mav.addAttribute("toggleNo", toggleNo);
		List<Question> questions = questionDao.selectAllQuestion();
		
		mav.addAttribute("questions", questions);

		return mav;
	}
	
	@RequestMapping("/admin/questiondetailform.jf")
	public ModelAndView form(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/admin/questiondetailform.jsp");
		
		int no = Integer.parseInt(req.getParameter("qno"));
		
		Question question = questionDao.selectQuestionByNo(no);
//		question.setAnswerContents(question.getAnswerContents().replace("\r\n", "<br>"));
		mav.addAttribute("question", question);
		
		return mav;
	}
	
	@RequestMapping("/admin/answeradd.jf")
	public ModelAndView answeradd(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(req.getParameter("qno"));
		mav.setViewName("redirect:questiondetailform.jf?qno=" + no);
		String answerContents = req.getParameter("answerContents");
		answerContents = answerContents.replace("\r\n", "<br>");
		
		Question question = questionDao.selectQuestionByNo(no);
		question.setAnswerContents(answerContents);
		
		questionDao.updateQuestion(question);
		
		return mav;
	}
	
}
