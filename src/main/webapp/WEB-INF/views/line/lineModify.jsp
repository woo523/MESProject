<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<form action="${pageContext.request.contextPath}/line/lineModifyPro" method="post" onsubmit="return checkForm()">
		<input type="hidden" name="lineId" value="${lineDTO.lineId}">
		<ul>
			<li>라인코드 <input type="text" name="lineCode" value="${lineDTO.lineCode}"></li>
			<li>수정자  <input type="text" name="insertId" value="${sessionScope.id}" readonly> </li>
			<li>라인명 <input type="text" name="lineName" value="${lineDTO.lineName}"></li>
			<li>공정 	<select name="proCode">
							<c:if test="${lineDTO.proCode ne '사출'}">
								<option value="사출">사출</option>
							</c:if>
							<c:if test="${lineDTO.proCode eq '사출'}">
								<option value="사출" selected>사출</option>
							</c:if>
							<c:if test="${lineDTO.proCode ne '포장'}">
								<option value="포장">포장</option>
							</c:if>
							<c:if test="${lineDTO.proCode eq '포장'}">
								<option value="포장" selected>포장</option>
							</c:if>
						</select></li>
			<li>작업장  <select name="linePlace" id="linePlace">
							<c:forEach var="place" items="${instrList}">
<%-- 								<option value="${place.work_sts}">${place.work_sts}</option> --%>
							</c:forEach>
							<option value="1">1</option>
							<option value="작업장1">작업장1</option>
							<option value="작업장2">작업장2</option>
						</select></li>			
			<li>일렬번호 <input type="text" name="sortOrder" value="${lineDTO.sortOrder}"></li>
			<li>사용여부 <input type="radio" id="Y" name="useChoice" value="Y" class="sCheck">Y
						 <input type="radio" id="N" name="useChoice" value="N" class="sCheck">N</li>
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
	if(confirm("수정하시겠습니까?")) {
		return true;	// 폼 전송 O
	} else {
		return false;	// 폼 전송 X
	}
}

</script>

</html>