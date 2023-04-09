<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출하 수정</title>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<style type="text/css">

 table {
      width: 1125px;  
   } 

th,td{
border-bottom: 1px solid black;
padding: 10px;
}
#th {
	font-weight: bold;
}

#con {
	text-align: center;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}



h1{
	font-weight: bold;
}

.search_bar tr, td{
 border:0px;
}

table#search {
 border:1px solid;
}

table#detail {
 border:1px solid;
}
table#info {
 border:1px solid;
}


#btn{
      width: 1125px; 
	text-align: right;
 
}
#pagination{
      width: 1125px;  
text-align: center;
}

#num:hover{
	background-color : #e1e1e1;
}

.form-control{
	width:150px;
	background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#pcd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#pnm {
	background-color: #EAEAEA;
	border: 1px solid;
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
<br>
<h2>출하폼목 수정</h2>
<form action="${pageContext.request.contextPath}/ship/shupdatePro" method="post">
			<div id="btn">
				<button type="submit" >저장</button>
					
			</div>
			
	<table id="shupdate">
	<tr><td>변경자</td>
	<td> <input type="hidden" name="updateId" id="updateId" value="${sessionScope.id}" readonly></td></tr> 
	<tr><td> <input type="hidden" name="shipId" id="shipId" value="${shipDTO.ordId }" readonly></td></tr> 
	<tr><td>업체명</td>
	<td><input type="text" id="clntNm" name="clntNm" value="${shipDTO.clntNm }"  onclick="openClntList()">
		<input type="hidden" id="clntId" name="clntId" value="${shipDTO.clntId }">
		<input type="hidden" id="clntCd" name="clntCd" value="${shipDTO.clntCd }"></td></tr>
	<tr><td>출하일자</td>
	<td><input type="text" id="shipDt" name="shipDt" class="form-control" value="${shipDTO.shipDt }"></td></tr>
	<tr><td>담당자</td>
	<td><input type="text" id="userNm" name="userNm" value="${shipDTO.userNm }" onclick="openUserList()">
		<input type="hidden" id="userId" name="userId" value="${shipDTO.userId }" >
		<input type="hidden" id="userNum" name="userNum" value="${shipDTO.userNum }"  ></td></tr>
	<tr><td>납품예정일</td>
	<td><input type="text" id="dlvryDt" name="dlvryDt"  class="form-control" value="${shipDTO.dlvryDt }" ></td></tr>
	<tr><td>품번</td>
	<td><input type="hidden" id="itemId" name="itemId"  value="${shipDTO.itemId }" onclick="openItemList()">
		<input type="text" id="itemNum" name="itemNum" value="${shipDTO.itemNum }" onclick="openItemList()"></td></tr>
	<tr><td>품명</td>
	<td><input type="text" id="itemNm" name="itemNm" value="${shipDTO.itemNm }" readonly></td></tr>
	<tr><td>단위</td>
	<td><input type="text" id="invntUnit" name="invntUnit" value="${shipDTO.invntUnit }" readonly></td></tr>
	<tr><td>수량</td>
	<td><input type="text" id="shipQty" name="shipQty" value="${shipDTO.shipQty }"></td></tr>
	</table>
</form>	
</div>
<br>

</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
