package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomViewController implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		int srId = Integer.parseInt(request.getParameter("SRID"));
		System.out.println(srId);
		ArrayList<SreBoard> viewList = null; 
		ModelAndView mav = new ModelAndView();
		
		try
		{
			dao.hitUp(srId);
			
			viewList = dao.view(srId);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		mav.addObject("viewList",viewList);
		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomView.jsp");
		
		return mav;
	}

}
