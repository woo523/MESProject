<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="/resources/js/jquery/jquery-3.6.3.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-ui-1.9.2.custom.js"></script>  
	<script type="text/javascript" src="/resources/js/jquery/jquery-migrate-1.4.1.min.js"></script>  
	<script type="text/javascript" src="/resources/js/jquery/jquery.cookie.js"></script> 
	<script type="text/javascript" src="/resources/js/jquery/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.mCustomScrollbar.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap/bootstrap-datetimepicker.ko.js"></script>
	
	
<style type="text/css">

/* body{ */
/* background-color: black; */
/* } */


/* span#sub{ */
/* 	color: white; */
/* 	font-size: 20pt; */
/* } */

/* span.sub{ */
/* 	border : 1px solid white; */
/* 	padding :5px; */
/* 	margin : 10px; */
/* } */

</style>

<script type="text/javascript">
$(document).ready(function(){
   
        var timer = setInterval(function(){
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth();
        var day = now.getDate();
        
        var hr=now.getHours();//시간
        var min=now.getMinutes();//분
        var sec=now.getSeconds();//초
        $("span.hour").text(hr);
        $("span.min").text(min);
        $("span.sec").text(sec);
        $("span.date").text(year+"년 "+month+"월 "+day+"일");
   
        //한자리 수일 경우 앞에 0을 붙혀 두자리 수로 유지.
        if(hr<10){
        $("span.hour").text("0"+hr);
        }
        if(min<10){
        $("span.min").text("0"+min);
        }
        if(sec<10){
       	$("span.sec").text("0"+sec);
        }            
        },1000); //1초마다 


});


</script>
</head>
<body>


<div id="clock">
현재 :  <span class="date"></span>
 <span class="hour">00</span>시
  <span class="min">00</span>분
      <span class="sec">00</span>초
</div>

<span id="sub" class="sub"> 실적 등록 </span>

<br>
실적 등록할 작업지시를 터치해주세요

	<table border="1" id="main">
	
	<tr id="th"><th>작업지시번호</th><th>라인명</th><th>품번</th><th>품명</th><th>지시상태</th><th>지시일자</th><th>지시수량</th><th>수주번호</th><th>업체</th><th>생산량</th><th>양품</th><th>불량</th></tr>
	
	
	<c:forEach var="idto" items="${instrList }">
	<tr id="con" onclick="location.href='${pageContext.request.contextPath }/work/popConfirm?instrId='+${idto.instrId}">
		<td>${idto.workNum }</td>
	  	<td>${idto.lineName}</td>
	  	<td>${idto.itemNum}</td>
	  	<td>${idto.itemName}</td>
	 	<td>${idto.workSts}</td>
	  	<td>${idto.workDate}</td>
	  	<td>${idto.workQty}</td>
	  	<td>${idto.ordNum}</td>
	  	<td>${idto.ClientName}</td>
	  	<td>${idto.pqty }</td>
	  	<td>${idto.Y }</td>
	  	<td>${idto.N }</td></tr>
	</c:forEach>

    </table>


    <div id="pagination">
    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/work/popPfRe?&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/work/popPfRe?&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a id="num" href="${pageContext.request.contextPath }/work/popPfRe?&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/work/popPfRe?&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/work/popPfRe?&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	</div>
</body>
</html>