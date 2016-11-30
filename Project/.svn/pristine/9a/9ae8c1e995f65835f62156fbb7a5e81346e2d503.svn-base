package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CmpnyUpdateController  implements Controller
{
	private ICmpnyDAO dao; // 의존성 멤버주입을위해선 인터페이스 형의 자료형을 띄어야 하므로 멤버타입을 인터페이스 형으로 갖고 있어야한다.           
	
	public void setDao(ICmpnyDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView(); //결과값으로 반환하게 되는 모델객체 생성함!!!
		
		
		String id = request.getParameter("idNum1");
		String name = request.getParameter("name");
		String cmpny_ctgy_id = request.getParameter("cmpny_select"); //기업카테고리
		String pwd = request.getParameter("password"); //패스워드
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1+"@"+email2;            //이메일
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String tel = tel1+"-"+tel2+"-"+tel3; //전화번호	
		String hmpg = request.getParameter("homepage");
		String ctnt = request.getParameter("cmpytextrea");//기업내용
		String addr_no = request.getParameter("strZipcode_1");
		String addr1 = request.getParameter("strZipcode_2");
		String addr2 = request.getParameter("strZipcode_3");
		System.out.println(name+cmpny_ctgy_id+pwd+email+tel+hmpg+ctnt+addr_no+addr1+addr2);
		Cmpny cmpny = null;				
		int check = 0;
		
		try
		{ 
			cmpny = new Cmpny();
			cmpny.setCmpny_Ctgy_Id(Integer.parseInt(cmpny_ctgy_id));
			cmpny.setName(name);
			cmpny.setCtnt(ctnt);	
			cmpny.setPwd(pwd);
			cmpny.setEmail(email);
			cmpny.setTel(tel);
			cmpny.setHmpg(hmpg);
			cmpny.setAddr_No(addr_no);
			cmpny.setAddr1(addr1);
			cmpny.setAddr2(addr2);
			cmpny.setCmpny_Id(id);
			check = dao.cmpnyupdate(cmpny);
			
			mav.addObject("check",check);
			mav.setViewName("main/cmpnyUpdate.jsp");
			System.out.println(check);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		 
		//URL에 대한 매핑주소를 넘겨준게 아니라, 직접적인 주소를 불러주는거임.
		//리다이렉트를 붙여주면 이 주소값으로 다시 돌아오게 해줌.!!!!!! 
		return mav;	
		
	}
}