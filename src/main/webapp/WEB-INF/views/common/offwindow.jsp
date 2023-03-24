<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-ui-1.9.2.custom.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-migrate-1.4.1.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.cookie.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mCustomScrollbar.js"></script>

<script type="text/javascript">
if ( $.browser.msie ) {
	window.opener='Self';
	window.open('','_parent','');
	opener.location.reload(); // 부모창 새로고침
	window.close();
} else {
	opener.location.reload(); // 부모창 새로고침
	window.close(); // 일반적인 현재 창 닫기
	window.open('about:blank','_self').self.close();  // IE에서 묻지 않고 창 닫기
}


</script>

<!-- 팝업창에서 폼 전송하고 닫고 싶을 때 사용 -->

</head>
<body>

</body>
</html>