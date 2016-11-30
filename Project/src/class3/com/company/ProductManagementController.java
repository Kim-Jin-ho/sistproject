package class3.com.company;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ProductManagementController implements Controller
{
	private IProductManagementDAO dao;
   
	public void setDao(IProductManagementDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();

		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		// session.setAttribute("checkname",name);

		// 세션을 받아옴 (사업자번호, 사업자 이름)
		String saNum = (String) session.getAttribute("checkid");
		String name = (String) session.getAttribute("checkname");
		// String checkNum = (String)session.getAttribute("checknum");

		try
		{
			// 일반 상품 정보 출력
			ArrayList<ProductManagementDTO> nomarList = dao.normalList(saNum);
			ArrayList<ProductManagementDTO> discountList = dao.discountList(saNum);
			ArrayList<ProductManagementDTO> advtList = dao.advtList(saNum);

			// 세션에서 받은 기업명을 전달
			mav.addObject("name", name);

			// dao에서 얻은 정보를 전달
			mav.addObject("nomarList", nomarList);
			mav.addObject("discountList", discountList);
			mav.addObject("advtList", advtList);

			// 위 데이터들과 함께 아래의 뷰를 출동시킴
			mav.setViewName("/company/CompanyProductManagement.jsp");

		} catch (Exception e)
		{
			System.out.println(e.toString());
			// 만약 예외가 발생된다면 500error 페이지가 출동!!
			mav.setViewName("/error500.jsp");
		}

		return mav;
	}
}
