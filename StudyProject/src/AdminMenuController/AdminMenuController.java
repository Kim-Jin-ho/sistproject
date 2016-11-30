package AdminMenuController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.AdminMenuDAO;
import dto.admin;

public class AdminMenuController implements  Controller
{
	private AdminMenuDAO dao;

	public void setDao(AdminMenuDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ArrayList<admin> list = new ArrayList<admin>();
		String region = request.getParameter("search");
		try
		{
			System.out.println(region);
			list = dao.list(region);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:item.jsp");
		mav.addObject("list",list);
		return mav;
	}
	
}
