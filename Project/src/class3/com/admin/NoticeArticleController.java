package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoticeArticleController implements Controller
{
	private INoticeDAO dao;

	public void setDao(INoticeDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		NoticeDTO noticeArticle = new NoticeDTO();
		
		// 특정 공지사항 글의 NTC_CD 를 가져옴
		String cd = request.getParameter("cd");
		
		try
		{
			// noticeArticle() 메소드로 noticeArticle 변수에 담기
			noticeArticle = dao.noticeArticle(cd);
			
			dao.updateCount(cd);
			
			// 회원 특정 QNA 글 내용과 댓글을 NoticeArticle.jsp 로 보냄
			mav.addObject("noticeArticle", noticeArticle);
			mav.setViewName("admin/NoticeArticle.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
}
