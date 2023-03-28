<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>line</title>
	
	<link href="/resources/css/instruct/line.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
<article>
	<h2>라인정보</h2>
	<form id="lineSearch">
		<div class="selectButtons">
			<button type="submit">조회</button>
			<button type="button">추가</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>라인코드</td>
				<td><input type="text" class="lineCode" name="lineCode"></td>
				<td>라인명</td>
				<td><input type="text" class="lineName" name="lineName"></td>
				<td>사용여부</td>
				<td><select name="useChoice">
						<option value="" selected>전체</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select></td>
			</tr>
		</table>
	
		<h2>목록</h2>
	
		<table border="1" class="lineList">
			<tr>
				<th>라인코드</th>
				<th>라인명</th>
				<th>공정</th>
				<th>작업장</th>
				<th>정렬순서</th>
				<th>사용여부</th>
				<th></th>
			</tr>
			<c:choose>
				<c:when test="${empty lineList}">
					<tr><td colspan="7"></td></tr>
					<tr>
						<td colspan="7">해당 라인 정보가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="lineDTO" items="${lineList}">
						<tr>
							<td>${lineDTO.lineCode}</td>
							<td>${lineDTO.lineName}</td>
							<td>${lineDTO.proCode}</td>
							<td>${lineDTO.linePlace}</td>
							<td>${lineDTO.sortOrder}</td>
							<td>${lineDTO.useChoice}</td>
							<td><img src='${pageContext.request.contextPath}/resources/image/modify.png' width='17px' onclick=''>
								<img src='${pageContext.request.contextPath}/resources/image/del.png' width='17px' onclick=''></td>      
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
</article>
	
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

<script>
// 라인 유효성 검사
$(document).ready(function() {
	$('#lineSearch').submit(function() {
		if($('.lineCode').val() == "") {
			alert("라인코드를 입력해주세요.")
			$('.lineCode').focus();
			
			return false;
		}
		
		if($('.lineName').val() == "") {
			alert("라인명을 입력해주세요.")
			$('.lineName').focus();
			
			return false;
		}
	})
})
</script>
</html>