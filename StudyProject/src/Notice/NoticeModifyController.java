package Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.INoticeDAO;
import dto.Notice;

public class NoticeModifyController implements Controller
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
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String noticeSeq = request.getParameter("noticeSeq");
		
		System.out.println("수정내용출력:"+subject+"+"+content+"+"+noticeSeq);
		
		Notice notice = new Notice();
		notice.setSubject(subject);
		notice.setContent(content);
		notice.setNoticeSeq(noticeSeq);
		
		try
		{	
			int result = dao.noticeModify(notice);
			System.out.println("수정결과: "+result);
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		mav.setViewName("redirect:Notice.room");;
		return mav;
	}
	
	

}
