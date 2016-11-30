package class3.com.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserReservationDeleteController implements Controller
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
			// 가져온 변수로 userReservationDelete() 메소드를 사용해 예약 삭제
			dao.userReservationDelete(cd);
			
			// 다시 UserReservationList.love 으로 보내 예약이 삭제된 리스트 출력
			mav.setViewName("redirect:/UserReservationList.love");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}

}
