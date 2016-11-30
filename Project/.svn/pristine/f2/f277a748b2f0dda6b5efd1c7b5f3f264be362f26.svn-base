package class3.com.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserQnaDeleteController implements Controller
{
	private IUserDAO dao;

	public void setDao(IUserDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		HttpSession session = request.getSession();
	    String UserId = (String)session.getAttribute("checkid");
		
		
		ModelAndView mav = new ModelAndView();
		String cd = request.getParameter("cd");
		
		try
		{
			// 가져온 변수로 userQnaDelete() 메소드를 사용해 QNA 글 삭제
			dao.userQnaDelete(cd,UserId);
			
			// 다시 UserQnaList.love 으로 보내 등록된 글이 삭제된 리스트 출력
			mav.setViewName("redirect:/UserQnaList.love");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
}
