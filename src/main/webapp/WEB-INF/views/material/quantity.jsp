<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-ui-1.9.2.custom.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-migrate-1.4.1.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.cookie.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mCustomScrollbar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-datetimepicker.ko.js"></script>


<style type="text/css">
#con:hover {
	background-color: #e1e1e1;
	cursor: pointer;
}
@import
	url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
	;	
	
body{
	font-family: 'NanumSquare', sans-serif;
}

h3{
	text-align: center;
	font-weight: 900;	
}
#pagination {
	text-align: center;
}
form{
border:1px solid;
padding:10px;
width: 300px;
margin: 0px auto;
}
</style>

</head>
<body>
<div class="content_body">
	<h3>현재고 수정</h3>
	<form action="${pageContext.request.contextPath}/material/quantityPro" id="update" method="post">
	<input type="hidden" name="stockId" value="${stockDTO.stockId}">
		<table>
			<tr style="text-align:center;">
				<td>실사량:</td>
				<td><input type="number" class="curStock" name="curStock" value="${stockDTO.curStock}">
				<input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>