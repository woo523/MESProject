	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/instruct/instrList.css" rel="stylesheet" type="text/css">
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

table#search {
 border:1px solid;
}

#pagination{
      width: 1125px;  
text-align: center;
}

#pcd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
}

#pnm {
	background-color: #EAEAEA;
	background-position:98%;
	border: 1px solid;
}

#ccd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#cnm {
	background-color: #EAEAEA;
	background-position:98%;
	border: 1px solid;
}

.form-control {
		width: 150px;
		background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
		background-repeat: no-repeat;
		background-position: 98%;
		border: 1px solid;

	}
	
.selectButtons tr, td{
 border:0px;
}
	
</style>

</head>
<body>


<div class="content_body">
	<!-- 내용시작 -->
<article>	
<h1>자재 입고 관리</h1>
	<form id="inmtrl">
	<div class="selectButtons">
			<button type="submit" id="submit">조회</button>
			<button type="button" onclick="insertBtn()">추가</button>
		</div>
	<table class="searchBox">
		<tr>
			<td>입고창고</td>
				<td><select name="whouse">
					<option value="" selected>전체</option>
					<option value="1">창고 1</option>
					<option value="2">창고 2</option>
					<option value="3">창고 3</option>
				</select></td>
			<td>입고일자</td>
			<td><input type="text" id="sDate" class="form-control" name="startDate" placeholder="날짜를 선택해주세요" readonly />
		   		<input type="text" id="eDate" class="form-control" name="endDate" readonly /></td>	
		</tr>
		<tr>
			<td>품번</td>
			<td><input type="text" name="pcd" id="pcd" placeholder="품번코드" onclick="openilist()">
				<input type="text" name="pnm" id="pnm" placeholder="품번명" readonly></td>
			<td>업체</td>
			<td><input type="text" name="ccd" id="ccd" placeholder="업체코드" onclick="openclist()">
				<input type="text" name="cnm" id="cnm" placeholder="업체명" readonly></td>
		</tr>
		</table>


	<br><br><br>
	<h1>자재 입고 목록</h1>
	<br>
	
	<div class="listButtons">
			<c:choose>
				<c:when test="${! empty interList}">
					<span>총 ${interSearchCount}건</span>
				</c:when>
			</c:choose>
			<button type="button">취소</button>
			<button type="button">저장</button>
		</div>
	
	<table border="1" class="inList">	
	<tr id="th">
		<th>입고번호</th><th>입고일자</th><th>품번</th><th>품명</th><th>단위</th>
		<th>입고창고</th><th>현재고</th><th>입고수량</th><th>업체코드</th>
		<th>업체명</th><th>입고LOT</th><th>비고</th>
		
	<c:forEach var="inte" items="${inmaterList}">
		<tr id="con" onclick="inmaterList(${inte.inmaterId})">
			<td>${inte.inmtrlNum}</td>
			<td>${inte.inmtrlDt}</td>
		  	<td>${inte.itemNum}</td>
		  	<td>${inte.itemName}</td>
		  	<td>${inte.itemUnit}</td>
		  	<td>${inte.stockwhouse}</td>
		  	<td>${inte.stockcur}</td>
		  	<td>${inte.inmtrlQty}</td>
		  	<td>${inte.clientCode}</td>
		  	<td>${inte.clientName}</td>
		  	<td>${inte.inmtrlLot}</td>
		  	<td>${inte.note}</td>
		</c:forEach>
			</tr>
		</table>
	</form>
</article>

   <br>
    <div id="pagination">
    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/material/inmaterList?whouse=${search.whouse}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ccd=${search.ccd }&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/material/inmaterList?whouse=${search.whouse}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ccd=${search.ccd }&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a id="num" href="${pageContext.request.contextPath }/material/inmaterList?whouse=${search.whouse}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ccd=${search.ccd }&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/material/inmaterList?whouse=${search.whouse}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ccd=${search.ccd }&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/material/inmaterList?whouse=${search.whouse}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ccd=${search.ccd }&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	</div>

<script type="text/javascript">

$(function() {
	$("#sDate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
			 ,showOtherMonths: true //빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
	           ,showMonthAfterYear:true // 월- 년 순서가 아닌 년도 - 월 순서
	           ,changeYear: true //option값 년 선택 가능
	           ,changeMonth: true //option값  월 선택 가능
	           ,buttonText: "선택" //버튼 호버 텍스트              
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

//오늘 버튼 패널 클릭 시 오늘 날짜 입력과 동시에 캘린더 닫힘
$('button.ui-datepicker-current').live('click', function() {
	$('#sDate, #eDate').datepicker('setDate', 'today').datepicker('hide').blur();
})

function openilist(){
    window.open("${pageContext.request.contextPath }/material/itemList","popup", "width=500, height=500,left=100, top=100");
}

function openclist(){
    window.open("${pageContext.request.contextPath }/material/clientList","popup", "width=500, height=500,left=100, top=100");
}

function openmodi(a){ // 수정창
    window.open("${pageContext.request.contextPath}/material/immodi?inmtrlId","popup", "width=500, height=500,left=100, top=100");
}

// 유효성 검사
$(document).ready(function() {
	$('#inmtrl').submit(function() {
		if($('#sDate').val() == "") {
			alert("입고일자를 선택해주세요.");
			$('#sDate').focus();
			
			return false;
		}
		
		if($('#pcd').val() == "") {
			alert("품번코드를 입력해주세요.");
			$('#pcd').focus();
			
			return false;
		}
		
// 		if($('#ccd').val() == "") {
// 			alert("업체코드를 입력해주세요.");
// 			$('#ccd').focus();
			
// 			return false;
// 		}
	});
});
</script>



</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->

