package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomViewUpdateController implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		int srId = Integer.parseInt(request.getParameter("srId"));
		System.out.println("srId = " + srId);
		int scId = Integer.parseInt(request.getParameter("scId"));
		System.out.println("scId = " + scId);
		String updateSrcontent = request.getParameter("updateSrcontent");
		System.out.println("updateSrcontent = " + updateSrcontent);
		
		
		
		try
		{
			dao.reUpdate(scId, updateSrcontent);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}


		mav.setViewName("redirect:StudyRoomView.room?SRID=" + srId);
		
		return mav;
	}

}
