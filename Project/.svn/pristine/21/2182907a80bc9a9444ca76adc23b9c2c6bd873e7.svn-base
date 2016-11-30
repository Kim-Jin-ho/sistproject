package class3.com.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserQnaUpdateSendController implements Controller
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
		
		UserDTO userQnaUpdateSend = new UserDTO();
		
		String cd = request.getParameter("cd");
		
		try
		{
			// userQnaUpdateSend() 메소드로 userQnaUpdateSend 변수에 담기
			userQnaUpdateSend = dao.userQnaUpdateSend(cd);
			
			// 회원 QNA 글 내용을 수정페이지인 UserQnaUpdate.jsp 로 보냄
			mav.addObject("userQnaUpdateSend", userQnaUpdateSend);
			mav.setViewName("user/UserQnaUpdate.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	

}
