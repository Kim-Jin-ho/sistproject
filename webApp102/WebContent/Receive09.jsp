<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String msg = (String)request.getAttribute("msg"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 리다이렉트 한 페이지 -->
<div>
	<h2>리다이렉트한 페이디</h2>
	<hr>
</div>
<h3>이름 : <%=name%></h3>
<h3>내용 : <%=msg %></h3>

<!-- 페이지 흐름 -->
<!-- 
	① 리다이렉트 (Send09.jsp -> Send09_re.jsp -> Receive09.jsp)
	   
	   리다이렉트는 클라이언트가 지정한 주소(response.sendRedirect("Receive09.jsp"))를 
	   서버에 재요청 하는것.
	   
	   처음 요청한 request 객체는 리다이렉트로 넘어가는 과정에서 사라진다.
	   요청이 클라이언트 단위에서 새로 요청하는 것이기 때문에 속도가 느리다.
	   DB에서 insert, update, delete 하고나면
	   리다이렉트를 지정해야만 수정된 내용을 확인할 수 있다.
	   브라우저의 주소창을 확인해 보면 최종 도착 페이지에 해당하는
	   『Receive09.jsp』로 확인된다.
	
	② 포워딩 (Send09.jsp -> Send09_for.jsp -> Receive09.jsp)
	   
	   포워드는 서버 내에 수신된 데이터를 포워딩한 주소로 넘겨주는 것
	   처음 요청한 request 객체가 유지된다.
	   서버 내부에서 주소가 변경된 것이기 때문에 클라이언트 입장에서는 이 사실을 알지 못한다.
	   그래서 클라이언트에게 보이는 주소는 포워딩 이전 주소만 노출된다.
	   보안 측면에서 유리할 수 있다.
	   포워딩 시 재전송하는 데이터를 가감할 수 있다.
	   (setAttribute(), getAttribute() 메소드 사용)
	   
	   ※ setAttribute(), getAttribute() 는 문자열 뿐만 아니라 객체를 넘길 수 있다.
	   
	   서블릿에서 작헌한 결과를 클라이언트 출력 화면을 만드는 JSP 로 넘길 때
	   포워딩을 많이 사용한다.
	   브라우저의 주소창을 확인해 보면 최종 도착 페이지가 아닌
	   『Send09_for.jsp』로 확인된다. 
 -->
</body>
</html>