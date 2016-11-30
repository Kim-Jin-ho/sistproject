package class3.com.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CmpnyQnaUpdateSendController implements Controller
{
	private ICmpnyDAO dao;

	public void setDao(ICmpnyDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		CmpnyDTO cmpnyQnaUpdateSend = new CmpnyDTO();
		
		String cd = request.getParameter("cd");
		
		try
		{
			// cmpnyQnaUpdateSend() 메소드로 cmpnyQnaUpdateSend 변수에 담기
			cmpnyQnaUpdateSend = dao.cmpnyQnaUpdateSend(cd);
			
			// 회원 QNA 글 내용을 수정페이지인 CmpnyQnaUpdate.jsp 로 보냄
			mav.addObject("cmpnyQnaUpdateSend", cmpnyQnaUpdateSend);
			mav.setViewName("company/CmpnyQnaUpdate.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	

}
