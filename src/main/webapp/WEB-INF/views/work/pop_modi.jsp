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
	width:1430px;
	border-collapse: collapse;
	text-align: center;
	margin: 0px auto;
}


table#button,#in{
width:500px;
}

table#button td{
	border-top: 0px;
}

table#in td{
	border-top: 0px;
	padding: 15px;
}

th,td{
padding-bottom : 10px;
padding-top : 10px;
padding-left: 3px;
padding-right: 3px;
border-top: 1px solid white;
}

#clock{
text-align: right;
font-size: 22pt;
}

.popcontainer{
	width: 1450px;

	margin : 0px auto;
}



a{
	color : white;
	text-decoration-line :none;
}

span.change{
	border : 1px solid white; 
	padding :5px; 
	margin : 10px; 
}

#worker{
	text-align: right;
	font-size: 23pt;
	float: none;
}



#form{
	width: 720px;
	float: left;
	font-size: 50pt;
}

#keypad{
	width: 720px;
	float : left;
}

button{
	width: 150px;
	height: 150px;
	font-size: 65pt;
	border-radius: 20px;
	background-color: white;
	font-family: 'TheJamsil5Bold';

}

button.re{
	font-size: 25pt;
}

.Qty, .reason{
	width: 300px;
	height: 80px;

}



.reason{
font-size:30pt; 	
font-family: 'TheJamsil5Bold';"
}

div.reg{
	text-align: center;
}

#reg{
	font-family: 'TheJamsil5Bold';
	font-size: 35pt;
	color:red;
	width: 320px;
	height: 80px;
}

#green{
	color:green;
}

#red{
	color:red;
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
        
        
        
  		 
    	$('#insert').submit(function(){ // 유효성 검사

    	    if($('.Qty').val()==null||$('.Qty').val()==""){
    	    	alert("실적 수량을 입력하세요");
    			$('.Qty').focus();

    			return false;
    	    }
    	
    	
    	    if($('.Qty').val()<=0){
    	    	alert("실적 수량은 양수로 입력해주세요");
    			$('.Qty').focus();
    			return false;
    	    }
    	
    	    if($("input[name=gbYn]:checked").val() == null){
    	    	alert("양불여부를 선택하세요");
    			return false;
    	    }
    	   
    	    if($("input[name=gbYn]:checked").val() == "N"){ // 불량일때
    	    	if($('.reason').val()==null || $('.reason').val()==""){ // 불량사유 값 없으면
    	    		alert("불량사유를 선택하세요");
    	    		$('.reason').focus();
    	    		return false;
    	        }
    	    	}

    		});
  		 
    	// 기존 값 radio 및 select에 불러오기
    	var Reason = "${pfDTO.dbReason}";
    	var YB = "${pfDTO.gbYn}";

    	$("#dbReason").val(Reason).prop("selected",true); 
    	$("#"+YB).prop("checked", true);

    	if(YB=="Y"){ // 이미 불러와있는 값은 위의 click(function)이 안먹음, 다시 비활성화 설정
    		   $("select[name=dbReason]").attr("disabled",true);
    	}
        
        
        $("input:radio[name=gbYn]").click(function(){
        	 
            if($("input[name=gbYn]:checked").val() == "N"){
                $("select[name=dbReason]").attr("disabled",false);
     
            }else if($("input[name=gbYn]:checked").val() == "Y"){ //양품일때 불량사유 목록 비활성화
                  $("select[name=dbReason]").attr("disabled",true);

            }
        });
       
        $('.Qty').focus();

        $('#keypad button').click(function() {
            var val = $(this).val();
            var qty = $('.Qty').val();
            if ($(this).text() == "초기화") {
              $('.Qty').val("");
              $('input[name="gbYn"]').prop('checked', false);
              $('.reason').prop('selectedIndex', 0);
              $("select[name=dbReason]").attr("disabled", false);
            } else if ($(this).text() == "처음으로") {
              window.location.href = "${pageContext.request.contextPath }/work/popPfRe";
            } else if (qty.length < 5) {
              $('.Qty').val(qty + val).focus();
            }
          });
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
	<table id="main">
	
	<tr id="th"><th>작업지시번호</th><th>품번</th><th>품명</th><th>지시수량</th><th>생산량</th><th>양품</th><th>불량</th></tr>
	<tr id="con">
		<td>${inst.workNum }</td>
	  	<td>${inst.itemNum}</td>
	  	<td>${inst.itemName}</td>
	  	<td>${inst.workQty}</td>
	  	<td>${inst.pqty }</td>
	  	<td id="green">${inst.Y }</td>
	  	<td id="red">${inst.N }</td></tr>
    </table>
    <div id="form">
    <form action="${pageContext.request.contextPath }/work/popmodiPro" id="insert" method="post">  
    <input type="hidden" name="instrId" value="${inst.instrId}">
    <input type="hidden" name="preqty" value="${pfDTO.performQty}">
	<input type="hidden" name="preYn" value="${pfDTO.gbYn}">
	<input type="hidden" name="preitemId" value="${pfDTO.itemId}">
	<input type="hidden" name="performDate" value="${pfDTO.performDate}">
	<input type="hidden" name="performId" value="${pfDTO.performId}">
	
    <br>
   	<table id="in">
    <tr><td>수량</td><td><input type="number" name="performQty" class="Qty" style="font-size:50pt; 	font-family: 'TheJamsil5Bold';" value="${pfDTO.performQty}"></td></tr>
    <tr><td>양불</td><td><input type="radio" style="width:30px;height:30px;border:1px;" id="Y" name="gbYn" value="Y"> Y(양품)<br>
		<input type="radio"  style="width:30px;height:30px;border:1px;" id="N" name="gbYn" value="N"> N(불량)</td></tr>
    <tr><td>사유</td><td><select name="dbReason" id="dbReason" class="reason">
		<option value="" >불량사유 선택</option>
		<option value="파손">파손</option>
		<option value="스크래치">스크래치</option>
		<option value="포장불량">포장불량</option>
		<option value="찍힘">찍힘</option>
		<option value="제품 치수 이상">제품 치수 이상</option>
		<option value="기타">기타</option>
		</select></td></tr>
    </table>
    <br>
    <div class="reg"><input type="submit" id="reg" value="실적 수정하기"></div>
    </form>
    </div>
<br>
    <div id="keypad">
    <table id="button">
     <tr><td><button class="number" value="1">1</button></td>
        <td><button class="number" value="2">2</button></td>
        <td><button class="number" value="3">3</button></td></tr>
     <tr><td><button class="number" value="4">4</button></td>
         <td><button class="number" value="5">5</button></td>
         <td><button class="number" value="6">6</button></td></tr>
     <tr><td><button class="number" value="7">7</button></td>
         <td><button class="number" value="8">8</button></td>
         <td><button class="number" value="9">9</button></td></tr>
     <tr><td><button class="re">초기화</button></td>
         <td><button class="number" value="0">0</button></td>
         <td><button class="re">처음으로</button> </td></tr> 
         </table>
    </div>
    
    <br><br><br>
    <div id="worker">
현재 작업자 : ${sessionScope.name}
<span class="change"><a href="${pageContext.request.contextPath }/work/logout">작업자 변경 </a></span>
</div>
    
    </div>
    

</body>
</html>