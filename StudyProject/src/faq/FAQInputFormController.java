package faq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IFAQDAO;

public class FAQInputFormController implements Controller
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
		
		// 페이지를 오픈할때 cd값이 있는지 확인한다.
		int cd = 0;
		
		// 만약 cd를 get방식으로 받았다면
		if (request.getParameter("cd") != null)
			cd = Integer.parseInt(request.getParameter("cd"));
		
		FAQDTO dto = null;
		
		try
		{  
			// cd값이 있다면 수정이므로, 수정 모드로 진입한다!
			if (cd != 0)
			{
				dto = dao.updateList(cd);
				mav.addObject("cd", cd);
			}
			
			mav.addObject("dto", dto);
			mav.setViewName("WEB-INF/jsp/FAQ/FAQInputForm.jsp");
		}
		catch (Exception e)
		{
			System.out.println(e.toString());			
		}

		return mav;
	}
}
