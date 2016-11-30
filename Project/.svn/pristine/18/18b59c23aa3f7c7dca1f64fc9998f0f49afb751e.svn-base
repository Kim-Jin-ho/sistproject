package class3.com.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MembershipConsultingAjaxController implements Controller
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
		String cd = request.getParameter("cd");
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
			dao.updateSelect(text, cd);

			mav.setViewName("/company/CompanyMembershipConsultingAjax.jsp");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
			mav.setViewName("/error500.jsp");
		}

		
		return mav;
	}
}
