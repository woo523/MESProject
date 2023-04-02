<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>instruct insert</title>
</head>
<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
	<h2>작업지시 등록</h2> 
	<br>
	<form action="${pageContext.request.contextPath}/work/instructInsertPro" method="post">
		<ul>
			
			<li>작업지시번호 <input type="text" name="instrNum"></li>	<!-- 번호 자동생성 -->
			<li>등록자  <input type="text" name="insertId" value="${sessionScope.id}" readonly> </li>
			<li>수주 <input type="text" name="ordId" placeholder="수주정보"><input type="text" name="ordInfoId" placeholder="수주정보"> </li>
			<li>지시상태
				<input type="checkbox" name="workSts" value="지시" class="sCheck">지시
				<input type="checkbox" name="workSts" value="시작" class="sCheck">시작
				<input type="checkbox" name="workSts" value="마감" class="sCheck">마감 </li>
			<li>제품 정보 <input type="text" id="pcd" name="pcd" placeholder="품번" onclick="openItem()">
						  <input type="text" id="pnm" placeholder="품명">
						  <input type="hidden" id="pid" name="pid"></li>
			<li>공정 정보 <input type="text" name="lineId"> </li>
			<li>지시수량  <input type="text" name="instrCnt"></li>			
		</ul>
		
		<input type="submit" value="등록">
		<button type="reset">취소</button>
	</form>
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

<script type="text/javascript">
// 품목 검색 팝업창
function openItem() {
	window.open("${pageContext.request.contextPath}/work/itemList", "popup", "width=500, height=500, left=100, top=100");
}
</script>

</html>