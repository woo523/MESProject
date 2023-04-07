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
#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}

#pagination{
	text-align: center;
}
</style>
</head>

<body>
	<h2>수주 조회</h2>
	<form>
		<button type="submit" id="submit">조회</button>
		<table>
			<tr>
				<td>수주일자</td>
				<td><input type="text" id="sDate" class="form-control" name="startDate" readonly>
					<input type="text" id="eDate" name="endDate"></td>
				<td>수주업체</td>
				<td><input type="text" name="clientName"></td>
			</tr>
			<tr>
				<td>납품예정일</td>
				<td><input type="text" id="dDate" name="dlvryDate"> </td>
				<td>품번</td>
				<td><input type="text" id="itemNum" name="itemNum"></td>
			</tr>
		</table>
	</form>
	<table>
		<tr>
			<td>수주번호</td>
			<td>수주일자</td>
			<td>납품예정일</td>
			<td>품번</td>
			<td>품명</td>
			<td>수주수량</td>
			<td>수주업체</td>
		</tr>
		<c:forEach var="ordList" items="${getOrdList}">
			<input type="hidden" value="${ordList.ordId}">
			<input type="hidden" value="${ordList.itemDTO.itemId}">  
			<tr id="con"
				onclick="selectline('${ordList.orderMngDTO.ordId}','${ordList.orderMngDTO.ordNum}','${ordList.orderMngDTO.orderDate}','${ordList.orderMngDTO.dlvryDate}','${ordList.itemDTO.itemId}',
									'${ordList.itemDTO.itemNum}','${ordList.itemDTO.itemName}','${ordList.orderMngDTO.ordQty}','${ordList.clntDTO.clientName}')">
				<td>${ordList.orderMngDTO.ordNum}</td>
				<td>${ordList.orderMngDTO.orderDate}</td>
				<td>${ordList.orderMngDTO.dlvryDate}</td>
				<td>${ordList.itemDTO.itemNum}</td>
				<td>${ordList.itemDTO.itemName}</td>
				<td>${ordList.orderMngDTO.ordQty}</td>
				<td>${ordList.clntDTO.clientName}</td>
			</tr>
			<script type="text/javascript">
				
			</script>
		</c:forEach>
	</table>
</body>

<script>
function selectline(a, b, c, d, e, f, g, h, i) { // 부모창으로 값 넘기기
	
		opener.document.getElementById("ordId").value = a
		opener.document.getElementById("ordNum").value = b
		opener.document.getElementById("orderDate").value = c
		opener.document.getElementById("dlvryDate").value = d
		opener.document.getElementById("itemId").value = e
		opener.document.getElementById("itemNum").value = f
		opener.document.getElementById("itemName").value = g
		opener.document.getElementById("ordQty").value = h
		opener.document.getElementById("clientName").value = i
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
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
	});
});
</script>
</html>