<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Line Modify</title> -->

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">

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

@import	url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);

.content_body {
	font-size: 12pt;
	font-family: 'NanumSquare', sans-serif;
}

form {
	border:1px solid;
	padding:10px;
	width: 500px;
	margin: 0px auto;
}

h2 {
	text-align: center;
}

.content_body ul li {
	list-style: none;
	padding: 6px;
}

label.title {
	width: 80px;
	float: left;
}

.content_body textarea {
	resize: none;
}

.content_body span {
	color: red;
}

.content_body .btn {
	text-align: center;
}

input, select, button {
	font-size: 12pt;
	font-family: 'NanumSquare', sans-serif;
}

</style>

</head>
<body>

<!-- <header> -->
	<jsp:include page="../inc/header3.jsp" />
<!-- </header> -->

<div class="content_body">
	<h2>라인 수정</h2> 
	<form action="${pageContext.request.contextPath}/line/lineModifyPro" method="post" onsubmit="return checkForm()">
		<input type="hidden" name="lineId" value="${lineDTO.lineId}">
		<ul>
			<li>
				<label class="title">라인코드</label>
				<input type="text" name="lineCode" class="lineCode" value="${lineDTO.lineCode}" readonly>
			</li>
			<li>
				<label class="title">수정자</label>
				<input type="text" name="insertId" value="${sessionScope.id}" readonly>
			</li>
			<li>
				<label class="title">라인명 <span>*</span> </label>
				<input type="text" name="lineName" class="lineName" value="${lineDTO.lineName}">
			</li>
			<li>
				<label class="title">작업장 <span>*</span> </label>
				<select name="linePlace" id="linePlace" class="linePlace">
					<c:forEach var="place" items="${lineList}">
						<option value="${place.linePlace}">${place.linePlace}</option>
					</c:forEach>
				</select>
			</li>			
			<li>
				<label class="title">일련번호 <span>*</span> </label>
				<input type="text" name="sortOrder" class="sortOrder" value="${lineDTO.sortOrder}">
			</li>
			<li>
				<label class="title">사용여부 <span>*</span> </label>
				<input type="radio" id="Y" name="useChoice" value="Y" class="sCheck">Y
				<input type="radio" id="N" name="useChoice" value="N" class="sCheck">N
			</li>
			<li>
				<label class="title">비고</label>
				<textarea rows="5" cols="30" name="note">${lineDTO.note}</textarea>
			</li>
		</ul>
		
		<div class="btn">
			<input type="submit" value="수정">
			<button type="reset">취소</button>
		</div>
	</form>
</div>
</body>

<script type="text/javascript">

$(document).ready(function() {
	// 기존 radio 값 가져오기
	// radio id 값이 동일하면 안됨
	var use = "${lineDTO.useChoice}";
	console.log(use);
	
	$("#"+use).prop("checked", true);
	
	// 기존 select 값 가져오기
	var place = "${lineDTO.linePlace}";
	console.log(place);
	
	$("#linePlace").val(place).prop("selected", true);
});	

// 수정 여부 확인 후 폼 전송
function checkForm() {

	// 라인 유효성 검사
	if($('.lineCode').val() == "") {
		alert("라인코드를 입력해주세요.");
		$('.lineCode').focus();
		
		return false;
	}
	
	if($('.lineName').val() == "") {
		alert("라인명을 입력해주세요.");
		$('.lineName').focus();
		
		return false;
	}
	
	if($('.linePlace').val() == "") {
		alert("작업장을 선택해주세요.");
		$('.linePlace').focus();
		
		return false;
	}
	
	if($('.sCheck').val() == "") {
		alert("일련번호를 입력해주세요.");
		$('.sortOrder').focus();
		
		return false;
	}
	
	if(confirm("수정하시겠습니까?")) {
		return true;	// 폼 전송 O
	} else {
		return false;	// 폼 전송 X
	}
}

</script>

</html>