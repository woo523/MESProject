<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>equip</title>

</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div>
설비검색<br>		
	설비명 : <input type="text">
	설비코드 : <input type="text">
	설비유형 :<select>
				<option value="1" selected>전체</option>
				<option value="2">조립</option>
				<option value="3">멸균</option>
				<option value="4">포장</option>
			</select>
	설비상태 : <select>
				<option value="5" selected>전체</option>
				<option value="6">양호</option>
				<option value="7">불량</option>
				<option value="8">고장</option>
			</select>
	사용여부 : <select>
				<option value="9" selected>전체</option>
				<option value="10">Y</option>
				<option value="11">N</option>
			</select>
	<button type="button">조회</button>
</div>
	
<div>
설비리스트<br>
	
	<div class="equipButtons">
		<button type="button">수정</button>
		<button type="button">삭제</button>
		<button type="button">추가</button>
		<button type="button">저장</button>
	</div>
	
	<table border="1" class="equipList">
		<tr>
			<th>설비코드</th>
			<th>설비명</th>
			<th>설비유형</th>
			<th>구매처</th>
			<th>구매일자</th>
			<th>구매금액</th>
			<th>사용여부</th>
			<th>설비상태</th>
		</tr>
		<c:forEach var="equipDTO" items="${equipList}">
			<tr>
				<td>${equipDTO.equpCode}</td>
				<td>${equipDTO.equpName}</td>
				<td>${equipDTO.equpType}</td>
				<td>${equipDTO.poNum}</td>
				<td>${equipDTO.poDate}</td>
				<td>${equipDTO.poAmount}</td>
				<td>${equipDTO.useYn}</td>
				<td>${equipDTO.equpStat}</td>
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