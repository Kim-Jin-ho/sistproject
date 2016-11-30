<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 - 할인상품입력</title>
<script type="text/javascript" src="<%=cp %>/js/company/jquery-1.12.3.min.js"></script>

<script type="text/javascript">

	// 숫자만 입력 가능하도록
	$(document).on("keyup", ".num", function()
	{		
		$(this).val($(this).val().replace(/[^0-9]/gi,""));
	});

	// 이미지를 등록하지 않았다면
	$(document).ready(function()
	{
		var count = 12;
		var max = count + 1;
		//var body = document.body;
		//var button = body.appendChild(createButton(count));
	
		
		// 대 카테고리 생성
		$("#addItem").click(function()
		{
			$("#ol").parent().append("<ol><li><input type='text'> </li>");
			$("li:last").append(createButton(count));
			$("li:last").parent().append("<li>이름 <input type='text'> 가격 <input type='text'> <input type='file' accept='image/*' multiple>");
			
			count++;
		});
		
		// 필수 소 카테고리 생성
		$(".bigaddItems").click(function() 
		{
			$(this).parent().append("<li>이름 <input type='text' id='notnull"+ count +"'> 가격 <input type='text' class='num' id='notnull"+ max +"'> <input type='file' accept='image/*' multiple></li>");
			count = count + 2;
			max = max + 2;
		})
		
		
		// 소 카테고리 생성
		$(".addItems").click(function() 
		{
			$(this).parent().append("<li>이름 <input type='text'> 가격 <input type='text' class='num'> <input type='file' accept='image/*' multiple></li>");
		})
		
		// 미 입력 부분 체크
		$("#commit").click(function() 
		{
  			//전화번호 인증번호 생성 및 확인

			var regExOnlyNum=/^[0-9]*$/;
			if (regExOnlyNum.test($("#notnull7").val()))
			{
				alert("test");
			}
				
			//alert("hi");
			for (i=1; i<=max; i++)
			{
				if($("#notnull" + i).val() == "")
				{
					alert("미 입력 항목이 존재합니다.");
					$("#notnull" + i).focus();
					if (i == 2)
					{
						i--;
					}
					else if (i >= 7)
					{
						i = 7;
					}
					$("#checknull" + i).html("필수 입력 항목 입니다.").css("color","red");
					return;
				}
				else
				{
					$("#checknull" + i).html("")
				}
			}
		});
	});
	
	
	
	function createButton(val)
	{
		// 텍스트 노드를 생성합니다.
		var textVal = document.createTextNode("+");
		
		// 엘리먼트를 생성합니다.
		var btn = document.createElement("button");
		
		// 버튼에 id를 삽입 
		btn.setAttribute("class", "addItems");
		btn.setAttribute("type", "button");
		
		// 버튼에 이벤트 삽입
		btn.addEventListener("click", function()
		{
			var str = "<li>이름 <input type='text'> 가격 <input type='text' class='num'> <input type='file' accept='image/*' multiple></li>";
			$(this).parent().append(str);
		});
		btn.appendChild(textVal);

		return btn;
	}
	
	
	 
	
	
	
	    
	    
</script>

</head>
<body>

<form action="<%=cp %>/company/FileUpload.love" method="post" enctype="multipart/form-data">
	<ul id="ul">
		<li>카테고리(*) 
			<ol>
				<li>
					<select>
						<option>${normalInfo.ccname }<option>
					</select>
				</li>
			</ol>	
		
		<li>기간(*) <span id="checknull1"></span>
			<ol>
				<li>
					<input type="text" id="notnull1">-<input type="text" id="notnull2">
				</li>
			</ol>	
		</li> 
		<li>홈페이지(*) <span id="checknull3"></span>
			<ol>
				<li>
					<input type="url" id="notnull3" value="${normalInfo.hmpg }">
				</li>
			</ol>
		</li>
		<li>제목(*) <span id="checknull4"></span>
			<ol>
				<li>
					<input type="text" class="notnull" id="notnull4" value="${normalInfo.pname }">
				</li>
			</ol>
		</li>
		<li>주소(*) <span id="checknull5"></span>
			<ol>
				<li>
					<input type="text" class="notnull" id="notnull5" value="${normalInfo.addr }">
				</li>
			</ol>
		</li>
		<li>이미지(*) <span id="checknull6"></span>
			<ol>
				<li>
					<img src="${normalInfo.img }">
				</li>
				<li>
					대표이미지 : <input type="file" accept="image/*">	
				</li>
			</ol>	
		</li>
			
		<li>필수상품(*) <span id="checknull7"></span>
			<c:forEach var="dto1" items="${normalBigCtr}">
			<ol>
				<li>		
					<input type="text" value="${dto1.ptname }">
					<button type="button" class="bigaddItems">+</button>
				</li>
				<c:forEach var="dto2" items="${normalSmallCtr}">
				<li>이름 <input type="text" id="notnull7" value="${dto2.dpname}"> 가격 <input type="text" class="num" id="notnull7" value="${dto2.prc}"> 
				<input type="file" accept="image/*" multiple></li>
				</c:forEach>
			</ol>
			</c:forEach>			
		</li>
		
		<li>테스트상품(*) <span id="checknull7"></span>
		<c:set var="i" value="1"></c:set>
			<c:forEach var="dto3" items="${normalBigCtr}">
			<ol>
				<li>		
					<input type="text" value="${dto3.ptname }">
					<button type="button" class="bigaddItems">+</button>
				</li>
				<c:forEach var="dto4" items="${normalSmallItem}">
				<li>이름 <input type="text" id="notnull7" value="${dto4.dpname}"> 가격 <input type="text" class="num" id="notnull7" value="${dto4.prc}"> 
				<input type="file" accept="image/*" multiple></li>
				</c:forEach>
			</ol>
			<c:set var="i" value="${i = i + 1}"></c:set>
			</c:forEach>			
		</li>
		
		<li>일반상품 <button type="button" id="addItem">+</button>
			<ol id="ol">
				<li>
					<input type="text"> <button type="button" class="addItems">+</button>
				</li>
				<li>이름 <input type="text"> 가격 <input type="text" class="num">
				<input type="file" accept="image/*" multiple></li>
			</ol>	
		</li>		
	</ul>

<button type="button" id="commit">등록</button> <button type="button" id="rollback">철회</button> 

</form>


</body>
</html>