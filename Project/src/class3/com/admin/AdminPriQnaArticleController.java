package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class AdminPriQnaArticleController implements Controller
{
	private IQnaDAO dao;
	
	public void setDao(IQnaDAO dao) {
		this.dao = dao;
	}



	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		Qna userQnaArticle = new Qna();
		Qna userQnaComment = new Qna();
		
		// 특정 QNA 글의 USR_QNA_CD 를 가져옴
		String cd = request.getParameter("cd");
		
		try
		{
			// userQnaComment() 메소드로 userQnaComment 변수에 담기
			userQnaComment = dao.userQnaComment(cd);
			// userQnaArticle() 메소드로 userQnaArticle 변수에 담기
			userQnaArticle = dao.userQnaArticle(cd);
			
			dao.updateCount(cd);
			
			// 회원 특정 QNA 글 내용과 댓글을 UserQnaArticle.jsp 로 보냄
			mav.addObject("userQnaComment", userQnaComment);
			mav.addObject("userQnaArticle", userQnaArticle);
			mav.setViewName("admin/AdminPriQnaArticle.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
