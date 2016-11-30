package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMemberDAO;

public class JoinNicknameChkController implements Controller
{
	private IMemberDAO dao;
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			String nickname = request.getParameter("nicnic");
			
			int daoNickname = dao.getNickname(nickname);	
			
			int nicknameokok = 0;
			
			if (daoNickname != 0)
			{
				nicknameokok = 1;
			}
			
			mav.addObject("nicknameokok", nicknameokok);
			mav.setViewName("/WEB-INF/jsp/join/join_value_ajax.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
