<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%@ include file="../inc/header2.jsp"%><!-- 지우면안됨 -->
<style type="text/css">

@import
	url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
	;
	
	
body{
	font-family: 'NanumSquare', sans-serif;
}


table {
	margin : 0px auto;
	border: 1px #a39485 solid;
	font-size: 1em;
	width: 425px;
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

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}
h1{
	padding-left: 40px;
	padding-top: 10px;
	font-size: 22.5px;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}
#btn{
	width: 500px; 
	text-align: center;
	margin: 0px auto;
}

#clntNm {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
}
#userNm {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
}
#itemNum {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
}
#itemNm {
	background-color: #EAEAEA;
	background-position:98%;
	border: 1px solid;
}
#invntUnit {
	background-color: #EAEAEA;
	background-position:98%;
	border: 1px solid;
}

.form-control{
	background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

.content_body input {
   height: 20px;
}
table #update{
border: 1px solid #a39485;
padding: auto;
margin: auto;
}

</style>
</head>


<body>

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
function openItemList(b){
    window.open("${pageContext.request.contextPath }/order/itemList","popup", "width=500, height=500,left=100, top=100");
}
function openUserList(b){
    window.open("${pageContext.request.contextPath }/order/userList","popup", "width=500, height=500,left=100, top=100");
}
function openClntList(b){
    window.open("${pageContext.request.contextPath }/order/clntList","popup", "width=500, height=500,left=100, top=100");
}
$(function() {
	$("#orderDt").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='dlvryDt']").datepicker("option", "minDate", selectedDate );
           }
	});
});



$(function() {
	$("#dlvryDt").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
//            ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
	});
});

</script>
<!-- 스크립트 끝. -->

<div class="content_body"> <!-- 지우면안됨 -->
<h1>수주폼목 수정</h1>
<form action="${pageContext.request.contextPath}/order/updatePro" method="post">

	<table id="update">
	<tr><td>업체명</td>
	<td><input type="text" id="clntNm" name="clntNm" value="${orderDTO.clntNm }"  onclick="openClntList()">
	<input type="hidden" name="updateId" id="updateId" value="${sessionScope.id}" readonly>
	 <input type="hidden" name="ordId" id="ordId" value="${orderDTO.ordId }" readonly>
		<input type="hidden" id="clntId" name="clntId" value="${orderDTO.clntId }">
		<input type="hidden" id="clntCd" name="clntCd" value="${orderDTO.clntCd }"></td></tr>
	<tr><td>수주일자</td>
	<td><input type="text" id="orderDt" name="orderDt" class="form-control" value="${orderDTO.orderDt }" size="20"></td></tr>
	<tr><td>담당자</td>
	<td><input type="text" id="userNm" name="userNm" value="${orderDTO.userNm }" onclick="openUserList()">
		<input type="hidden" id="userId" name="userId" value="${orderDTO.userId }" >
		<input type="hidden" id="userNum" name="userNum" value="${orderDTO.userNum }"  ></td></tr>
	<tr><td>납품예정일</td>
	<td><input type="text" id="dlvryDt" name="dlvryDt"  class="form-control" value="${orderDTO.dlvryDt }" ></td></tr>
	<tr><td>품번</td>
	<td><input type="hidden" id="itemId" name="itemId"  value="${orderDTO.itemId }" onclick="openItemList()">
		<input type="text" id="itemNum" name="itemNum" value="${orderDTO.itemNum }" onclick="openItemList()"></td></tr>
	<tr><td>품명</td>
	<td><input type="text" id="itemNm" name="itemNm" value="${orderDTO.itemNm }" readonly></td></tr>
	<tr><td>단위</td>
	<td><input type="text" id="invntUnit" name="invntUnit" value="${orderDTO.invntUnit }" readonly></td></tr>
	<tr><td>수량</td>
	<td><input type="text" id="ordQty" name="ordQty" value="${orderDTO.ordQty }"></td></tr>
	</table>
	<div id="btn">
				<button type="submit" >저장</button>
			</div>
</form>	
<br>
			
			
</div>
<br>

</body>