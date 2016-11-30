<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test1.jsp</title>
</head>
<body>
<div>
	<h2>파일 시스템</h2>
	<hr>
</div>

<div>
	<!-- 『enctype="multipart/form-data"』 : 파일 업로드 처리 시 필수 속성 -->
	<!-- 이 속성은 파일을 물리적으로 업로드 처리하기 위해서 필수적인 속성이다. -->
	<!-- 이속성을 구성한 후 다시 전송 과정을 테스트 한다. -->
	<!-- 테스트를 수행하면 이름과 파일 모두 null 로 수신된 것을 확인할 수 있다.
		 이는 바이너리 값을 getParameter 를 통해 수신할 수 없기 때문이다.	     
	-->
	<!-- ①  -->
	<!-- <form action="test2.jsp" method="post"> -->
	 
	<!-- ② -->
	<!-- <form action="test2.jsp" method="post" enctype="multipart/form-data"> -->
	 
	<!-- ③ -->
	<!-- <form action="test3.jsp" method="post" enctype="multipart/form-data"> -->
	
	<!-- ④ -->
	<form action="test4.jsp" method="post" enctype="multipart/form-data">
		이름 <input type="text" name="name"><br>
		파일 <input type="file" name="upload"><Br>
		<button type="submit">전송</button>
	</form>
</div>
</body>
</html>