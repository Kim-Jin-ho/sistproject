package class3.com.test;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class wedding_select_Controller implements Controller
{	
	private Iwedding_select_DAO dao;
	
	public void setDao(Iwedding_select_DAO dao)
	{
		this.dao = dao;
	}

	// wedding_select.jsp 컨트롤러
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		
		//String userId = (String)session.getAttribute("checkid");
		String userId = "LJH";
		//String name = (String)session.getAttribute("checkname");
		String userName = "이준환";
		
		// 상품코드를 받아와서 넣는다.
		//String cd = request.getParameter("cd");
		String cd = "1";
		
		
		
		try
		{	
			// 상세정보 / 이름, 홈피, 주소
			wedding_select_DTO dto = dao.list(cd);
			
			// 상품평 / 글, 날짜, 평점, 아이디
			ArrayList<wedding_select_DTO> prodCmtResult = dao.prodList(cd);
			
			// 상품평 댓글 / 글, 날짜 , 아이디
			ArrayList<wedding_select_DTO> prodRvwCmtResult = dao.prodRvwList();
			
			// 상담하기 내역 / 글, 날짜, 아이디
			ArrayList<wedding_select_DTO> advCmtResult = dao.advList(cd);
			
			// 상담하기 댓글 / 글, 날짜, 아이디
			ArrayList<wedding_select_DTO> advCmtRvwResult = dao.advRvwList();

			// 찜한 상태인지 확인하기
			String selResult = dao.selList(cd, userId);
			
			// 이미지 리스트 뽑아내기
			ArrayList<wedding_select_DTO> imgList = dao.imgList(cd);
			
			String[] srcScore = dao.srcScore(cd);
			
			mav.addObject("dto", dto);
			mav.addObject("prodCmtResult", prodCmtResult);
			mav.addObject("prodRvwCmtResult", prodRvwCmtResult);
			mav.addObject("advCmtResult", advCmtResult);
			mav.addObject("advCmtRvwResult", advCmtRvwResult);
			mav.addObject("imgList", imgList);
			mav.addObject("srcScore", srcScore);
			mav.addObject("selResult",selResult);
			
			
			mav.setViewName("/youngjin/wedding_select.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			mav.setViewName("/error500.jsp");
		}
		
		return mav;
	}
	
}
