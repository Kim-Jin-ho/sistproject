package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomViewUpdateAjax implements Controller
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
		
		int srId = Integer.parseInt(request.getParameter("num"));
		int scId = Integer.parseInt(request.getParameter("scId"));
		
		ArrayList<SreBoard> reList = new ArrayList<SreBoard>();
		
		try
		{
			reList = dao.reList(srId);	
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		mav.addObject("scId", scId);
		mav.addObject("reList", reList);
		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomViewUpdateAjax.jsp");
		
		
		return mav;
	}
}
