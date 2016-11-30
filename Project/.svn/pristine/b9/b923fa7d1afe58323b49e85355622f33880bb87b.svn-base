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
		var i = 0;
		var nameCount = 0;
		// 버튼에 이름을 넣기위해 만들었당
		var nameCount = 0;
		
		//var body = document.body;
		//var button = body.appendChild(createButton(count));
				
		// 대 카테고리 생성
		$("#addItem").click(function()
		{
			$("#ol").parent().append("<ol><li><input type='text'> </li>");
			$("li:last").append(createButton(count));
			$("li:last").parent().append("<li>이름 <input type='text'> 가격 <input type='text'> <input type='file' class='file' accept='image/*'>");
			
			count++;
		});
		
		// 필수 소 카테고리 생성
		$(".bigaddItems").click(function() 
		{
			var num = $(this).attr("data-num");
			$(this).parent().append("<li>이름 <input type='text' id='notnull"+ count +"' name='smallCtr" + num +"'> 가격 <input type='text' class='num' id='notnull"+ max +"' name='prc" + num +"'> <input type='file' name='upload" + nameCount++ + "' accept='image/*'></li>");
			count = count + 2;
			max = max + 2;
		})
		
		/* 
		// 소 카테고리 생성
		$(".addItems").click(function() 
		{
			$(this).parent().append("<li>이름 <input type='text'> 가격 <input type='text' class='num'> <input type='file' class='file' accept='image/*'></li>");
		}) */
		
		
		// 이미지 업로드 버튼 클릭시 name 속성을 부여하라
		$(".file").click(function() 
		{
			$(this).attr("name", "upload" + nameCount);
			nameCount++;
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
			
			
			// 대 카테고리에 내용이 없다면 컨트롤러에게 name의 값을 전달하지 않기 위해
			// 대 카테고리에 내용이 있을때만 name의 속성을 삽입한다.
			for (var i = 1; i <= 5; i++) 
			{
				if ($("#bigCtr" + i).val() != "")
					$("#bigCtr" + i).attr("name", "bigCtr");
			}

			
			
			
			
			
			
			
			
			
			
			
			// 폼을 서브밋처리하라			
			var f = document.getElementById("form");
			f.submit();
			
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
			var str = "<li>이름 <input type='text'> 가격 <input type='text'> <input type='file' accept='image/*' multiple></li>";
			$(this).parent().append(str);
		});
		btn.appendChild(textVal);

		return btn;
	}
	
	
	 
	
	
	
	    
	    
</script>

</head>
<body>
<!--  -->
<form action="<%=cp %>/company/CompanyProductInsertOk.love" method="post" id="form" enctype="multipart/form-data">

	<ul id="ul">	
		<li>제목(*) <span id="checknull4"></span>
			<ol>
				<li>
					<input type="text" class="notnull" id="notnull4" name="subject" value="${normalInfo.pname }">
				</li>
			</ol>
		</li>
		<li>이미지(*) <span id="checknull6"></span>
			<ol>
				<li>
					<img src="${normalInfo.img }">
				</li>
				<li>
					대표이미지 : <input type="file" accept="image/*" name="upload">	
				</li>
			</ol>	
		</li>
		
		
		
		<li>상품(*) <span id="checknull7"></span>
			<ol>
				<li>
					<input type="text" id="bigCtr1" value="${bigArr[0] }">
					<button type="button" class="bigaddItems" data-num="1">+</button>
				</li>
				
				<c:forEach var="dto" items="${normalSmallItem0}">
					<li>이름 <input type="text" name="smallCtr1" value="${dto.dpname}"> 가격 <input type="text" name="prc1" value="${dto.prc}"> 
					<input type="file" class="file" accept="image/*" name="upload1"></li>	
				</c:forEach>
			</ol>
			<ol>
				<li>		
					<input type="text" id="bigCtr2" value="${bigArr[1] }">
					<button type="button" class="bigaddItems" data-num="2">+</button>
				</li>
				<c:forEach var="dto" items="${normalSmallItem1}">
					<li>이름 <input type="text" name="smallCtr2" value="${dto.dpname}"> 가격 <input type="text" name="prc2" value="${dto.prc}">
					<input type="file" class="file" accept="image/*" name="upload2${i.count }"></li>
				</c:forEach>
			</ol>
			<ol>
				<li>		
					<input type="text" id="bigCtr3" value="${bigArr[2] }">
					<button type="button" class="bigaddItems" data-num="3">+</button>
				</li>
				<c:forEach var="dto" items="${normalSmallItem2}">
					<li>이름 <input type="text" name="smallCtr3" value="${dto.dpname}"> 가격 <input type="text" name="prc3" value="${dto.prc}"> 
					<input type="file" class="file" accept="image/*" name="upload"> </li>
				</c:forEach>
			</ol>
			<ol>
				<li>		
					<input type="text" id="bigCtr4" value="${bigArr[3] }">
					<button type="button" class="bigaddItems" data-num="4">+</button>
				</li>
				<c:forEach var="dto" items="${normalSmallItem3}">
					<li>이름 <input type="text" name="smallCtr4" value="${dto.dpname}"> 가격 <input type="text" name="prc4" value="${dto.prc}">
					<input type="file" class="file" accept="image/*" name="upload"></li>
				</c:forEach>
			</ol>
			<ol>
				<li>		
					<input type="text" id="bigCtr5" value="${bigArr[4] }">
					<button type="button" class="bigaddItems" data-num="5">+</button>
				</li>
				<c:forEach var="dto" items="${normalSmallItem4}">
					<li>이름 <input type="text" name="smallCtr5" value="${dto.dpname}"> 가격 <input type="text" name="prc5" value="${dto.prc}">
					<input type="file" class="file" accept="image/*" name="upload"></li>
					
				</c:forEach>
			</ol>
		
		</li>
	
		
	</ul>

<button type="button" id="commit">등록</button> <button type="button" id="rollback">철회</button> 

</form>


</body>
</html>