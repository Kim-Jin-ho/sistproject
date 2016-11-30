package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class DelCmtController implements Controller
{

	private IQnaDAO dao;

	public void setDao(IQnaDAO dao) {
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

	
		ModelAndView mav = new ModelAndView();
		
		String cd = request.getParameter("cd");
		String userCmtCd = request.getParameter("userCmtCd");
		System.out.println(cd);
		System.out.println(userCmtCd);
		
		
		try {
			
			System.out.println(cd);
			System.out.println(userCmtCd);
			Qna qna = new Qna();
			
			qna.setCd(cd);
			
			dao.delCmt(cd);
			
			System.out.println("코멘트 삭제");
			

			mav.setViewName("redirect:AdminPriQnaArticle.love?cd="+userCmtCd);
			
		} catch (Exception e) {

			System.out.println(e.toString());
			
			
		}
	
		return mav;
	}
	
	
	
	
}
