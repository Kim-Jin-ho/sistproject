<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 FAQ 글쓰기(AdminCoFAQInsertForm.jsp)</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	
	function sendIt()
	{
		var f = document.myForm;
//---------------------------------------------------------------------------		
		 var str = f.subject.value;
		str = str.trim(); // javascript 에는 trim이 없다. (외부에 생성 : util.js)
		
		if(!str)
		{
				alert("\n제목을 입력하세요.");;
				f.subject.focus();
				return;
		} 
		f.subject.value = str;
//---------------------------------------------------------------------------		
		str = f.content.value;
		
		if(!str)
		{
			alert("\n 내용을 입력하세요.");
			f.content.focus();
			return;
		}
//---------------------------------------------------------------------------		
<%-- 		// f.action = "url주소" 를 넣어주면 
		           // 밑에 form action = "url주소"  를 넣어준것과 같은 뜻이다.!! 
		f.action = "<%=cp%>/bbs/Created_ok.jsp";
		
		f.submit(); --%>
	}
</script>
</head>
<body>


	<div id="wrap">
		<%-- 전체 틀 --%>

		<div id="header">
			<c:import url="AdminTitle.jsp"></c:import>
			<%-- 타이틀, gnb --%>
			<c:import url="AdminMenu.jsp"></c:import>
			<%-- 매뉴 --%>
		</div>


		<div id="container">
			<%-- 내용 --%>

			<form action="" name="myForm" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="subject" class="boxTF"
							maxlength="100" size="50"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" rows="10" cols="60"
								class="boxTA" style="resize: none;"></textarea></td>
					</tr>

					<tr>
						<td><button type="button" class="btn1" onclick="sendIt();">확인</button></td>
						<td><button type="button" class="btn1" onclick="location.href='AdminCoFAQList.jsp'">취소</button></td>
					</tr>
				</table>
			</form>


		</div>
		<%-- 내용 --%>


		<div id="header">
			<c:import url="AdminFooter.jsp"></c:import>
		</div>


	</div>
</body>
</html>