<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
<article>
	<h2>자재재고현황</h2>
	<form id="inmtrl">
		<div class="selectButtons">
			<button type="submit" id="submit">조회</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>자재유형</td>
				<td><select name="mtrltype">
						<option value="" selected>전체</option>
						<option value="1">자재 1</option>
						<option value="2">자재 2</option>
						<option value="3">자재 3</option>
					</select></td>
			<tr>
				<td>품번</td>
					<td><input type="text" name="pcd" id="pcd" class="form-control" placeholder="품번코드" onclick="openilist()">
						<input type="text" name="pnm" id="pnm" class="form-control" placeholder="품번명" readonly></td>
			</tr>
	</table>
	
	<h2>자재재고</h2>
		<div class="listButtons">
			<c:choose>
				<c:when test="${! empty instrList}">
					<span>총 ${instrSearchCount}건</span>
				</c:when>
			</c:choose>
			<button type="button">취소</button>
			<button type="button">저장</button>
		</div>
		
	<table border="1" class="inList">	
	<tr id="th">
		<th>품번</th>
		<th>품명</th>
		<th>자재유형</th>
		<th>단위</th>
		<th>창고</th>
		<th>현재고</th>
		<th>실사량</th>
	</tr>
	<c:choose>
		<c:when test="${empty inmaterList}">
			<tr><td colspan="14"></td></tr>
				<tr>
					<td colspan="14">해당 데이터가 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
	<c:forEach var="inte" items="${inmaterList}">
		<tr id="con" onclick="inmaterList(${inte.inmaterId})">
		  	<td>${inte.itemNum}</td>
		  	<td>${inte.itemName}</td>
		  	<td>${inte.mtrlType}</td>
		  	<td>${inte.invntUnit}</td>
		  	<td>${inte.stockwhouse}</td>
		  	<td>${inte.stockcur}</td>
		</tr>
		</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
</form>
</article>
</div>

<script type="text/javascript">

function openact(){
    window.open("${pageContext.request.contextPath }/material/actual","popup", "width=500, height=500,left=100, top=100");
}

//유효성 검사
$(document).ready(function() {
	$('#inmtrl').submit(function() {		
		if($('#pcd').val() == "") {
			alert("품번코드를 입력해주세요.");
			$('#pcd').focus();
			
			return false;
		}
	});
});
</script>
</body>
</html>