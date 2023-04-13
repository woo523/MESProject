<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출하관리</title>
	<!-- <header> -->
	<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
	
	<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon-16x16.png">
	
	
<style type="text/css">

 table {
      width: 1125px;  
   } 
   
   #count{
	text-align: right;
	width: 1125px;
}

th,td{
border-bottom: 1px solid black;
padding: 10px;
}
#main{
	text-align: center;
}
#th {
	font-weight: bold;
	text-align: center;
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
	font-size: 22.5px;
}

.search_bar tr, td{
 border:0px;
}

table#search {
 border:1px solid;
}

#btn{
    width: 1125px; 
	text-align: right;
	 cursor : pointer;
 
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


#clntNm {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
}
#userNm{
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
}

/* 페이징 */


#pagination {

  display: inline-block;
}

#pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}



#pagination a.active {
	background-color: #b9b9b9;
  color: white;
  border: 1px solid #b9b9b9;
}

#pagination a:hover:not(.active,.none) {background-color: #ddd;}

.center {
  text-align: center;
  width:1125px;
}
.search_bar input {
   height: 20px;
}
#modify,#del{
 cursor : pointer;
}

</style>
</head>

<body>


<script type="text/javascript">
  $(function() {
    $( ".datepicker" ).datepicker();
  });
  $(function() {
	    $( ".datepicker1" ).datepicker1();
	  });
function openitemlist(b){
    window.open("${pageContext.request.contextPath }/ship/itemInfo","popup", "width=500, height=500,left=100, top=100");
}
function userlist(b){
    window.open("${pageContext.request.contextPath }/order/userList","popup", "width=500, height=500,left=100, top=100");
}
function openclntlist(b){
    window.open("${pageContext.request.contextPath }/ship/clntInfo","popup", "width=500, height=500,left=100, top=100");
}
// function openshiplist(){
//     window.open("${pageContext.request.contextPath }/ship/shipInsert","popup", "width=700, height=600,left=500, top=200");
// }
function openInfo(a){ 
	window.open("${pageContext.request.contextPath}/ship/shipInfo?shipId="+a,"popup2", "width=600, height=600,left=100, top=100");
}

function insertShip(a){
window.open("${pageContext.request.contextPath }/ship/shipInsert?ordId="+a,"popup", "width=700, height=600,left=500, top=200");
}

$(function() {
	$("#sshdate").datepicker({
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
	$("#Dlvdate").datepicker({
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
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='edate']").datepicker("option", "minDate", selectedDate );
           }
	});
});

$(function() {
	$("#eDlvdate").datepicker({
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


<div class="content_body">

	<h1>출하관리</h1>
	<div class="search_bar">
	<form id="search">
		<div id="btn">
			<button type="submit">조회</button>
<!-- 			<button type="reset">취소</button> -->
<%-- 			<button type="button" onclick="openshiplist(${shipDTO.shipId})">추가</button> --%>
		</div>
		<br>
			<table id="search">
				<tr>

				<td>수주업체</td>
				<td><input type="text" name="clntNm" id="clntNm" onclick="openclntlist()">
					<input type="hidden" name="clntId" id="clntId" value="">
					<input type="hidden" name="clntCd" id="clntCd" value=""></td></tr>
					
				<tr>
				<td>납품예정일</td>
				<td><input type="text" id="Dlvdate" class="form-control" name="Dlvdate" placeholder="날짜를 선택해주세요" readonly> ~ <input type="text" id="eDlvdate" class="form-control" name="eDlvdate" readonly></td>
				<td></td>
				</tr>
				
			</table>
		</form>
	</div>	
		<br>
				
		
		<h1>목록</h1>
		<div id="count">총 ${pageDTO.count } 건</div>
		<br>
		
		<table border="1" id="main">
			<tr id="th">
				<th>수주번호</th>
				<th>수주일자</th>
				<th>납품예정일</th>
				<th>품번</th>
				<th>품명</th>
				<th>수주량</th>
				<th>현재고</th>
				<th>출하량</th>
				<th>수주업체</th>
				<th>출하</th>
			</tr>
			
			<c:choose>
				<c:when test="${empty shipAdmin1}">
					<tr><td colspan="15"></td></tr>
					<tr>
						<td colspan="15">해당 데이터가 존재하지 않습니다.</td>
					</tr>
				</c:when>
			
			<c:otherwise>
			<c:forEach var="sdto" items="${shipAdmin1}">
						<tr onclick="openInfo(${sdto.ordNum})">
							<td>${sdto.ordNum}</td>
							<td>${sdto.orderDt}</td>
							<td>${sdto.dlvryDt}</td>
							<td>${sdto.itemNum}</td>
							<td>${sdto.itemNm}</td>
							<td>${sdto.ordQty}</td>
							<td>${sdto.curStock}</td>
							<td>${sdto.shipQty}</td>
							<td>${sdto.clntNm}</td>
							<td><button onclick="insertShip(${sdto.ordId})">출하</button></td>
						</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	
    <br>
    <div class="center">
    <div id="pagination">
    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/ship/shipAdmin?userNm=${search.userNm}&shipNum=${search.shipNum}&Dlvdate=${search.Dlvdate }&eDlvdate=${search.eDlvdate }&sshdate=${search.sshdate}&Shdate=${search.Shdate }&itemNum=${search.itemNum }&itemNm=${search.itemNm }&clntNm=${search.clntNm }&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/ship/shipAdmin?userNm=${search.userNm}&shipNum=${search.shipNum}&Dlvdate=${search.Dlvdate }&eDlvdate=${search.eDlvdate }&sshdate=${search.sshdate}&Shdate=${search.Shdate }&itemNum=${search.itemNum }&itemNm=${search.itemNm }&clntNm=${search.clntNm }&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a id="num" href="${pageContext.request.contextPath }/ship/shipAdmin?userNm=${search.userNm}&shipNum=${search.shipNum}&Dlvdate=${search.Dlvdate }&eDlvdate=${search.eDlvdate }&sshdate=${search.sshdate}&Shdate=${search.Shdate }&itemNum=${search.itemNum }&itemNm=${search.itemNm }&clntNm=${search.clntNm }&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/ship/shipAdmin?userNm=${search.userNm}&shipNum=${search.shipNum}&Dlvdate=${search.Dlvdate }&eDlvdate=${search.eDlvdate }&sshdate=${search.sshdate}&Shdate=${search.Shdate }&itemNum=${search.itemNum }&itemNm=${search.itemNm }&clntNm=${search.clntNm }&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/ship/shipAdmin?userNm=${search.userNm}&shipNum=${search.shipNum}&Dlvdate=${search.Dlvdate }&eDlvdate=${search.eDlvdate }&sshdate=${search.sshdate}&Shdate=${search.Shdate }&itemNum=${search.itemNum }&itemNm=${search.itemNm }&clntNm=${search.clntNm }&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	</div>
<br>





	
</div>
</div>


<!-- <footer> -->
	<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
<!-- </footer> -->

</body>

</html>