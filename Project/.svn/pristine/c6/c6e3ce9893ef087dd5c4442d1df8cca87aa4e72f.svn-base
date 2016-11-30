package class3.com.test;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CmpnyListController implements Controller
{

	private ICmpnyDAO dao;

	
	
	
	public void setDao(ICmpnyDAO dao)
	{
		this.dao = dao;
	}




	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
/*		// 로그인 과정을 정상적으로 수행한 관리자만 접근 가능한 페이지
		HttpSession session = request.getSession();

		if (session.getAttribute("name") == null) // 관리자 로그인 시 sid 값을 줄건데 지금
													// null이다 if 로그인 했다 안했다.
													// 안했으면 로그인페이지로
		{
			// 로그인 폼 페이지로 화면을 전환할 수 있도록 처리
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:LoginForm.action");
			return mav;

		} else // 로그인 정상적으로 됐다 ① 로그인했는데 관리자가 아닌 경우 ② 로그인했는데 관리자인 경우
		{
			if (session.getAttribute("admin") == null)
			{
				// ①
				// 로그아웃 페이지로 화면을 전환할 수 있도록 처리
				ModelAndView mav = new ModelAndView();
				mav.setViewName("redirect:Logout.action");
				return mav;

			}
		}*/

		
		ArrayList<Cmpny> list = new ArrayList<Cmpny>();
		
		try 
		{
			list = dao.list();
			
		} catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/AdminCoMemberList.jsp");
		mav.addObject("list",list);
		
		return mav;
		
		
	}

}
