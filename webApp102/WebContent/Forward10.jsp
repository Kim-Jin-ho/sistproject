<%@ page contentType="text/html; charset=UTF-8"%>
<% 

	// 포워딩 및 리다이렉트 실습(Forwar10.jsp)
	//-- 중간에서 연산 처리
	
	
	request.setCharacterEncoding("UTF-8");
	
	//데이터 수신
	// 정수를 담아낼 변수 선언 및 담기
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	// 연산자를 담아낼 변수 선언 및 담기
	String yun = request.getParameter("y");

	// 연산 결과를 담고 포워딩 시킬 변수 선언
	String result = "";
	
	
	if(yun.equals("1"))
		result = String.format("%d + %d = %d", num1,num2,(num1+num2));
	if(yun.equals("2"))
		result = String.format("%d - %d = %d", num1,num2,(num1-num2));
	if(yun.equals("3"))
		result = String.format("%d * %d = %d", num1,num2,(num1*num2));
	if(yun.equals("4"))
		result = String.format("%d / %d = %f", num1,num2,((double)num1/num2));
	
	/* 	
	// 넘겨 받은 연산자에 다른 연산 하기
	switch (yun)
	{
		case "1" : result = String.format("%d + %d = %d", num1,num2,(num1+num2));break;
		case "2" : result = String.format("%d - %d = %d", num1,num2,(num1-num2));break;
		case "3" : result = String.format("%d * %d = %d", num1,num2,(num1*num2));break;
		case "4" : result = String.format("%d / %d = %f", num1,num2,((double)num1/num2));break;
	}
	*/
	// 결과 데이터 재전송 (forwar() 메소드 이용)
	request.setAttribute("result",result);
	
	// check!!
	RequestDispatcher dispatcher = request.getRequestDispatcher("Receive10.jsp");
	dispatcher.forward(request, response);	
	
	/*-----------------------------------------------------------------------------------------
	※ 『RequestDispatcher』 인터페이스는 『forward()』 와 『include()』 만 있다.
	
	※ 처리 과정 및 개념
	
	   일반적으로 HttpServlet 을 상속받는 클래스 	-> 서블릿
	   
	   이렇게 작성된 클래스 내부에는
	   실제 요청을 서비스하는 『doGet()』 과 『doPost()』 메소드가
	   정의되어 있으며
	   
	   컨테이너는 『HttpServlet』의 인스턴스를 생성하고,
	   『init()』 메소드를 실행해 주고,
	   이 메소드에 의해 매핑된 URL에 (페이지 요청방식에 따라)
	   doGet() 과 doPost() 중 한 메소드를 호출해 주고(실행시켜주고)
	   컨테이너가 종료될 때 『destroy()』 메소드를 호출해주고
	   관련된 처리 과정이 마무리된다.
	   
	   결국 『HttpServlet』은
	   하나의 인스턴스만 생성되어 멀티 스레딩으로 돌아가게 된다.
	   
	   이렇게 구성되는 『HttpServlet』의 상속된 클래스의 인스턴스는
	   스레드에 안전하게 설계(스레드 세이프티)되어야 하고
	   따라서 스레드를 안전하게 설계하지 않은 경우
	   상위 클래스를 마구 접근하게 되어 에러가 발생하게 된다.
	   
	   이와 같은 이유로 환경 설정이나 J2EE 서비스에 관한 내용은
	   『ServletContext』에서 할 수 있게 한다.
	   이 『ServletContext』는 『getServletContext』로만 받을 수 있다.
	   (이 『ServletContext』 
			동기화가 제대로 구현되어 있을 것이라고 예측할 수 있겠다.)
	   
	   이로인해 『ServletContext』의
	   『setAttribute()』나 『getAttribute()』를
	   스레드 걱정없이 마음대로 읽고 쓸 수 있게 되는 것이다.
	   
	   『ServletContext』 의 또다른 커다란 기능 중 하나는
	   다른 서블릿 인스턴스를 가져올 수 있따거나
	   서블릿 환경 설정값을 가져올 수 있는 기능이다.
	   
	   『RequestDispatcher』 역시 그 기능 중의 하나이다.
	   사전적인 의미로는 요청을 제공하는 도구
	   즉, 요청을 보내주는 인터페이스이다.
	   
	   현재 요청을 다른 서블릿(혹은 jsp ) 으로 보내야 하는 상황
	   그런데 , 위에 언급한 바와 같이 서블릿의 인스턴스는 하나만 생성되고
	   이것이 멀티 스레딩으로 돌아가고 있따.
	   
	   그렇게 때문에 새로운 서블릿을
	   그 서블릿을 실행하는 것만을도는 안되고
	   이미 돌아가고 있는 서블릿 인스턴스의 스레드를 
	   하나더 추가해야한다.
	   그리고 이것은 서블릿 개발자가 처리해야할 영역을 벗어났기 때문에
	   이 일을 『Dispatcher』가 대신 수행해 준다는 것이다.
	   
	   하지만, 『Dispatfcher』는
	   『HttpSerlvetRequest』,『HttpSerlvetResponse』 를 생성해 줄 수는 없다.
	   그렇기 때문에『Dispatfcher』 가 생성해 준 새로운 서블릿 스레드를 
	   실행시키기 위해 『doGet()』이나 『doPost()』를 호출해야 한다.
	   
	   이와 같은 이유로
	   『dispatcher.forward(request, response);』 구문을 통해
	   request 와 response 를 넘겨 주는 것이다.
	
	-----------------------------------------------------------------------------------------*/
%>
