package class3.com.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserSelectListController implements Controller
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
		
		ArrayList<UserDTO> userSelectList = new ArrayList<UserDTO>();
		
		HttpSession session = request.getSession();
		String UserId = (String)session.getAttribute("checkid");
		try
		{
			// userSelectList() 메소드로 userSelectList 변수에 담기
			userSelectList = dao.userSelectList(UserId);
			
			// 회원 찜 리스트를 UserSelectList.jsp 로 보냄
			mav.addObject("userSelectList", userSelectList);
			mav.setViewName("user/UserSelectList.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
}