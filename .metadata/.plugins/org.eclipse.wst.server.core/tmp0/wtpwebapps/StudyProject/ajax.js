var ajax = null;

function createAjax()
{
	// 객체를 생성하는 방식의 차이일 뿐이지 두가지 모두 XMLHttpRequest 객체를 생성하는 구문
	if(window.ActiveXObject)		// IE 8 이하
	{
		return new ActiveXObject("Msxml2.XMLHTTP");		// ActiveXOject 생성
		// return new ActiveXObject("Microsoft.XMLHTTP");
	}
	else		// 그 외 브라우저
	{
		if(window.XMLHttpRequest)
		{
			return new XMLHttpRequest();	// XMLHttpRequest 
		}
		else	// 둘다 지원이 안될 경우 ajax 지원이 불가능한 브라우저 이므로 null을 반환한다.
		{
			return null;
		}
	}
	
	
	// 위와 같은 구문
	/*
	if(window.ActiveXObject)
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
	}
	else if(window.XMLHttpRequest)
	{
	}
	else
	{
		return null;
	}
	*/
	
}