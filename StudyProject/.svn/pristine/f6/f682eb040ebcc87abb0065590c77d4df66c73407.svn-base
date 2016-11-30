package faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IFAQDAO;

public class FAQUpdateController implements Controller
{
	private IFAQDAO dao;

	public void setDao(IFAQDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();

		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();

		// 세션을 받아옴 (사업자번호, 사업자 이름)
		//String saNum = (String)session.getAttribute("checkid");
		//String name = (String)session.getAttribute("checkname");
		
		String title = request.getParameter("title");
		String comment = request.getParameter("comment");
		
		int cd = Integer.parseInt(request.getParameter("cd"));
		
		comment = comment.replaceAll("\n", "<br>");
		
		try
		{  
			dao.update(cd, title, comment);
			
			mav.setViewName("redirect:FAQ.room");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());			
		}

		return mav;
	}
}
