<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>item</title>

</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div>
거래처정보관리<br>		
	거래처코드 : <input type="text">
	거래처명 : <input type="text">
	거래처구분 :<select>
				<option value="1" selected>전체</option>
				<option value="2">자사</option>
				<option value="3">고객사</option>
				<option value="4">협력사</option>
			</select>
	사용여부 :<select>
			<option value="5" selected>전체</option>
			<option value="6">Y</option>
			<option value="7">N</option>
			</select>
	<button type="button">조회</button>
</div>
	
<div>
거래처<br>
	
	<div class="ClientButtons">
		<button type="button">수정</button>
		<button type="button">삭제</button>
		<button type="button">추가</button>
		<button type="button">저장</button>
	</div>
	
	<table border="1" class="clientList">
		<tr>
			<th>거래처코드</th>
			<th>거래처명</th>
			<th>거래처구분</th>
			<th>사업자번호</th>
			<th>업테</th>
			<th>종목</th>
			<th>대표자</th>
			<th>담당자</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>전화번호</th>
			<th>휴대폰번호</th>
			<th>팩스번호</th>
			<th>E-MAIL</th>
			<th>비고</th>
			<th>사용여부</th>
		</tr>
		<c:forEach var="clientDTO" items="${clientList}">
			<tr>
				<td>${clientDTO.clntCode}</td>
				<td>${clientDTO.clntName}</td>
				<td>${clientDTO.clntType}</td>
				<td>${clientDTO.bsnsNum}</td>
				<td>${clientDTO.industry}</td>
				<td>${clientDTO.event}</td>
				<td>${clientDTO.daepyo}</td>
				<td>${clientDTO.manager}</td>
				<td>${clientDTO.address}</td>
				<td>${clientDTO.addrDtl}</td>
				<td>${clientDTO.tell}</td>
				<td>${clientDTO.phone}</td>
				<td>${clientDTO.fax}</td>
				<td>${clientDTO.email}</td>
				<td>${clientDTO.note}</td>
				<td>${clientDTO.useYn}</td>
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