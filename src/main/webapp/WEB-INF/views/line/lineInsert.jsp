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
.content_body textarea {
	resize: none;
}

</style>
</head>
<body>
<div class="content_body">
	<h2>라인 등록</h2> 
	<form action="${pageContext.request.contextPath}/line/lineInsertPro" method="post" onsubmit="return checkForm()">
		<ul>
			<li>등록자  <input type="text" name="insertId" value="${sessionScope.id}" readonly> </li>
			<li>라인명 <input type="text" name="lineName" class="lineName"></li>
			<li>작업장   <select name="linePlace" class="linePlace">
							<option value="" selected>전체</option>
							<option value="외주">외주</option>
							<option value="작업장1">작업장1</option>
							<option value="작업장2">작업장2</option>
						</select></li>			
			<li>일렬번호 <input type="text" name="sortOrder" class="sortOrder"></li>
			<li>사용여부 <input type="radio" name="useChoice" value="Y" class="sCheck">Y
						 <input type="radio" name="useChoice" value="N" class="sCheck" checked="checked" onclick="return false;">N</li>
			<li>비고 <textarea rows="5" cols="30" name="note" maxlength="25"
							   placeholder="글자수는 최대 25자 입니다"></textarea></li>
		</ul>
		
		<input type="submit" value="등록">
		<button type="reset">취소</button>
	</form>
</div>
</body>

<script type="text/javascript">

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