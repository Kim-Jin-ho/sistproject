package class3.com.company;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MembershipReservationsAjaxController implements Controller
{
	private IReservationsManagementDAO dao;
	
	public void setDao(IReservationsManagementDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		String name = request.getParameter("name");
		String text = request.getParameter("text");

		
		if (text.equals("대기"))
			text = "1";
		else if (text.equals("취소"))
			text = "2";
		else if (text.equals("완료"))
			text = "3";

		
		String saNum = "3333333333";
		
		try
		{	
			dao.updateSelect(text, name);
			ArrayList<MembershipReservationsDTO> resList = dao.resList(saNum);
			
			mav.addObject("resList",resList);
			mav.setViewName("/company/CompanyMembershipReservationsAjax.jsp");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
			mav.setViewName("/error500.jsp");
		}

		
		return mav;
	}
}
