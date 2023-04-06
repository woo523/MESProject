<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>instruct insert</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-ui-1.9.2.custom.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-migrate-1.4.1.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.cookie.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-datetimepicker.ko.js"></script>

<style type="text/css">
.content_body #instrDate {
	background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}
</style>

</head>

<body>
<div class="content_body">
	<h2>작업지시 등록</h2> 
	<form action="${pageContext.request.contextPath}/work/instructInsertPro" method="post" onsubmit="return checkForm()">
		<ul>
			<li>등록자  <input type="text" name="insertId" value="${sessionScope.id}" readonly> </li>
			<li>지시일자 <input type="date" id="instrDate" name="instrDate" readonly></li>
			<li>수주 <input type="hidden" id="ordId" name="ordId" placeholder="수주" onclick="openOrd()">
					 <input type="text" id="ordNum" name="ordNum" placeholder="수주번호" onclick="openOrd()">
					 <input type="hidden" id="orderDate" name="orderDate" placeholder="일자" onclick="openOrd()">
					 <input type="hidden" id="dlvryDate" name="dlvryDate" placeholder="예정일" onclick="openOrd()">
					 <input type="hidden" id="ordQty" name="ordQty" placeholder="수주량" onclick="openOrd()">
					 <input type="hidden" id="clientName" name="clientName" placeholder="수주업체" onclick="openOrd()"></li>
			<li>지시상태 <!-- 체크 해제 못하도록 막음 -->
				<input type="checkbox" name="workSts" value="지시" class="sCheck" checked="checked" onclick="return false;">지시</li>
			<li>제품 정보  <input type="text" id="itemId" name="itemId" placeholder="품목" readonly>
						   <input type="text" id="itemNum" name="itemNum" placeholder="품번" readonly>
					 	   <input type="text" id="itemName" name="itemName" placeholder="품명" readonly></li>
			<li>공정 정보 <input type="hidden" id="lineId"  name="lineId"> 
						  <input type="text" id="lineName" placeholder="라인 검색" onclick="openLine()" readonly>
						  <input type="text" id="proCode" placeholder="공정" readonly>
						  <input type="text" id="linePlace" placeholder="작업장" readonly>
						  <input type="text" id="useChoice" placeholder="라인사용여부" readonly></li>
			<li>지시수량  <input type="text" name="instrCnt" required></li>
		</ul>
		
		<div>
			<input type="submit" value="등록">
			<button type="reset">취소</button>
		</div>
	</form>
</div>
</body>

<script type="text/javascript">

// 지시일자 오늘 설정
document.getElementById('instrDate').value = new Date().toISOString().substring(0, 10);

//수주 검색 팝업창
function openOrd() {
	window.open("${pageContext.request.contextPath}/work/orderList", "popup1", "width=500, height=500, left=500, top=100");
}

// 품목 검색 팝업창
function openItem() {
	window.open("${pageContext.request.contextPath}/work/itemList", "popup2", "width=500, height=500, left=500, top=100");
}

// 라인 검색 팝업창
function openLine() {
	window.open("${pageContext.request.contextPath}/work/lineList", "popup3", "width=500, height=500, left=500, top=100");
}

//등록 여부 확인 후 폼 전송
function checkForm() {
	
	let submit = confirm("등록하시겠습니까?");
	let resultSubmit = submit ? true : false;	// 삼항연산자
	return resultSubmit;
	
}
</script>

</html>