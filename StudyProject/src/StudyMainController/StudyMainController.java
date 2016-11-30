package StudyMainController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMainSaveDAO;


public class StudyMainController implements Controller
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
		String mid = "";
		if (nickname == null)
		{
			mav.setViewName("WEB-INF/jsp/StudyRoom/StudyMain.jsp");
		}else
		{
			try
			{
				mid = dao.getMid(nickname);
				save = dao.getSave(mid);
				
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
			mav.setViewName("WEB-INF/jsp/StudyRoom/StudyMain.jsp");	
		}
		
		return mav;
	}
}

/*
@Override
public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
{
ModelAndView mav = new ModelAndView();
mav.setViewName("WEB-INF/jsp/StudyRoom/StudyMain.jsp");
return mav;
}*/
