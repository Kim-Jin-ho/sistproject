package class3.com.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class CmpnyQnaUpdateController implements Controller
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
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String cd = request.getParameter("cd");
		
		try
		{
			CmpnyDTO dto = new CmpnyDTO();
			
			dto.setSbjct(subject);
			dto.setCtnt(content);
			dto.setCd(cd);
			
			// 가져온 변수로 cmpnyQnaUpdate() 메소드를 사용해 QNA 글 수정 등록
			dao.cmpnyQnaUpdate(dto);
			
			// 다시 CmpnyQnaList.love 으로 보내 수정된 글을 포함한 리스트 출력
			mav.setViewName("redirect:/CmpnyQnaList.love");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
		
	}
	

}
