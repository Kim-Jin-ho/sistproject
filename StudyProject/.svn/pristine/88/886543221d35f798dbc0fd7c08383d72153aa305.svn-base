package Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.INoticeDAO;
import dto.Notice;

public class NoticeInsertController implements Controller
{
	private INoticeDAO dao;

	public void setDao(INoticeDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		
		System.out.println("insert진입:"+subject+"/"+content);
		
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("admin");
		
		ModelAndView mav = new ModelAndView();
		
		try
		{
			Notice notice = new Notice();
			
			notice.setSubject(subject);
			notice.setContent(content);
			notice.setWriter(writer);
			
			dao.noticeWrite(notice);
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		mav.setViewName("redirect:Notice.room");
		return mav;
	}
	
	

}
