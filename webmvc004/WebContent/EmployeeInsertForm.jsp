<%@page import="class3.com.test.EmployeeDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeeInsertForm.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
		$(function()
		{
		    $("#datepicker").datepicker(
		    {
		  	  changeMonth: true, 
		        changeYear: true,
		        nextText: '다음 달',
		        prevText: '이전 달' ,
		        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		        dayNamesMin : ['월', '화', '수', '목', '금', '토', '일'], 
		        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		        dateFormat: "yy-mm-dd",
		        yearRange: 'c-99:',
		  });
		});
		
		window.onload = function()
		{
			//선택 목록에 체인지 이벤트 등록
			document.getElementById("positionId").onchange=function() 
			{
				var positionId = document.getElementById("positionId").value;
				
				// 아이디 값 받아오기 테스트
				//alert(positionId);
				
				minBasicPay(positionId);
				
			};
		};
		
		function minBasicPay(positionId) 
		{
			// 보내줄 주소 
			var url = "/webmvc004/MinbasicPay.jsp?positionId="+positionId;
			ajax = createAjax();
			ajax.open("GET",url,true);
			ajax.onreadystatechange= function()
			{
				if(ajax.readyState == 4)
				{
					if(ajax.status == 200)
					{
						callBack();
					}
				}
			}
			ajax.send("");
		}
		
		function callBack()
		{
			var result = ajax.responseText;
			
			document.getElementById("minBasicPay").innerHTML = result;
		}
</script>
</head>
<body>
<div>
	<div class="mainmenu">
		<!-- 주 메뉴 영역 -->
		<a href="">[직원 관리]</a>
		<a href="">[지역 관리]</a>
		<a href="">[부서 관리]</a>
		<a href="">[직위 관리]</a>
	</div>
	
	<div class="content">
		<!-- 콘텐츠 영역 -->
		<h2>[직원 관리]</h2>
		<div class="submenu">
			<!-- 서브 메뉴 영역 -->
			<a href="employeelist.do"><button type="button" style="width: 145px">[직원 정보 출력]</button></a>
			<a href="employeeinsertform.do"><button type="button" style="width: 145px">[직원 정보 입력]</button></a>
		</div>
		<div>
			<!-- action 속성은 서블릿 주소를 작성해야 한다. -->
			<form action="employeeinsert.do" method="post">
				<table>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name">
						</td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td>
							<input type="text" name="ssn">
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="text" id="datepicker">
						</td>
					</tr>
					<tr>
						<th>양·음</th>
						<td>
							<input type="radio" name="lunar" id="lunar0" value="0" checked="checked"><label for="lunar0">양력</label>
							<input type="radio" name="lunar" id="lunar1" value="1" checked="checked"><label for="lunar1">음력</label>							
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="text" name="telephone" placeholder="ex)010-1111-1111">
						</td>
					</tr>
					<tr>
						<th>부서</th>
						<td>
							<!-- select 의 name 속성은 부서번호에 해당하는 이름을 사용 -->
							<select name="dapartmentId">
								<!-- option 에는
									 사용자에게 보여주는 부분은 부서 이름을 사용하지만
									 서버에 전달할 종류는 데이터베이스에서 읽어온 자료를 사용
								 -->
								 <c:forEach var="dto" items="${departmentList }">
								 <option value="${dto.departmentId }" id="this">${dto.departmentName }</option>
								 </c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>직위</th>
						<td>
							<select name="positionId" id="positionId">
								<c:forEach var="dto" items="${positionList }">
								<option value="${dto.positionId }" >${dto.positionName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>지역</th>
						<td>
							<select name="regionId">
								<c:forEach var="dto" items="${regionList }">
								<option value="${dto.regionId }">${dto.regionName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>기본급</th>
						<td>
						<span id="minBasicPay">0</span>
		
						</td>
					</tr>
					<tr>
						<th>수당</th>
						<td>
							<input type="text" name="extrapay">
						</td>
					</tr>
					<tr>
						<th></th>
						<td>
							<button>직원 추가</button>
							<button type="reset">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button>
						</td>
					</tr>
				</table>
			</form>			
		</div>
	</div>
</div>
</body>
</html>