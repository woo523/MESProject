<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출하 등록</title>
<!-- 헤더 -->
<%@ include file="../inc/header2.jsp"%><!-- 지우면안됨 -->
<style type="text/css">

 table {
      width: 600px;  
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

table#insert {
 border:1px solid;
}
table#info {
 border:1px solid;
}


#btn{
      width: 600px; 
	text-align: right;
 
}
#pagination{
      width: 600px;  
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

#main{
	padding:40px;
}

</style>
</head>


<body>
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">


  function openitemlist(){
	    window.open("${pageContext.request.contextPath }/ship/itemInfo","popup", "width=500, height=500,left=100, top=100");
	}
	function userlist(){
	    window.open("${pageContext.request.contextPath }/ship/userList","popup", "width=500, height=500,left=100, top=100");
	}
	function openclntlist(){
	    window.open("${pageContext.request.contextPath }/ship/clntInfo","popup", "width=500, height=500,left=100, top=100");
	}
	function openshiplist(){
	    window.open("${pageContext.request.contextPath }/ship/shipInsert","popup", "width=500, height=500,left=100, top=100");
	}
	function openorderlist(){
	    window.open("${pageContext.request.contextPath }/order/orderMng","popup", "width=500, height=500,left=100, top=100");
	}

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
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='edate']").datepicker("option", "minDate", selectedDate );
           }
	});
});



$(function() {
	$("#shipDt").datepicker({
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



$(document).ready(function(){
	$('#insertOrder').submit(function() {
	
	if ($('#clntNm').val()=="") {
		alert("업체명을 입력하세요");
		$('#clntNm').focus();
		return false;
	}
	
	if ($('#dlvryDt').val()=="") {
		alert("납품예정일을 입력하세요");7
		$('#dlvryDt').focus();
		return false;
	}
	
	if ($('#userNm').val()=="") {
		alert("담당자를 입력하세요");
		$('#userNm').focus();
		return false;
	}
	
	if ($('#shipDt').val()=="") {
		alert("출하일자를 입력하세요");
		$('#shipDt').focus();
		return false;
	}
	
	if ($('#itemNum').val()=="") {
		alert("품번을 입력하세요");
		$('#clntNm').focus();
		return false;
	}
	
	if ($('#shipQty').val()=="") {
		alert("수량을 입력하세요");
		$('#shipQty').focus();
		return false;
	}
	

});
});

</script>

<div id="main" style="overflow: hidden;"> <!-- 지우면안됨 -->

<h2>출하정보</h2>
	
	<form id="insertShip"  action="${pageContext.request.contextPath }/ship/shipInsertPro" method="get">
		<div class="shipdetail">
			<div id="btn">
				<button type="reset">취소</button>
				<input type="submit" value="저장" class="submit">
			</div>
			<br>
			<table id="insert">
			<tr><td> <input type="hidden" name="insertId" id="insertId" value="${sessionScope.id}" readonly></td></tr> 
				<tr>
				<td>수주업체</td>
				<td>
					<input type="text" name="clntNm" id="clntNm" value="${ordlist.clntNm }" readonly>
					<input type="hidden" name="clntId" id="clntId" value="${ordlist.clntId }">
					</td>
				</tr>
				
				<tr>
				<td>납품예정일</td>
				<td><input type="text" id="dlvryDt" class="form-control" name="dlvryDt" value="${ordlist.dlvryDt }" readonly></td>
									
				<td>출하일자</td>
				<td><input type="date" id="shipDt" class="form-control" name="shipDt" placeholder="날짜를 선택해주세요" readonly></td>
				<td></td>

				<td></td>
				<td></td>
				</tr>
			</table>
		</div>	
<br>
<br>
			<h1>출하정보</h1>
	<div class="shiprinfo">
			<table id="info">
				<tr>
				<td>품번</td>
				<td><input type="hidden" name="itemId" id="itemId" value="${ordlist.itemId }" >
					<input type="text" name="itemNum" id="itemNum" value="${ordlist.itemNum }" readonly ></td>
				<td><input type="text" name= "itemNm" id="itemNm"  value="${ordlist.itemNm }" readonly ></td>
				<td><input type="text" name="invntUnit" id="invntUnit"  value="${ordlist.itemUnit }" readonly></td>
				</tr>
				<tr>
				<td>수주량</td>
				<td><input type="number" name="ordQty"  value="${ordlist.ordQty }" readonly></td>
				</tr>
				<tr>
				<td>재고량</td>
				<td><input type="number" name="curStock"  value="${ordlist.curStock }" readonly></td>
				</tr>
				<tr>
				<td>수량</td>
				<td><input type="number" name="shipQty" id="shipQty"  placeholder="필수입력"></td>
				</tr>
			</table>
			<br>
			<div id="btn">
				<button type="reset">취소</button>
				<input type="submit" value="저장" class="submit">
			</div>
	</div>
	</form>
	<br>

</div>

</body>
<!-- 푸터 -->
<%-- <%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 --> --%>
</html>