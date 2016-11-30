package Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.INoticeDAO;
import dto.Notice;

public class NoticeDetailController implements Controller
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
		Notice content = new Notice();
		Notice preContent = new Notice();
		Notice nextContent = new Notice();
		
		String noticeSeq = request.getParameter("noticeSeq");
		
		try
		{
			// 상세 내용 출력 DAO 실행
			content = dao.noticeDetail(noticeSeq);
			
			// 조회수 1증가 DAO 실행
			int result = dao.addHitCount(noticeSeq);
			System.out.println("조회수증가성공여부:"+result);
			
			//rnum가져오기
			int noticeRnum = content.getRnum();
			System.out.println("해당글rnum:"+noticeRnum);
			
			//rnum이 이전글 다음글 가져오기
			preContent = dao.preNotice(Integer.toString(noticeRnum));
			nextContent = dao.nextNotice(Integer.toString(noticeRnum));
			
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		mav.addObject("content", content);
		mav.addObject("preContent", preContent);
		mav.addObject("nextContent", nextContent);
		mav.setViewName("WEB-INF/jsp/Notice/NoticeDetail.jsp");
		return mav;
	}




}
