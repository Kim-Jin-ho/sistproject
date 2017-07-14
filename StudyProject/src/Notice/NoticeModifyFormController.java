package Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.INoticeDAO;
import dto.Notice;

public class NoticeModifyFormController implements Controller
{
	private INoticeDAO dao;
	
	public void setDao(INoticeDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String noticeSeq = request.getParameter("noticeSeq");
		ModelAndView mav = new ModelAndView();
		Notice notice = new Notice();
		
		try
		{
			notice = dao.noticeDetail(noticeSeq);
			
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		mav.addObject("notice",notice);
		mav.setViewName("WEB-INF/jsp/Notice/NoticeModify.jsp");
		return mav;
	}
	
	

}
