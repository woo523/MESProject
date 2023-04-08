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

@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

body{
	font-family: 'TheJamsil5Bold';
	font-size: 20pt;
	background-color: black;
	color : white;
	margin-top: 50px;
}

table{
	text-align: center;
}

th,td{
padding-bottom : 10px;
padding-top : 10px;
padding-left: 3px;
padding-right: 3px;
border-top: 1px solid white;
}

td:hover{
	cursor: pointer;
}
.popcontainer{
	width: 1600px;

	margin : 0px auto;
}

span.sub{
	border : 1px solid white; 
	padding :5px; 
	margin : 10px; 
	font-size: 30pt;
} 

span.change{
	border : 1px solid white; 
	padding :5px; 
	margin : 10px; 
}

#touch{
color : yellow;
text-align: center;
font-size: 25pt;
}

table{
	margin: 0px auto;
}

#clock{
text-align: right;
font-size: 22pt;
}

#pagination{
	text-align: center;
}

a{
	color : white;
	text-decoration-line :none;
}

#t{
	color : red;
}

table{
	width:1550px;
	border-collapse: collapse;
}

#ji{
	color:yellow;
}
#si{
	color:green;
}
#ma{
	color:red;
}

#worker{
	text-align: right;
	font-size: 23pt;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
   
        var timer = setInterval(function(){
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth()+1;
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

<c:if test="${empty sessionScope.id }">
	<c:redirect url="${pageContext.request.contextPath }/work/poplogin"></c:redirect>
</c:if>

<div class = popcontainer>
	<div id="clock">
현재시간 :  <span class="date"></span>
 <span class="hour">00</span>시
  <span class="min">00</span>분
      <span class="sec">00</span>초
	</div>
<br>


<a href="${pageContext.request.contextPath }/work/popPfRe"><span id="sub" class="sub"> 실적 등록</span></a>

<br><br>
<div id="touch">실적을 등록할 작업지시를 <span id="t">터치</span>해주세요</div>
<br>


	<table id="main">
	<tr id="th"><th>작업지시번호</th><th>라인명</th><th>품명</th><th>지시상태</th><th>지시일자</th><th>지시수량</th><th>생산량</th><th>양품</th><th>불량</th><th>수주번호</th><th>업체</th></tr>
	
	
	<c:forEach var="idto" items="${instrList }">
	<tr id="con" onclick="location.href='${pageContext.request.contextPath }/work/popConfirm?instrId='+${idto.instrId}">
		<td>${idto.workNum }</td>
	  	<td>${idto.lineName}</td>
	  	<td>${idto.itemName}</td>
	  	<c:if test="${idto.workSts eq '지시'}">
	 	<td id="ji">${idto.workSts}</td></c:if>
	 	<c:if test="${idto.workSts eq '시작'}">
	 	<td id="si">${idto.workSts}</td></c:if>
	 	<c:if test="${idto.workSts eq '마감'}">
	 	<td id="ma">${idto.workSts}</td></c:if>
	  	<td>${idto.workDate}</td>
	  	<td>${idto.workQty}</td>
	  	<td>${idto.pqty }</td>
	  	<td id="si">${idto.Y }</td>
	  	<td id="ma">${idto.N }</td>
	  	<td>${idto.ordNum}</td>
	  	<td>${idto.ClientName}</td></tr>
	</c:forEach>

    </table>
	<br>

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
	<br>
<div id="worker">
현재 작업자 : ${sessionScope.name}
<span class="change"><a href="${pageContext.request.contextPath }/work/logout">작업자 변경 </a></span>
</div>

</div>
</body>
</html>