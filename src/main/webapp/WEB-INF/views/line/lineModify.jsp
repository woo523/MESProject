<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Line Modify</title>
</head>
<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
	<h2>라인 수정</h2> 
	<br>
	<form action="${pageContext.request.contextPath}/line/lineModifyPro" method="post">
		<input type="hidden" name="lineId" value="${lineDTO.lineId}">
		<ul>
			<li>라인코드 <input type="text" name="lineCode" value="${lineDTO.lineCode}"></li>
			<li>수정자  <input type="text" name="insertId" value="${sessionScope.id}" readonly> </li>
			<li>라인명 <input type="text" name="lineName" value="${lineDTO.lineName}"></li>
			<li>공정 	<select name="proCode">
							<option value="" selected>전체</option>
							<option value="사출">사출</option>
							<option value="포장">포장</option>
						</select></li>
			<li>작업장   <select name="linePlace">
							<option value="" selected>전체</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="작업장1">작업장1</option>
							<option value="작업장2">작업장2</option>
						</select></li>			
			<li>일렬번호 <input type="text" name="sortOrder" value="${lineDTO.sortOrder}"></li>
			<li>사용여부 <input type="radio" name="useChoice" value="Y" class="sCheck">Y
						 <input type="radio" name="useChoice" value="N" class="sCheck">N</li>
			<li>비고 <textarea rows="5" cols="30" name="note">${lineDTO.note}</textarea></li>
		</ul>
		<input type="submit" value="수정">
		<button type="reset">취소</button>
	</form>
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

<script type="text/javascript">

$(document).ready(function() {
	
	// 기존 select 및 radio 값 불러오기
	var Code = "${lineDTO.proCode}";
	var Place = "${lineDTO.linePlace}";
	var Choice = "${lineDTO.useChoice}";
	
	

	$("#"+Choice).prop("checked", true);
	
	console.log(Code);
	console.log(Place);
	console.log(Choice);
	
});

</script>

</html>