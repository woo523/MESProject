<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>

<link href="/resources/css/jquery/jquery-ui.min.css" rel="stylesheet" type="text/css"  />
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap-datetimepicker.min.css"  media="screen">

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
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
	
body{
	font-family: 'NanumSquare', sans-serif;
}

form {
	width: 850px;
	height: 100%;
	margin: 0px auto;
}

table.ordSearch {
	clear: right;
	width: 850px;
	margin : 0px auto;
	margin-bottom: 15px;
	border: 1px #a39485 solid;
}

table.ordList {
	margin : 0px auto;
	border: 1px #a39485 solid;
	font-size: 1em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 850px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: center;
	background: #b9b9b9;
	font-weight: 700;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

.ordList td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}

h2 {
	text-align: center;
}

input {
	height: 20px;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}

.ordSearch .form-control {
	width: 150px;
	background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#submit {
	margin: 10px 0px 10px 0px;
	float: right;
}
</style>
</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header3.jsp" />
<!-- </header> -->

	<h2>수주 조회</h2>
	<form>
		<button type="submit" id="submit">조회</button>
		<table class="ordSearch">
			<tr>
				<td>수주일자</td>
				<td><input type="text" id="sDate" class="form-control" name="startDate" placeholder="시작" readonly>
					<input type="text" id="eDate" class="form-control" name="endDate" placeholder="마감" readonly></td>
				<td>수주업체</td>
				<td><input type="text" name="clientName"></td>
			</tr>
			<tr>
				<td>납품예정일</td>
				<td><input type="text" id="dDate" class="form-control" name="dlvryDate"> </td>
				<td>품번</td>
				<td><input type="text" id="itemNum" name="itemNum"></td>
			</tr>
		</table>
		<table class="ordList">
			<tr>
				<th>수주번호</th>
				<th>수주일자</th>
				<th>납품예정일</th>
				<th>품번</th>
				<th>품명</th>
				<th>수주수량</th>
				<th>수주업체</th>
			</tr>
			<c:forEach var="ordList" items="${getOrdList}">
				<input type="hidden" value="${ordList.ordId}">
				<input type="hidden" value="${ordList.itemDTO.itemId}">
				<input type="hidden" value="${ordList.stockDTO.stockCur}">
				<tr id="con"
					onclick="selectline('${ordList.orderMngDTO.ordId}','${ordList.orderMngDTO.ordNum}','${ordList.orderMngDTO.orderDate}','${ordList.orderMngDTO.dlvryDate}','${ordList.itemDTO.itemId}',
										'${ordList.itemDTO.itemNum}','${ordList.itemDTO.itemName}','${ordList.orderMngDTO.ordQty}','${ordList.clntDTO.clientName}','${ordList.stockDTO.stockCur}')">
					<td>${ordList.orderMngDTO.ordNum}</td>
					<td>${ordList.orderMngDTO.orderDate}</td>
					<td>${ordList.orderMngDTO.dlvryDate}</td>
					<td>${ordList.itemDTO.itemNum}</td>
					<td>${ordList.itemDTO.itemName}</td>
					<td>${ordList.orderMngDTO.ordQty}</td>
					<td>${ordList.clntDTO.clientName}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>

<script>
function selectline(a, b, c, d, e, f, g, h, i, j) { // 부모창으로 값 넘기기
	
		opener.document.getElementById("ordId").value = a
		opener.document.getElementById("ordNum").value = b
		opener.document.getElementById("orderDate").value = c
		opener.document.getElementById("dlvryDate").value = d
		opener.document.getElementById("itemId").value = e
		opener.document.getElementById("itemNum").value = f
		opener.document.getElementById("itemName").value = g
		opener.document.getElementById("ordQty").value = h
		opener.document.getElementById("clientName").value = i
		opener.document.getElementById("stockCur").value = j
		window.close();

}

$(function() {
	$("#sDate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가 아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능     
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시여부
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='endDate']").datepicker("option", "minDate", selectedDate );
           }
	});
});

$(function() {
	$("#eDate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가 아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
	});
});

//오늘 버튼 패널 클릭 시 오늘 날짜 입력과 동시에 캘린더 닫힘
$('button.ui-datepicker-current').live('click', function() {
	$('#sDate').datepicker('setDate', 'today').datepicker('hide').blur();
})

$(function() {
	$("#dDate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가 아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,showButtonPanel: false // 캘린더 하단에 버튼 패널 표시
           ,closeText: '닫기' // 닫기 버튼 패널
	});
});
</script>
</html>