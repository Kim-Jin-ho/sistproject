package Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.INoticeDAO;
import dto.Notice;

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
		String noticeSeq = request.getParameter("noticeSeq");
		System.out.println("삭제컨트롤러진입:"+noticeSeq);
		
		try
		{
			int result = dao.noticeDelete(noticeSeq);
			System.out.println("삭제결과:"+result);
			
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		mav.setViewName("Notice.room");
		return mav;
	}


}
