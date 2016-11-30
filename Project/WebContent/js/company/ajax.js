var ajax = null;

function createAjax() 
{
	// 객체를 생성하는 방식의 차이일 뿐이지 두 가지 모두 XMLHttpRequest 객체를 생성하는 구문
	if (window.ActiveXObject) // IE 8 이하
	{
		return new ActiveXObject("Msxml2.XMLHTTP"); // ActiveXObject 생성
		//return new ActiveXObject("Microsoft.XMLHTTP");
	}
	else // 그 외 브라우저라면
	{
		if (window.XMLHttpRequest)
		{
			return new XMLHttpRequest(); // XMLHttpRequest 객체 생성
		}
		else // Ajax 지원 안함
		{
			return null;
		}
	}
}