package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.AdminMenuDAO;
import dao.SreBoardDAO;
import dto.SreBoard;

public class MemberRoomMailController implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ArrayList<SreBoard> list = new ArrayList<SreBoard>();
		
		try
		{
			/*list = dao.list();*/
			System.out.println(list);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomMain.jsp");
		mav.addObject("list",list);
		
		return mav;
	}
}
