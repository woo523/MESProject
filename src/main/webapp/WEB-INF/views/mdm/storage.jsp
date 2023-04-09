<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>storage</title>

</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div>
창고검색<br>		
	창고명 : <input type="text">
	창고유형 :<select>
				<option value="1" selected>전체</option>
				<option value="2">원자재</option>
				<option value="3">부자재</option>
				<option value="4">완제품</option>
			</select>
	창고코드 :<select>
				<option value="1" selected>전체</option>
				<option value="2">원자재</option>
				<option value="3">부자재</option>
				<option value="4">완제품</option>
			</select>	
	<button type="button">조회</button>
</div>
	
<div>
품목리스트<br>
	
	<div class="storageButtons">
		<button type="button">수정</button>
		<button type="button">삭제</button>
		<button type="button">추가</button>
		<button type="button">저장</button>
	</div>
	
	<table border="1" class="storageList">
		<tr>
			<th>창고코드</th>
			<th>창고명</th>
			<th>창고유형</th>
			<th>사용여부</th>
			<th>수량</th>
		</tr>
		<c:forEach var="storageDTO" items="${storageList}">
			<tr>
				<td>${storageDTO.storCode}</td>
				<td>${storageDTO.storName}</td>
				<td>${storageDTO.storType}</td>
				<td>${storageDTO.useYn}</td>
				<td>${storageDTO.itemCount}</td>
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