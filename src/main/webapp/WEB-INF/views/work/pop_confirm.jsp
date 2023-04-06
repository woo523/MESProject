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

.popcontainer{
	width: 1450px;

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

table{
	width:1200px;
	margin: 0px auto;
	border-collapse: collapse;
}

#clock{
text-align: right;
font-size: 22pt;
}

#worker{
	text-align: right;
	font-size: 23pt;
}

a{
	color : white;
	text-decoration-line :none;
}
#ye{
	color: yellow;
	text-align: center;
	font-size: 25pt;
}

#yn{
	text-align: center;
}

button{
	width: 100px;
	height: 50px;
	font-size: 20pt;
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



function modi(a,b) {
	
	if(confirm("해당 실적을 수정하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/work/popmodi?performId="+a+"&instrId="+b;
	}else{
		alert("취소되었습니다.");
	}}
	
	
function delPf(a) {
	
	if(confirm("삭제하시겠습니까?")){
		alert("해당 실적이 삭제되었습니다.");
		location.href="${pageContext.request.contextPath}/work/popdel?performId="+a;
	}else{
		alert("취소되었습니다.");
	}}




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

<span id="sub" class="sub"> 실적 등록</span>

<br>
<br>
<br>


	<table id="main">
	
	<tr id="th"><th>작업지시번호</th><th>품번</th><th>품명</th><th>지시수량</th><th>생산량</th><th>양품</th><th>불량</th></tr>
	
	

	<tr id="con">
		<td>${inst.workNum }</td>
	  	<td>${inst.itemNum}</td>
	  	<td>${inst.itemName}</td>
	  	<td>${inst.workQty}</td>
	  	<td>${inst.pqty }</td>
	  	<td>${inst.Y }</td>
	  	<td>${inst.N }</td></tr>


    </table>
    <br>
    <div id="ye">선택한 작업 지시 및 품명이 맞나요?</div>
    <br>
    
    <div id="yn">
    <button onclick="location.href='${pageContext.request.contextPath }/work/popInsert?instrId=${inst.instrId}'">예</button>
     &nbsp;&nbsp;<button onclick="history.back()">아니오</button></div>
    <br><br>
    실적 등록 현황
    <br>
    <br>
    <table>
    <tr id="th"><th>실적일</th><th>양불여부</th><th>실적수량</th><th>불량사유</th><th>등록자</th><th></th></tr>
	<c:choose>
    <c:when test="${empty pflist}">
    <tr><td colspan="5"> 등록된 실적이 없습니다.</td></tr>
    </c:when>
    <c:otherwise>
    <c:forEach var="pdto" items="${pflist }">
    <tr><td>${pdto.performDate}</td><td>${pdto.gbYn}</td><td>${pdto.performQty}</td><td>${pdto.dbReason}</td><td>${pdto.name}</td>
    <td><img src="${pageContext.request.contextPath}/resources/image/whitemodify.png" width="35px" onclick="modi(${pdto.performId},${inst.instrId})">
    <img src="${pageContext.request.contextPath}/resources/image/whitedel.png" width="34px" height="34px" onclick="delPf(${pdto.performId})"></td></tr>
   </c:forEach>
   </c:otherwise>
   </c:choose>
    </table>
    <br>
    <div id="worker">
현재 작업자 : ${sessionScope.name}
<span class="change"><a href="${pageContext.request.contextPath }/work/logout">작업자 변경 </a></span>
</div>
    
    
    
</div>
</body>
</html>