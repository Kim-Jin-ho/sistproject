package class3.com.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class UserQnaUpdateController implements Controller
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
		String cd = request.getParameter("cd");
		
		try
		{
			UserDTO dto = new UserDTO();
			
			dto.setSbjct(subject);
			dto.setCtnt(content);
			dto.setCd(cd);
			
			// 가져온 변수로 userQnaUpdate() 메소드를 사용해 QNA 글 수정 등록
			dao.userQnaUpdate(dto);
			
			// 다시 UserQnaList.love 으로 보내 수정된 글을 포함한 리스트 출력
			mav.setViewName("redirect:/UserQnaList.love");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}
	

}
