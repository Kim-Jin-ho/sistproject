<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 (스크립트 릿 영역)
	
	// 한글 수신을 위한 인코딩 방식 지정(이 처리를 먼저 수행)
  	request.setCharacterEncoding("UTF-8");
	
				 // get.Paramet("") 은 객체
				 // rerequest.getParameter("userName"); 문자열
	String name = request.getParameter("userName");		// 사용자로부터 입력받은 값 String 으로 담아내기
	String tel = request.getParameter("userTel");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h2>가입 확인</h2>
	<hr>
</div>
<div>
      <%=name %>님, 회원 가입이 완료되었습니다.<br>
	       회원님께서 등록하신 전화번호는 <%=tel %> 입니다.
</div>

</body>
</html>

