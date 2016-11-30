<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글선택 화면</title>
</head>
<body>
	<!-- 소메뉴 불러오기 -->
	<div class="smallMenu" style="margin: 10px;">
		<c:import url="SmallMenu.jsp"></c:import>
	</div>
	<br>
	
	<!-- 대메뉴 불러오기 -->
	<div class="mainMenu" style="margin: 10px;">
		<c:import url="MainMenu.jsp"></c:import>
	</div>
	<br>
	
	<!-- 왼쪽 메뉴 불러오기 -->
	<div style="float:left; width: 120px; padding: 10px;">
		<c:import url="OpenStudyMenu.jsp"></c:import>
	</div>
	
	<div class="view" style="float:left; ; width: 80%; margin: 20px; ">
		<div class="highMenu"style="float:left; width: 80%; padding: 10px;">
		<span>자유 게시판</span>
		<br>
			<button type="button">글쓰기</button>
			<hr style="margin: 1px;"></hr>
			
			<!-- 글 제목 및 게시판 이름 -->
			<dl class="title "style="margin: 0px;">
				<dt><a>안녕하세요</a> | <a>자유게시판</a></dt>
				<dd></dd>
			</dl>
			<hr style="margin: 1px;"></hr>
			
			<!-- 아이디 및 글 정보 -->
			<a>jinho528</a> | 조회 : 11 | 추천 : 12 | 2016.05.22 01:55	
			<hr style="margin: 1px;"></hr>
			<dl style="float: left; width:100%; text-align: left;">
				<dd style="text-align: left; padding: 10px; ">안녕하세요</dd>	
				<dd style="text-align: left; padding: 10px; ">안녕하세요</dd>
				<dd style="text-align: left; padding: 10px; ">안녕하세요</dd>
				<dd style="text-align: left; padding: 10px; ">안녕하세요</dd>	
				<dd><hr style="margin: 1px;"></hr></dd>			
			</dl>
			<!-- 신고 버튼 -->	
			<dl style="text-align: right; width:100%; padding: -1px; ">
				<dd><a href="#" data-toggle="modal" data-target="#myModal3">신고</a></dd>
			</dl>
			
			<!-- 수정 삭제 버튼 -->
			<button type="button">수정</button>
			<button type="button">삭제</button>
			
			<!-- 댓글 목록 -->
			<dl>
			
			</dl>
			
			<!-- 댓글 입력 -->
			<dl style="text-align: left; width:100%; padding: -1px; ">
				<dd style="text-align: left; ">
					<textarea rows="5" cols="70"></textarea>
					<button type="button">댓글입력</button>
				</dd>
			</dl>
			<!-- 페이징 처리 부분 -->
			<dl style="padding: 0px;">
				<dd>
					<span>
						<a href="#">다음글</a><br>
						<strong>현재글 : 으아아아아악</strong><br>
						<a href="#">이전글</a><br>
					</span>
				</dd>	
			</dl>
		</div>
	</div>
	
	<!-- 모달  -->
	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel" style="color: red;">경고!!</h4>
				</div>
				<div class="modal-body" >
					<label><input type="radio" id="OSRadio" name="OSRadio" value="1">글도배</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" id="OSRadio" name="OSRadio" value="2">욕설</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
					<label><input type="radio" id="OSRadio" name="OSRadio" value="3">음란글</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label><input type="radio" id="OSRadio" name="OSRadio" value="4">광고</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
					<label><input type="radio" id="OSRadio" name="OSRadio" value="5">정치성 글로 분란 조성</label><br>
					기타 : <input type="text" id="OSRadio_text" name="OSRadio_text"> 
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