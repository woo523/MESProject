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

.content_body span {
	color: red;
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
			<li>수주 <span>*</span>
					 <input type="hidden" id="ordId" name="ordId" placeholder="수주">
					 <input type="text" id="ordNum" name="ordNum" placeholder="수주번호" onclick="openOrd()">
					 <input type="hidden" id="orderDate" name="orderDate" placeholder="일자">
					 <input type="hidden" id="dlvryDate" name="dlvryDate" placeholder="예정일">
					 <input type="text" id="ordQty" name="ordQty" placeholder="수주량" onclick="openOrd()" readonly>
					 <input type="hidden" id="clientName" name="clientName" placeholder="수주업체"></li>
			<li>지시상태 <!-- 체크 해제 못하도록 막음 -->
				<input type="checkbox" name="workSts" value="지시" class="sCheck" checked="checked" onclick="return false;">지시
				<input type="checkbox" name="workSts" value="시작" class="sCheck">시작
				<input type="checkbox" name="workSts" value="마감" class="sCheck">마감</li>
			<li>제품 정보  <input type="hidden" id="itemId" name="itemId" placeholder="품목" readonly>
						   <input type="text" id="itemNum" name="itemNum" placeholder="품번" readonly>
					 	   <input type="text" id="itemName" name="itemName" placeholder="품명" readonly></li>
			<li>공정 정보 <span>*</span>
						  <input type="hidden" id="lineId"  name="lineId"> 
						  <input type="text" id="lineName" placeholder="라인 검색" onclick="openLine()" readonly>
						  <input type="text" id="linePlace" placeholder="작업장" readonly>
						  <input type="text" id="useChoice" placeholder="라인사용여부" readonly></li>
			<li>지시수량  <span>*</span>
						  <input type="number" id="instrCnt" name="instrCnt"></li>
		</ul>
		
		<div>
			<input type="submit" value="등록">
			<button type="reset">취소</button>
		</div>
	</form>
</div>
</body>

<script type="text/javascript">

$(document).ready(function () {
	
	// 지시일자 오늘 설정
	document.getElementById('instrDate').value = new Date().toISOString().substring(0, 10);
	
	// 지시상태 시작, 마감 체크 불가
	$("input[value='시작']").attr('disabled', true);
	$("input[value='마감']").attr('disabled', true);
})

//수주 검색 팝업창
function openOrd() {
	window.open("${pageContext.request.contextPath}/work/orderList", "popup1", "width=700, height=700, left=500, top=100");
}

// 라인 검색 팝업창
function openLine() {
	window.open("${pageContext.request.contextPath}/work/lineList", "popup3", "width=500, height=500, left=500, top=100");
}

//등록 여부 확인 후 폼 전송
function checkForm() {
	
	if($('#ordNum').val() == "") {
		alert("수주 정보를 입력해주세요.");
		$('#ordNum').focus();
		
		return false;
	}
	
	if($('#lineName').val() == "") {
		alert("공정 정보를 입력해주세요.");
		$('#lineName').focus();
		
		return false;
	}
	
	if($('#instrCnt').val() == "") {
		alert("지시수량을 입력해주세요.");
		$('#instrCnt').focus();
		
		return false;
	}
	
	let submit = confirm("등록하시겠습니까?");
	let resultSubmit = submit ? true : false;	// 삼항연산자
	return resultSubmit;
	
}
</script>

</html>