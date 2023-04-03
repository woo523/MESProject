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
			<li>수주 <input type="text" name="ordId" placeholder="수주번호" onclick="openOrd()"><input type="text" name="ordInfoId" placeholder="수주정보"> 
			수주일자 납품예정일 품번 품명 수주수량 수주업체</li>
			<li>지시상태
				<!-- 체크 해제 못하도록 막음 -->
				<input type="checkbox" name="workSts" value="지시" class="sCheck" checked="checked" onclick="return false;">지시</li>
			<li>제품 정보 <input type="hidden" id="pid" name="pid">
						  <input type="text" id="pcd" name="pcd" placeholder="품번" onclick="openItem()" readonly>
						  <input type="text" id="pnm" placeholder="품명" readonly>
						  </li>
			<li>공정 정보 <input type="hidden" id="lineId"  name="lineId"> 
						  <input type="text" id="lineName" placeholder="라인 검색" onclick="openLine()" readonly>
						  <input type="text" id="proCode" placeholder="공정" readonly>
						  <input type="text" id="linePlace" placeholder="작업장" readonly>
						  <input type="text" id="useChoice" placeholder="라인사용여부" readonly></li>
			<li>지시수량  <input type="text" name="instrCnt" required></li>			
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

// 라인 검색 팝업창
function openLine() {
	window.open("${pageContext.request.contextPath}/work/lineList", "popup", "width=500, height=500, left=100, top=100");	
}
</script>

</html>