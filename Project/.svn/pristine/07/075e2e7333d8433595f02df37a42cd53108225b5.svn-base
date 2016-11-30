package class3.com.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserAdviceListController implements Controller
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
		
		ArrayList<UserDTO> userAdviceList = new ArrayList<UserDTO>();
		
		HttpSession session = request.getSession();
		String UserId = (String)session.getAttribute("checkid");
		
		try
		{
			// userAdviceList() 메소드로 userAdviceList 변수에 담기
			userAdviceList = dao.userAdviceList(UserId);
			
			// 회원 상담 리스트를 UserAdviceList.jsp 로 보냄
			mav.addObject("userAdviceList", userAdviceList);
			mav.setViewName("user/UserAdviceList.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
}
