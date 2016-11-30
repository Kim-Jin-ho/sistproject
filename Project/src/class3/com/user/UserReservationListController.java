package class3.com.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserReservationListController implements Controller
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
		
		ArrayList<UserDTO> userReservationList = new ArrayList<UserDTO>();
		
		HttpSession session = request.getSession(); //세션에 있는 아이디 값을 받아온다.
		String UserId= (String)session.getAttribute("checkid");
			
		try
		{
			// userReservationList() 메소드로 userReservationList 변수에 담기
			userReservationList = dao.userReservationList(UserId);
			
			// 회원 예약 리스트를 userReservationList.jsp 로 보냄
			mav.addObject("userReservationList", userReservationList);
			mav.setViewName("user/UserReservationList.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
}
