package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class AddCmtController2 implements Controller
{
	private IQnaDAO dao;

	public void setDao(IQnaDAO dao) {
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ModelAndView mav = new ModelAndView();
	
		String cd = request.getParameter("cd");
		String adminCmt = request.getParameter("adminCmt");
		
		try {
			
			System.out.println("");
			Qna qna = new Qna();
			
			qna.setCd(cd);
			qna.setCtnt(adminCmt);
			
			System.out.println(request.getParameter("cd"));
			System.out.println(request.getParameter("adminCmt"));
			
			
			dao.addCmt2(qna);
			System.out.println("코멘트 인서트");
			mav.setViewName("redirect:CmpnyQnaArticle.love?cd="+cd);
			System.out.println("입력완료");
			
		} catch (Exception e) {

		System.out.println(e.toString());
		
		}
	
		return mav;
		
		
	}
	
	
	
	
}
