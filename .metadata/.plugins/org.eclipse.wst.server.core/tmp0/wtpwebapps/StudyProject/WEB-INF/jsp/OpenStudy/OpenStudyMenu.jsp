<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=cp%>/jsp/css/bootstrap.css">
<style type="text/css">
	a
	{
		color: gray;
		font-weight: normal;
	}
</style>
</head>
<body>
<div class="openstudy" style="width: 10%;  margin:10px; ">
	<!-- 개설된 스터디 페이지 메인 화면으로 이동 -->
	<a href="OpenStudyMain.jsp"><img width="100px;" height="100px;" src="../OpenStudy/img/hi.jpg"/></a>
	<!-- 1번 메뉴(스터디정보, 게시판)영역 -->
	<div class="mainstate" style="width: 150px; text-align: left;">
		<dl class="mainstudystate">
			<dt>&nbsp;스터디장 : </dt>
			<dt>&nbsp;회원  수 : </dt>
			<dt>&nbsp;<a href="#">내가 쓴 글 확인</a></dt>
			<dt><button type="button" data-toggle="modal" data-target="#myModal">스터디 탈퇴</button></dt>
		</dl>
		<dl class="mainstudygesi">
			<dt id="1">&nbsp;<a href="#">자유게시판</a></dt>
			<dt id="2">&nbsp;<a href="#">투표</a></dt>
			<dt id="3">&nbsp;<a href="#">자료실</a></dt>
		</dl>
		<dl class="mainstudylist">
			<dt>&nbsp;<a href="#">스터디원 목록</a></dt>
		</dl>
	</div>
</div>	


<!-- 모달  -->
<!-- 모달 팝업 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel" style="color: red;">경고!!</h4>
      </div>
      <div class="modal-body" >
      	<a style="font-weight: bold; color: black;">해당 스터디를 탈퇴하셔도 작성하신 게시물이 자동으로 삭제되지는 않습니다.<br>
      	정말로 탈퇴하시겠습니까?</a>
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-primary" onclick="">확인</button>
		<button type="button" class="btn btn-default"  data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>