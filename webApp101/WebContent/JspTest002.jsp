<%@ page contentType="text/html; charset=UTF-8"%>
<%!
	// 선언부
	// ※ 선언부 변수와 스크립트 릿 변수의 차이
	
	int a = 0;

	// 선언부 내부에서 함수 정의
	int sum(int x)
	{
		int s = 0;
		for(int i=1; i<=x; i++)
		{
			s+=i;			
		}
		return s;
	}
	
%>
<%
	// 스크립트 릿
	int b= 0;
	a++;
	b++;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>

	a : <%=a %><br>
	b : <%=b %><br>
	- 함수 호출 - 
	합 : <%=sum(100) %><br>
</div>
	<!-- 주석처리 ① -->
	<%-- 주석처리 ② --%>
	<!--  
		페이지 호출 및 실행 이후 새로고침을 반복해보면
		변수 a (선언부에 선언된 변수) 값만 계쏙 증가한다.
		변수 a 의 값만 계속 증가하는 이유를 확인하기 위해서는
		서블릿 코드를 확인해 봐야한다.
		
		
		파일경로
		C:\Users\sist\OneDrive\WebStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\webApp101\org\apache\jsp
		
		파일이름
		JspTest02_jsp.java
		
		변수 a 는 클래스(JspTest002_jsp)의 전역변수로
		선언된 것을 확인할 수 있다.
		이는 객체가 소멸되기 전까지는 계속 값이 유지된다는 것이다.
		반면, 변수 b  는 메소드(_jspService())의 지역 변수로
		선언되어 있다.
		
		『_jipInit()』메소드와 『_jspDestory()』 메소드는
		서비스 시작과 끝일 때 한 번 씩만 실행되는 메소드이다.
		
		반면... 『_jspService()』메소드는
		브라우저에 의해 페이지가 호출될 때 마다
		매번 실행되는 메소드이다.
		
		
		JSP 페이지의 스크립트 릿 영역에서 선언된 모든 변수는
		이 『_jspService()』메소드의 지역 변수가 된다.
		
		JSP 페이지의 선언부 영역에서 선언된 모든 변수는
		클래스의 전역 변수(인스턴스 변수)가 된다.
		
		※ JSP 페이지에서 메소드 정의 시
		   스크립트 릿 영역 내부에서는 정의할 수 없다.
		   이는, 서블릿으로 변환되는 과정에서
		   메소드 내부에서 메소드가 정의되는 사오항이 발생하므로
		   잘못된 표현인다.
		   
		   선언부의 사용빈도는 낮이만
		   메소드는 선언부 내부에만 정의할 수 있다.
		
	 -->
	
</body>
</html>