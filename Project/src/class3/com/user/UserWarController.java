package class3.com.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserWarController implements Controller
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
		
		// 경고 1,2,3 변수 선언
		String userWar1, userWar2, userWar3 = "";
		
		HttpSession session = request.getSession();
		String UserId = (String)session.getAttribute("checkid");
		
		try
		{
			// userWar() 메소드로 userWar 변수에 담기
			userWar1 = dao.userWar1(UserId);
			userWar2 = dao.userWar2(UserId);
			userWar3 = dao.userWar3(UserId);
			
			if(userWar1=="")
			{userWar3="null";}
			if(userWar2=="")
			{userWar3="null";}
			if(userWar3=="")
			{userWar3="null";}
			
			// 경고 내용을 UserWarning.jsp 로 보냄
			mav.addObject("userWar1", userWar1);
			mav.addObject("userWar2", userWar2);
			mav.addObject("userWar3", userWar3);
			mav.setViewName("user/UserWarning.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	

}
