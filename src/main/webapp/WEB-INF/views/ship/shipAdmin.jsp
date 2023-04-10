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

h2 {
  text-align: left;
  margin-bottom: 30px;
}

.shipinfo tr, td{
 border:0px;
}

table#searchBox {
 border:1px solid;
}

table#detail {
 border:1px solid;
}
table#info {
 border:1px solid;
}


#selectButtons, #button{
      width: 1125px; 
	text-align: right;
 
}

.pagination {
  display: inline-block;
}


.pagination a{
     color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
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


<script type="text/javascript">
  $(function() {
    $( ".datepicker" ).datepicker();
  });
  $(function() {
	    $( ".datepicker1" ).datepicker1();
	  });
function openitemlist(){
    window.open("${pageContext.request.contextPath }/ship/itemInfo","popup", "width=500, height=500,left=100, top=100");
}
function userlist(){
    window.open("${pageContext.request.contextPath }/order/userList","popup", "width=500, height=500,left=100, top=100");
}
function openclntlist(){
    window.open("${pageContext.request.contextPath }/ship/clntInfo","popup", "width=500, height=500,left=100, top=100");
}
function openshiplist(){
    window.open("${pageContext.request.contextPath }/ship/shipInfo","popup", "width=500, height=500,left=100, top=100");
}
function openorderlist(){
    window.open("${pageContext.request.contextPath }/order/orderMng","popup", "width=500, height=500,left=100, top=100");
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
	$("#Shdate").datepicker({
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
  
$(document).ready(function () {
	// class = "brown" 클릭했을 때 "클릭"
	$('.searchBox').click(function () {
	
	// 자바스크립트 배열(json) <= DB에서 가져옴
	var arr = [
			   {"subject":"제목1","date":"2023-01-01"},
			   {"subject":"제목2","date":"2023-01-02"},
			   {"subject":"제목3","date":"2023-01-03"}
			  ];
	
	// 초기화
	$('table').html('');
	
	$.ajax({
		url:'${pageContext.request.contextPath}/board/listjson', 			// json형태로 들고옴 (페이지에 가서)
		dataType:'json',			// json형태로 받아옴 (json형태)
		success:function(arr){ 		// json형태로 만든 arr를 가져옴
		
					// 반복해서 출력 .each()
					// arr 배열을 반복하겠다 반복할때의 기능은 어떻게 할건지?
					$.each(arr,function(index, item){
					// 클릭을 하면 0,1,2번 배열을 반복함
//	 				alert(index);
//	 				alert(item.subject);
//	 				alert(item.date);

					// 변수이기에 +로 연결시켜줘야 함
					// 기존내용 없애고 그자리에 새로 넣기, 마지막 게 나옴 ,하나에 덮어서 써진다
//	 				$('table').html('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
					
					// 추가하겠다는 함수 다시 사용 (html -> append로 바꾸기)
					$('table').append('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
				});
			}
		});
	});
});

</script>


<div class="content_body">

	<h2>출하정보</h2>
	<div class="shipinfo">
	<form id="info">
		<div id="selectButtons">
			<button type="submit">조회</button>
			<button type="reset">취소</button>
			<button type="button" onclick="openshiplist(${shipDTO.shipId})">추가</button>
		</div>
		
			<table id="searchBox">
				<tr>
				<td>담당자</td>
				<td><input type="text" name="userNm" id="userNm" onclick="userlist()">
					<input type="hidden" name="userId" id="userId"value="">
					<input type="hidden" name="userNum" id="userNum" value=""></td>
				<td>출하업체</td>
				<td><input type="text" name="clntNm" id="clntNm" onclick="openclntlist()">
					<input type="hidden" name="clntId" id="clntId" value="">
					<input type="hidden" name="clntCd" id="clntCd" value=""></td></tr>
					
				<tr>
				<td>납품예정일</td>
				<td><input type="text" id="Dlvdate" class="form-control" name="Dlvdate" placeholder="날짜를 선택해주세요" readonly></td>
				<td><input type="text" id="eDlvdate" class="form-control" name="eDlvdate" readonly></td>
				</tr>
				<tr>						
				<td>출하일자</td>
				<td><input type="text" id="sshdate" class="form-control" name="sshdate" placeholder="날짜를 선택해주세요" readonly></td>
				<td><input type="text" id="Shdate" class="form-control" name="Shdate" readonly></td>
				</tr>
				
			</table>
		</form>
	</div>	
		<br>
		<br>
		<br>
		
			
		
		
		<h2>목록</h2>
		<div class="listButtons">
			<button type="button">삭제</button>
		</div>
		
		<table border="1" id="main">
			<tr id="th">
				<th>등록자</th>
				<th>출하번호</th>
				<th>납품예정일</th>
				<th>출하일자</th>
				<th>품번</th>
				<th>품명</th>
				<th>출하고객</th>
			</tr>
			
			<c:forEach var="sdto" items="${shipList}">
						<tr onclick="location.href='${pageContext.request.contextPath}/ship/shipInfo?shipId=${sdto.shipId}'">
							<td>${sdto.userNm}</td>
							<td>${sdto.shipNum}</td>
							<td>${sdto.dlvryDt}</td>
							<td>${sdto.shipDt}</td>
							<td>${sdto.itemNum}</td>
							<td>${sdto.itemName}</td>
							<td>${sdto.clntCd}</td>
						</tr>
			</c:forEach>
		</table>
	
    <br>
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
<h1><a href="${pageContext.request.contextPath }/ship/shipInfo">추가</a></h1>




	
</div>


<!-- <footer> -->
	<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
<!-- </footer> -->

</body>

</html>