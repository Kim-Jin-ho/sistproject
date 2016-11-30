package StudyRoomCreateController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IShopDAO;
import dto.Shop;

public class ShopAddController implements Controller
{
	private IShopDAO dao;

	public void setDao(IShopDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		ModelAndView mav = new ModelAndView();
		
		
		String shopName = request.getParameter("shopName");
		String tel = request.getParameter("tel");
		String hour = request.getParameter("hour");
		String bukwi = request.getParameter("t_id");
		String dongkyung = request.getParameter("p_id");
		String holiday = request.getParameter("holiday");
		String roomCount = request.getParameter("roomCount");
		String yesno1 = request.getParameter("yesno1");
		String yesno2 = request.getParameter("yesno2");
		
		
		
		System.out.println("스터디룸 추가 내용");
		System.out.println(shopName);
		System.out.println(tel);
		System.out.println(hour);
		System.out.println(bukwi);
		System.out.println(dongkyung);
		System.out.println(holiday);
		System.out.println(roomCount);
		System.out.println(yesno1);
		System.out.println(yesno2);
		
		
	    Shop shop = null;
		
		
		try
		{
			
			shop = new Shop();
	    	
			
			shop.setShopName(shopName);
			shop.setTel(tel);
			shop.setHour(hour);
			shop.setBukwi(bukwi);
			shop.setDongkyung(dongkyung);
			shop.setHoliday(holiday);
			shop.setRoomCount(Integer.parseInt(roomCount));
			shop.setYesno1(yesno1);
			shop.setYesno2(yesno2);

			
			
			dao.shopAdd(shop);
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		mav.setViewName("WEB-INF/jsp/StudyRoom/AddSuccess.jsp");
		return mav;
		
	}
	
	
	
	
}