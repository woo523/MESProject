<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Line insert</title>

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
	<h2>라인 등록</h2> 
	<form action="${pageContext.request.contextPath}/line/lineInsertPro" method="post" onsubmit="return checkForm()">
		<ul>
			<li>
				<label class="title">등록자</label>
				<input type="text" name="insertId" value="${sessionScope.id}" readonly>
			</li>
			<li>
				<label class="title">라인명</label>
				<input type="text" name="lineName" class="lineName">
			</li>
			<li>
				<label class="title">작업장 <span>*</span> </label>
				<select name="linePlace" class="linePlace">
					<option value="" selected>전체</option>
					<option value="외주">외주</option>
					<option value="작업장1">작업장1</option>
					<option value="작업장2">작업장2</option>
					<option value="작업장3">작업장3</option>
				</select>
			</li>			
			<li>
				<label class="title">일련번호 <span>*</span> </label>
				<input type="text" name="sortOrder" class="sortOrder">
			</li>
			<li>
				<label class="title">사용여부 <span>*</span> </label>
				<input type="radio" name="useChoice" value="Y" class="sCheck">Y
				<input type="radio" name="useChoice" value="N" class="sCheck" checked="checked" onclick="return false;">N
			</li>
			<li>
				<label class="title">비고</label>
				<textarea rows="5" cols="30" name="note" maxlength="25" placeholder="글자수는 최대 25자 입니다"></textarea>
			</li>
		</ul>
		
		<div class="btn">
			<input type="submit" value="등록">
			<button type="reset">취소</button>
		</div>
	</form>
</div>
</body>

<script type="text/javascript">

// 라인 등록 시 사용여부 기본값 N
$(document).ready(function () {
	$("input[value='Y']").attr('disabled', true);
});

// 등록 여부 확인 후 폼 전송
function checkForm() {
	
	// 라인 유효성 검사
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
	
	if($('.sortOrder').val() == "") {
		alert("일련번호를 입력해주세요.");
		$('.sortOrder').focus();
		
		return false;
	}
	
	let submit = confirm("등록하시겠습니까?");
	return submit ? true : false;

}
</script>
</html>