package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoticeDeleteController implements Controller
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
		
		String cd = request.getParameter("cd");
		
		try
		{
			// 가져온 변수로 noticeDelete() 메소드를 사용해 공지사항 글 삭제
			dao.noticeDelete(cd);
			
			// 다시 NoticeList.love 으로 보내 등록된 글이 삭제된 리스트 출력
			mav.setViewName("redirect:/NoticeList.love");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
}
