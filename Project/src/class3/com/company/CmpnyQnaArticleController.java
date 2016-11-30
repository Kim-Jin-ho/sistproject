package class3.com.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CmpnyQnaArticleController implements Controller
{
	private ICmpnyDAO dao;

	public void setDao(ICmpnyDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		CmpnyDTO cmpnyQnaArticle = new CmpnyDTO();
		CmpnyDTO cmpnyQnaComment = new CmpnyDTO();
		
		// 특정 QNA 글의 USR_QNA_CD 를 가져옴
		String cd = request.getParameter("cd");
		
		try
		{
			// cmpnyQnaComment() 메소드로 cmpnyQnaComment 변수에 담기
			cmpnyQnaComment = dao.cmpnyQnaComment(cd);
			// cmpnyQnaArticle() 메소드로 cmpnyQnaArticle 변수에 담기
			cmpnyQnaArticle = dao.cmpnyQnaArticle(cd);
			
			dao.updateCount(cd);
			
			// 회원 특정 QNA 글 내용과 댓글을 UserQnaArticle.jsp 로 보냄
			mav.addObject("cmpnyQnaComment", cmpnyQnaComment);
			mav.addObject("cmpnyQnaArticle", cmpnyQnaArticle);
			mav.setViewName("company/CmpnyQnaArticle.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
