<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>require</title>

</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div>
소요량관리<br>		
	상위품번 : <input type="text">
	하위품번 : <input type="text">
	제품품번 : <input type="text">
	사용여부 :<select>
				<option value="1" selected>Y</option>
				<option value="2">N</option>
			</select>
	<button type="button">조회</button>
</div>
	
<div>
소요량<br>
	
	<div class="requireButtons">
		<button type="button">추가</button>
		<button type="button">수정</button>
		<button type="button">삭제</button>
		<button type="button">취소</button>
		<button type="button">저장</button>
	</div>
	
	<table border="1" class="requireList">
		<tr>
			<th>상위품번</th>
			<th>상위품명</th>
			<th>하위품번</th>
			<th>하위품명</th>
			<th>단위</th>
			<th>소요량<th>
			<th>사용여부</th>
			<th>등록자</th>
			<th>등록일</th>
			<th>변경자</th>
			<th>변경일</th>
		</tr>
		<c:forEach var="requireDTO" items="${requireList}">
			<tr>
				<td>${requireDTO.itemNum}</td>
				<td>${requireDTO.itemName}</td>
				<td>${requireDTO.mtrlType}</td>
				<td>${requireDTO.mtrlSort}</td>
				<td>${requireDTO.invntUnit}</td>
				<td>${requireDTO.invntQlt}</td>
				<td>${requireDTO.standard}</td>
				<td>${requireDTO.useYn}</td>
				<td>${requireDTO.salePrice}</td>
				<td>${requireDTO.buyPrice}</td>
				<td>${requireDTO.safeInvnt}</td>
				<td>${requireDTO.note}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

<script>
   
</script>
</html>