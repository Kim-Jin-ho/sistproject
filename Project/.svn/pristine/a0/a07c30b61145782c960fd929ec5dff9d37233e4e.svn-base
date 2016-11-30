package class3.com.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MembershipReservationsPopupController implements Controller
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
		System.out.println(name);
		String tel = request.getParameter("tel");
		System.out.println(tel);
		
		MembershipReservationsDTO dto = null;
		try
		{
			dto = dao.estimate(name, tel);
			mav.addObject("dto", dto);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			mav.setViewName("/error500.jsp");
		}
	
		mav.setViewName("/company/CompanyMembershipReservationsPopup.jsp");
		
		return mav;
	}
}
