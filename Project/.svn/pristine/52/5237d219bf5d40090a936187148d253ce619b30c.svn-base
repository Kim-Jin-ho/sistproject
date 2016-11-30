package class3.com.company;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MembershipConsultingController implements Controller
{
	private IMembershipConsultingDAO dao;
	
	public void setDao(IMembershipConsultingDAO dao)
	{	
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		//session.setAttribute("checkname",name);
		
		// 세션을 받아옴 (사업자번호, 사업자 이름)
		String saNum = (String)session.getAttribute("checkid");
		String name = (String)session.getAttribute("checkname");
		//String checkNum = (String)session.getAttribute("checknum");
		
		
		
		try
		{	
			ArrayList<MembershipConsultingDTO> list = dao.list(saNum);
			
			
			mav.addObject("list", list);
						
			mav.setViewName("/company/CompanyMembershipConsulting.jsp");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
			mav.setViewName("/error500.jsp");
		}
		
		return mav;
	}
}
