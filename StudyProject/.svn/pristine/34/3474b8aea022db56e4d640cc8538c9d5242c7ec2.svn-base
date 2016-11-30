package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomViewRepleRecommendAjax implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		int scid = Integer.parseInt(request.getParameter("scid"));
		
		int recommend = 0;
		
		try
		{
			recommend = dao.repleRecommend(scid);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		mav.addObject("recommend", recommend);
		
		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomViewRepleRecommendAjax.jsp");
		
		
		return mav;
	}
}
