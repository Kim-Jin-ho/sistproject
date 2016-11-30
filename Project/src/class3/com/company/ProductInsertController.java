package class3.com.company;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductInsertController implements Controller
{
	private IProductInsertDAO dao;
	
	public void setDao(IProductInsertDAO dao)
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
		
		int n = 0;
		try
		{	
			// 아직 미구성
			//ArrayList<ProductNomalInsertDTO> normalUpdate = dao.normalUpdate(saNum);
			// 대 카테고리 (웨딩홀, 스튜디오, 드레스, 메이크업)
			ArrayList<ProductNomalInsertDTO> normalBigCtr = dao.normalBigCtr(saNum);
			// 소 카테고리 (브론즈홀, 실버홀, 골드홀)
			ArrayList<ProductNomalInsertDTO> normalSmallCtr = dao.normalSmallCtr(saNum);
			// 회사 정보를 전송 (기업명, 주소, 홈페이지 등)
			ProductNomalInsertDTO normalInfo = dao.normalInfo(saNum);
			
			ArrayList<ProductNomalInsertDTO> normalBigItem = dao.normalBigItem(saNum);
			
			// 대 카테고리의 내용을 배열로 만듦
			String[] bigArr = dao.bigItem(saNum);
			
			for (int i = 0; i < normalBigItem.size(); i++)
			{
				ArrayList<ProductNomalInsertDTO> normalSmallItem = dao.normalSmallItem(saNum, bigArr[i]);
				mav.addObject("normalSmallItem" + i, normalSmallItem);
			}
			
			mav.addObject("bigArr", bigArr);
			
			/*
			mav.addObject("normalUpdate", normalUpdate);
			mav.addObject("normalBigCtr", normalBigCtr);
			mav.addObject("normalSmallCtr", normalSmallCtr);
			*/
			// 회사 정보를 전송
			mav.addObject("normalInfo", normalInfo);
						
			mav.setViewName("/company/CompanyProductInsert.jsp");
	
			
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
			mav.setViewName("/error500.jsp");
		}
		
		return mav;
	}
}
