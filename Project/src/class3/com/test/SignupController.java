//로그인창에서 회원가입시 일반회원, 기업회원 선택에 따라서 회원가입 체크박스 버튼이 달라지게 하는 컨트롤러!!

package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class SignupController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{			
			//numcheck : login.jsp 페이지에서 기업인지 회원인지 체크하기위한 변수
			String numcheck = request.getParameter("num");
									
			mav.addObject("numcheck", numcheck);
			mav.setViewName("main/signUp.jsp");
									
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
		
	}
}