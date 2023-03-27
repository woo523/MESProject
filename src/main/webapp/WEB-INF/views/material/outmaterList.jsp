<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#btn{
	text-align:right;
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
#pagination{
      width: 1125px;  
text-align: center;
}


</style>

</head>
<body>


<div class="content_body"> <!-- 지우면안됨 -->
	<!-- 내용시작 -->
	
		<h1>자재 출고 관리</h1>
	<div class="search_bar">
	<form action="">
	
	<table id="btn">
		<tr><td><button>조회</button></td></tr>
	</table>
	
	<table id="search">
		<tr><td>출고일자</td>
			<td><input type="text" id="sDate" class="form-control" name="startDate" placeholder="날짜를 선택해주세요" readonly />
		   		<input type="text" id="eDate" class="form-control" name="endDate" readonly /></td>
			<td>출고창고</td>
			<td><select name="whouse">
				<option value="" selected>전체</option>
				<option value="1">창고 1</option>
				<option value="2">창고 2</option>
				<option value="3">창고 3</option>
		</select></td></tr>
		<tr><td>품번</td>
			<td><input type="text" name="pcd" id="pcd" class="form-control" placeholder="품번코드" onclick="openilist()"></td>
			<td><input type="text" name="pnm" id="pnm" class="form-control" placeholder="품번명" readonly></td>
			<td>업체</td>
			<td><input type="text" name="ccd" id="ccd" class="form-control" placeholder="업체코드" onclick="openclist()"></td>
			<td><input type="text" name="cnm" id="cnm" class="form-control" placeholder="업체명" readonly></td>
		</tr>
		</table>
	</form>
</div>

	<br><br><br>
	<h1>자재 출고 목록</h1>
	<br>
	<table border="1" id="main">	
	<tr id="th">
		<th>출고번호</th><th>출고일자</th><th>품번</th><th>품명</th><th>단위</th>
		<th>출고창고</th><th>현재고</th><th>출고수량</th><th>업체코드</th>
		<th>업체명</th><th>비고</th>
		
		<c:forEach var="outte" items="${outmaterList}">
	<tr id="con" onclick="outmaterList(${outte.outmaterId})">
			<td>${outte.outmtrlNum}</td>
			<td>${outte.outmtrlDt}</td>
		  	<td>${outte.itemNum}</td>
		  	<td>${outte.itemName}</td>
		  	<td>${outte.itemUnit}</td>
		  	<td>${outte.stockwhouse}</td>
		  	<td>${outte.stockcur}</td>
		  	<td>${outte.outmtrlQty}</td>
		  	<td>${outte.clientCode}</td>
		  	<td>${outte.clientName}</td>
		  	<td>${outte.note}</td>
		</c:forEach>
	</tr>
</table>
	

	<br><br><br>

	<table id="btn">
		<tr><td><button id="add" onclick="addNewRow()">추가</button>
				<button>수정</button>
				<button>삭제</button>
				<button>취소</button></tr>
	</table>

<script type="text/javascript">

$(function() {
	$("#sDate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
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
        	   $("input[name='endDate']").datepicker("option", "minDate", selectedDate );
           }
	});
});

$(function() {
	$("#eDate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
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


function openilist(){
    window.open("${pageContext.request.contextPath }/material/itemList","popup", "width=500, height=500,left=100, top=100");
}

function openclist(){
    window.open("${pageContext.request.contextPath }/material/clientList","popup", "width=500, height=500,left=100, top=100");
}
</script>


</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->

