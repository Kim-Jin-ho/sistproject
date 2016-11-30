package class3.com.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class UserQnaCreateController implements Controller
{
	private IUserDAO dao;

	public void setDao(IUserDAO dao)
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
				UserDTO dto = new UserDTO();
				
				dto.setSbjct(subject);
				dto.setCtnt(content);
				
				// 가져온 변수로 userQnaCreate() 메소드를 사용해 QNA 글 등록
				dao.userQnaCreate(dto);
				
				// 다시 UserQnaList.love 으로 보내 등록된 글을 포함한 리스트 출력
				mav.setViewName("redirect:UserQnaList.love");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
