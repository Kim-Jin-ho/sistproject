package class3.com.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserCommentListController implements Controller
{
	private IUserDAO dao;

	public void setDao(IUserDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<UserDTO> userCommentList = new ArrayList<UserDTO>();
		
		HttpSession session = request.getSession();
		String UserId = (String)session.getAttribute("checkid");
		
		try
		{
			// userCommentList() 메소드로 userCommentList 변수에 담기
			userCommentList = dao.userCommentList(UserId);
			
			// 회원 상품평 리스트를 UserCommentList.jsp 로 보냄
			mav.addObject("userCommentList", userCommentList);
			mav.setViewName("user/UserCommentList.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
	
	

}
