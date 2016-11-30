<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = "투표";
	String id = "hd";
	
	// 중복 투표를 막기 위한 변수
	int add= 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		// 체크 박스 생성 후 잘 되는 지 확인하기
		$("#hd1").change(function(){
			if($("#hd1").is(":checked"))
			{
			    alert("체크박스 체크했음!");
			}else{
			    alert("체크박스 체크 해제!");
			}
		});
		
		// 복수 선택에 체크가 안되경우 0으로 반환 시키므로
		// 체크박스 복수 선택 불가
		if($("#z").val()==0)
		{
			//중복 체크 일 시 제한하기
		    $('input[type="checkbox"][name="group1"]').click(function(){
		        //클릭 이벤트 발생한 요소가 선택 상태일 경우
		        //체크된 요소 확인후 복수개 선택되있을 경우 체크 해제
		        if ($(this).prop('checked') 
		        && $('input[type="checkbox"][name="group1"]:checked').size()>1) {
		            $(this).prop('checked', false);
		        alert('두개 이상 선택할 수 없습니다.');
		        }
		    });	
		}
	});
</script>
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
	<!-- 뷰 구성 -->
	<div style="float:left; width: 80%; padding: 10px;">
		<!-- 제목 구성 -->
		<dl class="title">
			<dt><a>안녕하세요</a> | <a>투표게시판</a></dt>
			<dd></dd>
		</dl>
		<hr style="margin: 1px;"></hr>
			
		<!-- 아이디 및 글 정보 -->
		<a>jinho528</a> | 조회 : 11 | 추천 : 12 | 2016.05.22 01:55	
		<hr style="margin: 1px;"></hr>
		<br>
	</div>
	<div style="float:left; width: 80%; padding: 10px;">
		<!-- 투표 선택 뿌려주기 -->
		<form action="OpenStudyVoteView.jsp" method="get">
		<dl>
			<dd>
				
				<!-- 테스트 하기 위해 반복문 임의로 생성하여 작성함.
				 실제 작성 시 foreach 사용할 것 -->
				<%for(int i=1; i<5; i++)
				{%>
					<input type="checkbox" name="group1" id="<%=id%><%=i%>" value="<%=name%><%=i%>"><%=name %><%=i %><br>
				<%}%>
				
			</dd>
		</dl>
		<span id="hi" style="display: none;"><input id="z"name="z"value="<%=add %>"></span>
		<!-- 확인 및 결과보기 -->
		<dl>
			<dd><button type="submit" >투표하기</button></dd>
			<dd><button type="button">결과보기</button></dd>
		</dl>
		</form>
	</div>
</body>
</html>