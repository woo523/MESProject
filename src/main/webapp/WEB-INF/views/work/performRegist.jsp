<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


div.side{ 
/*  height : 780px; */
 }  

div.content{ 
/*  height : 780px;  */
 } 
</style>
</head>
<body>

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">


function openilist(){
        window.open("${pageContext.request.contextPath }/order/itemList","popup", "width=500, height=500,left=100, top=100");
    }


function getPerformList(a,b){ // 해당 작업지시번호에 맞는 생산실적 ajax로 불러오기
	console.log("getPerformList 호출");
	var instrId = a;
// 	alert(instrId);

	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath }/work/Pflist",
		data : {"instrId" : instrId,
				"workNum" : b},
		dataType : "json",
		async : false, 
		/* 동기는 응답을 받을 때까지 기다렸다가 다음 작업을 하는 것 */
		/* 비동기는 요청에 대한 응답이 끝나기 전에 다음 작업을 먼저 함 */
		/* asyns는 기본 값이 true, false이면 응답이 끝나면 다음 작업을 수행하라는 의미 */
		success : function(array){
// 			alert("성공");
// 			alert("array.length"+ array.length);
			PerformListPrint(array);

		} //function(array) 
		
	}); // ajax
} 

function PerformListPrint(array){ // 해당 생산실적 출력

	var output ="<br>★ 선택한 작업지시 번호는 "+array[0].workNum+"입니다. <br>";
	output=output+"<div id='btn'><button id='add' onclick='pfRegi("+array[0].instrId+")'>실적 등록</button></div><br>";
	if(array[0].itemNum==null){
		output=output+"<총 0건><br>";
		output=output+"<table border='1'><tr id='th'><th>품번</th><th>품명</th><th>실적일</th><th>양불여부</th><th>실적수량</th><th>불량사유</th><th></th></tr>";
		output=output+"<tr id='con'><td colspan='6'> 해당 자료가 없습니다 </td> </tr>";
	}else{
		output=output+"<총 "+ array.length +"건><br>";
		output=output+"<table border='1'><tr id='th'><th>품번</th><th>품명</th><th>실적일</th><th>양불여부</th><th>실적수량</th><th>불량사유</th><th></th></tr>";
	for (var i=0; i<array.length; i++) {
	
		output=output+"<tr id='con'>";
		output=output+"<td><span id='a'>"+array[i].itemNum+"</span></td>";
		output=output+"<td>"+array[i].itemName+"</td>";
		output=output+"<td>"+array[i].performDate+"</td>";
		output=output+"<td>"+array[i].gbYn+"</td>";	
		output=output+"<td>"+array[i].performQty+"</td>";	
		output=output+"<td>"+array[i].dbReason+"</td>";
		output=output+"<td><img src='${pageContext.request.contextPath}/resources/image/modify.png' width='17px' onclick='openmodi("+array[i].performId+")'>";
		output=output+"<img src='${pageContext.request.contextPath}/resources/image/del.png' width='17px' onclick='delPf("+array[i].performId+")'></td>";
		output=output+"</tr>";
		
		}
	}
	output=output+"</table>";
	
	$("#PerformList_ajax").html(output); // innerHtml과 같은 역할

		
} //PerformListPrint(array)

function openmodi(a){ // 실적 수정창
        window.open("${pageContext.request.contextPath}/work/pfmodi?performId="+a,"popup", "width=500, height=500,left=100, top=100");
    }

function pfRegi(a){ // 실적 등록창
	window.open("${pageContext.request.contextPath}/work/pfInsert?instrId="+a,"popup", "width=500, height=500,left=100, top=100");
}


function delPf(a) {
	
	if(confirm("삭제하시겠습니까?")){
		alert("해당 실적이 삭제되었습니다.");
		location.href="${pageContext.request.contextPath}/work/del?performId="+a;
	}else{
		alert("취소되었습니다.");
	}}
	


$(function() {
	$("#sDate").datepicker({
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
	$("#eDate").datepicker({
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
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
	});
});
  


</script>
<!-- 스크립트 끝. -->




<div class="content_body"> <!-- 지우면안됨 -->
	<!-- 내용시작 -->
	
		<h1>실적등록</h1>
	<div class="search_bar">
	<form id="search">
	<div id="btn">
	<button>조회</button></div><br>
	<table id="search">
	<tr><td>라인</td>
	<td><select name="line"> <!-- 라인 리스트 완성되면 불러오기 -->
		<option value=""> 라인 전체</option>
		<c:forEach var="line" items="${linelist }">
		<option value="${line.lineName }">${line.lineName }</option>
		</c:forEach>
		</select></td>
	<td>지시일자</td>
	<td><input type="text" id="sDate" class="form-control" name="sdate" placeholder="날짜를 선택해주세요" readonly></td>
	<td><input type="text" id="eDate" class="form-control" name="edate" readonly></td>
	<td>품번</td>
	<td><input type="text" name="pcd" id="pcd" onclick="openilist()" placeholder="품번"></td>
	<td><input type="text" id="pnm" onclick="openilist()" placeholder="품명"></td></tr>
	<tr><td>지시상태</td>
	<td colspan="8">
	<input type="checkbox" name="ists1" value="지시"> 지시 
	<input type="checkbox" name="ists2" value="시작"> 시작 
	<input type="checkbox" name="ists3" value="마감"> 마감</td>
	</tr>
	</table>
	</form>
	</div>

	<br><br><br>
	<h2>작업지시</h2>
	<br>
	<table border="1" id="main">
	
	<tr id="th"><th>작업지시번호</th><th>라인</th><th>라인명</th><th>품번</th><th>품명</th><th>지시상태</th><th>지시일자</th><th>지시수량</th><th>수주번호</th><th>업체</th></tr>
	
	
	<c:forEach var="idto" items="${instrList }">
	<tr id="con" onclick="getPerformList(${idto.instrId },'${idto.workNum }')">
		<td>${idto.workNum }</td>
		<td>${idto.lineCd }</td>
	  	<td>${idto.lineName}</td>
	  	<td>${idto.itemNum}</td>
	  	<td>${idto.itemName}</td>
	 	<td>${idto.workSts}</td>
	  	<td>${idto.workDate}</td>
	  	<td>${idto.workQty}</td>
	  	<td>${idto.ordNum}</td>
	  	<td>${idto.ClientName}</td></tr>
	</c:forEach>

    </table>
    <br>
    <div id="pagination">
    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/work/performRegist?line=${search.line}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ists1=${search.ists1 }&ists2=${search.ists2 }&ists3=${search.ists3 }&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/work/performRegist?line=${search.line}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ists1=${search.ists1 }&ists2=${search.ists2 }&ists3=${search.ists3 }&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a id="num" href="${pageContext.request.contextPath }/work/performRegist?line=${search.line}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ists1=${search.ists1 }&ists2=${search.ists2 }&ists3=${search.ists3 }&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/work/performRegist?line=${search.line}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ists1=${search.ists1 }&ists2=${search.ists2 }&ists3=${search.ists3 }&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/work/performRegist?line=${search.line}&sdate=${search.sdate}&edate=${search.edate }&pcd=${search.pcd }&ists1=${search.ists1 }&ists2=${search.ists2 }&ists3=${search.ists3 }&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	</div>

	<br><br><br>
	<h2>생산실적</h2>


    <div id="PerformList_ajax">
	<table border="1">
	<tr id="th"><th>품번</th><th>품명</th><th>실적일</th><th>양불여부</th><th>실적수량</th><th>불량사유</th></tr>
	<tr id="con"><td colspan="6"> 실적 등록할 작업 지시를 클릭해주세요 </td></tr>
    </table>
    </div>

	
	













</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
