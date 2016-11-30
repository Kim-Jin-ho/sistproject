package StudyMainController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMainSaveDAO;

public class StudyMainController_member implements Controller
{
	private IMainSaveDAO dao;

	public void setDao(IMainSaveDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String nickname = (String)session.getAttribute("nickname");
		String save = "";
		if (nickname == null)
		{
			mav.setViewName("redirect:StudyMain.room");
		}else
		{
			try
			{
				save = dao.getSave(nickname);
				
			} catch (Exception e)
			{
				System.out.println(e);
			}

			if (save ==null)
			{
				save = "0";
			}
			session.setAttribute("save", save);
			System.out.println(save);
			mav.setViewName("redirect:StudyMain.room");	
		}
		
		return mav;
	}
	
}
