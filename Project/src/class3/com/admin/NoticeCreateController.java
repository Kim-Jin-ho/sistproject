package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class NoticeCreateController implements Controller
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
		
		try
		{
			{
				NoticeDTO dto = new NoticeDTO();
				
				dto.setSbjct(subject);
				dto.setCtnt(content);
				
				// 가져온 변수로 noticeCreate() 메소드를 사용해 공지사항 글 등록
				dao.noticeCreate(dto);
				
				// 다시 noticeList.love 으로 보내 등록된 글을 포함한 리스트 출력
				mav.setViewName("redirect:NoticeList.love");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
