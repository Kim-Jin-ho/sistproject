<!-- 유저패스워드 결과값 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" id="searchpadding">
	<div class="form-group">	
		<h3><label for="name" class="col-sm-6 control-label"> 귀하의 패스워드는 :"  ${getuserpw } "입니다.</label></h3><br>
		<h3><label for="name" class="col-sm-6 control-label"> 안전을위해 비밀번호를 변경해주세요.</label></h3>
	</div>
	</div><br>
	<div class="form-group">
		<div class="col-md-3 col-md-offset-1">
		<a href="javascript:opener.location.href='<%=cp %>/main/login.jsp'; self.close()"><button type="button" class="btn btn-primary">로그인</button></a>
		</div>
		<div class="col-md-1">
		<a href="javascript:opener.location.href='<%=cp %>/main/main.jsp'; self.close()"><button type="button" class="btn btn-primary">메인으로</button></a>
		</div>
	</div>
</body>
</html>