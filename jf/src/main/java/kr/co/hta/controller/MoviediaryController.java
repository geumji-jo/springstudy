package kr.co.hta.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.hta.movies.dao.MemberDao;
import kr.co.hta.movies.dao.MoviediaryDAO;
import kr.co.hta.util.CommonUtils;
import kr.co.hta.vo.DiaryMovieDetail;
import kr.co.hta.vo.Member;
import kr.co.hta.vo.Movie;
import kr.co.hta.vo.Moviediary;
import kr.co.hta.vo.Pagination;
import kr.co.hta.vo.WishList;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.hta.movies.dao.WatchedMovieDao;

@Controller
public class MoviediaryController {
	
	MoviediaryDAO movieDiaryDAO = new MoviediaryDAO();
	MemberDao memberDAO = new MemberDao();
	
	
	
	@RequestMapping("/member/insertmoviediary.jf")
	public ModelAndView insert(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect: moviediary.jf");
		
		String saveDirectory = "C:\\projects\\web_workspace\\jf\\WebContent\\photos";
		
		
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, 1024*1024*50, "utf-8", new DefaultFileRenamePolicy());
		HttpSession session = req.getSession();
		
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		String id = member.getId();
		String diaryContents = mr.getParameter("isGoodMovie");
		String memberId = id;
		String friend = mr.getParameter("txtMovieWith");
		String trailer = mr.getParameter("movietrailer");
		String steelCut = mr.getParameter("moviesteelcut");
		String photo = mr.getFilesystemName("imgName");
		int detailNo = Integer.parseInt(mr.getParameter("detailNo"));
		
		Moviediary diary = new Moviediary();
		diary.setDetailNo(detailNo);
		diary.setDiaryContents(diaryContents);
		diary.setFriend(friend);
		diary.setMemberId(memberId);
		diary.setPhoto(photo);
		diary.setSteelCut(steelCut);
		diary.setTrailer(trailer);
		
		movieDiaryDAO.insertDiary(diary);
		
		return mav;
	}
	
	@RequestMapping("/member/moviediary.jf")
	public ModelAndView moviediary(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("semi/member/moviediary.jsp");
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if(member == null) {
			mav.setViewName("redirect:login.jf?result=default");
			return mav;
		}
		String memberId = member.getId();
		List<Moviediary> diarys = movieDiaryDAO.selectByDiary(memberId);
		List<DiaryMovieDetail> detailById = movieDiaryDAO.selectDiaryMovieDetailById(memberId);
		int diaryCount = movieDiaryDAO.selectDiaryCountById(memberId);
		int wishListsCount = memberDAO.getCountWishListById(memberId);
		WatchedMovieDao watchedDao = new WatchedMovieDao();
		int watchedCount = watchedDao.countAllWatched(memberId);
		
		mav.addAttribute("watchedCount", watchedCount);
		mav.addAttribute("diaryCount", diaryCount);
		mav.addAttribute("wishListsCount", wishListsCount);
		mav.addAttribute("diarys", diarys);
		mav.addAttribute("detailById", detailById);
		
		return mav;
	}
	@RequestMapping("/member/moviediarydetail.jf")
	public ModelAndView moviediarydetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(req.getParameter("detailById"));
		DiaryMovieDetail detail = movieDiaryDAO.selectDiaryMovieDetailByNo(no);
		
		mav.addAttribute("detail", detail);
		mav.setView(new JSONView());
		return mav;
	}
	
	
}
