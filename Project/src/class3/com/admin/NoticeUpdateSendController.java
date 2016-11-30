package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class NoticeUpdateSendController implements Controller
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
		
		NoticeDTO noticeUpdateSend = new NoticeDTO();
		
		String cd = request.getParameter("cd");
		
		try
		{
			// noticeUpdateSend() 메소드로 noticeUpdateSend 변수에 담기
			noticeUpdateSend = dao.noticeUpdateSend(cd);
			
			// 공지사항 글 내용을 수정페이지인 NoticeUpdate.jsp 로 보냄
			mav.addObject("noticeUpdateSend", noticeUpdateSend);
			mav.setViewName("admin/NoticeUpdate.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	

}
