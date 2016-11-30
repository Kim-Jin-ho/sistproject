package class3.com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmployeeController extends HttpServlet{
   
   private static final long serialVersionUID = 1L;

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
      doGetPost(request, response);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
      doGetPost(request, response);
   }
   
   protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
      request.setCharacterEncoding("utf-8");
     
      // 내용 작성
      //-- 요청 주소 분석 필수~!!!
      
      String uri = request.getRequestURI();
      
      // 테스트
      //PrintWriter out = response.getWriter();
      //out.println(uri);
      
      // 모델 객체의 특정 메소드 호출을 위한 객체 생성(모델 객체)
      EmployeeModel model = new EmployeeModel();
      String view = "";
      
      if(uri.indexOf("employeelist.do") != -1)
         view = model.employeeList(request, response);
      
      if(uri.indexOf("employeeinsertform.do") != -1)
    	  view = model.employeeinsert(request, response);
      
      // view 객체 연결
      //--> forward() 또는 sendRedirect()
      if(view.indexOf("redirect:") != -1)
      {
         
         view = view.substring(9);
         System.out.println(view);
         response.sendRedirect(view);
         
      }else
      {
         RequestDispatcher dispatcher = request.getRequestDispatcher(view);
         dispatcher.forward(request, response);
      }
      
      /*RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeList.jsp");
      dispatcher.forward(request, response);*/
      
   }

}