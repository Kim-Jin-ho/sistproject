package class3.com.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserSelectDeleteController implements Controller
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
		
		String cd = request.getParameter("cd");
		
		
		try
		{
			// 가져온 변수로 userSelectDelete() 메소드를 사용해 찜 삭제
			dao.userSelectDelete(cd);
			
			// 다시 UserSelectList.love 으로 보내 찜이 삭제된 리스트 출력
			mav.setViewName("redirect:/UserSelectList.love");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	
}
