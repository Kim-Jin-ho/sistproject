<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 상품관리(EnterpriseProductManagement.jsp)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="https://rawgit.com/fyneworks/multifile/2.1.0-preview/jquery.MultiFile.js"></script>

<script type="text/javascript">


/* 결제팝업창 이동 */
	function goPopup() 
	{ 
		 window.open('EnterprisePayment.jsp', 'CLIENT_WINDOW','resizable=yes scrollbars=yes width=424 height=404');
	} 


	var setPreview = function(opt) {
		var inputFile = opt.inputFile.get(0);
		var img = opt.img.get(0);
		// FileReader
		if (window.FileReader) {
			// image 파일만
			if (!inputFile.files[0].type.match(/image\//))
				return;

			// preview
			try {
				var reader = new FileReader();
				reader.onload = function(e) {
					img.src = e.target.result;
					img.style.width = opt.w + 'px';
					img.style.height = opt.h + 'px';
					img.style.display = '';
				}
				reader.readAsDataURL(inputFile.files[0]);
			} catch (e) {
				// exception...
			}
			// img.filters (MSIE)
		} else if (img.filters) {
			inputFile.select();
			inputFile.blur();
			var imgSrc = document.selection.createRange().text;

			img.style.width = opt.w + 'px';
			img.style.height = opt.h + 'px';
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
					+ imgSrc + "\")";
			img.style.display = '';
			// no support
		} else {
			// Safari5, ...
		}
	}
	
	$(function() {
		$('.img_upload').change(function() {
			var opt = {
				inputFile : $(this),
				img : $($(this).attr('img_target')),
				w : $($(this).attr('img_target')).width(),
				h : $($(this).attr('img_target')).height()
			};
			setPreview(opt);
		});
	});

</script>


</head>
<body>

	<div id="wrap">
		<%-- 전체 틀 --%>

		<div id="container">
			<%-- 내용 --%>

			제목 <input type="text" id="proName"><br> 
			연결상품 <input type="text" id="proAddr" disabled="disabled"><br>
			기간 <input type="date"> ~ <input type="date"><br>
			사진등록
			<img src="" name="test_img1" id="test_img1" width="130" height="130"><br>
			<!-- <input type="file" class="multi with-preview" maxlength="5" data-maxsize="5120"/> -->
			<!-- 멀티파일업로드 NewFile8~ 여러가지 방법 참고 -->
			<input type="file" style="width:200px;border:0;font-size:12px" class="img_upload" img_target="#test_img1"><br>
			<input type="file" style="width:200px;border:0;font-size:12px" class="img_upload" img_target="#test_img1"><br>
			<input type="file" style="width:200px;border:0;font-size:12px" class="img_upload" img_target="#test_img1"><br>
			<input type="file" style="width:200px;border:0;font-size:12px" class="img_upload" img_target="#test_img1"><br>
			<input type="file" style="width:200px;border:0;font-size:12px" class="img_upload" img_target="#test_img1"><br>

			<br>

			<div>
				<button type="button" onclick="goPopup();">등록</button>
				<button type="button">철회</button>
				<button type="button">연장</button>

			</div>


		</div>

	</div>
	<%-- 전체 틀 --%>


</body>
</html>