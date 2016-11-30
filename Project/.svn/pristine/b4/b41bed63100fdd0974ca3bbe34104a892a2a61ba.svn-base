package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class NoticeUpdateController implements Controller
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
		String cd = request.getParameter("cd");
		
		try
		{
			NoticeDTO dto = new NoticeDTO();
			
			dto.setSbjct(subject);
			dto.setCtnt(content);
			dto.setCd(cd);
			
			// 가져온 변수로 noticeUpdate() 메소드를 사용해 공지사항 글 수정 등록
			dao.noticeUpdate(dto);
			
			// 다시 NoticeList.love 으로 보내 수정된 글을 포함한 리스트 출력
			mav.setViewName("redirect:/NoticeList.love");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}
	

}
