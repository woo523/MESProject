<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

ul{
	list-style-type: none;
}

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
        
        
        // 현재 날짜 hidden input박스에 넣기
         var today = new Date(); // 오늘 날짜
  		 var year = today.getFullYear(); // 년도 YYYY
 		 var month = ("0"+(today.getMonth()+1)).slice(-2); // 달 MM
 		 var date = ("0"+today.getDate()).slice(-2); // 일 DD
  		 var today = year+"-"+month+"-"+date; // YYYY-MM-DD
        $('input[name=performDate]').attr('value',today);
        
        
        
        
        $("input:radio[name=gbYn]").click(function(){
        	 
            if($("input[name=gbYn]:checked").val() == "N"){
                $("select[name=dbReason]").attr("disabled",false);
     
            }else if($("input[name=gbYn]:checked").val() == "Y"){ //양품일때 불량사유 목록 비활성화
                  $("select[name=dbReason]").attr("disabled",true);

            }
        });
       
        $('.qty').focus();

        $('#keypad button').click(function() {
            var val = $(this).val();
            var qty = $('.qty').val();
            if ($(this).text() == "초기화") {
              $('.qty').val("");
              $('input[name="gbYn"]').prop('checked', false);
              $('.reason').prop('selectedIndex', 0);
              $("select[name=dbReason]").attr("disabled", false);
            } else if ($(this).text() == "처음으로") {
              window.location.href = "${pageContext.request.contextPath }/work/popPfRe";
            } else if (qty.length < 5) {
              $('.qty').val(qty + val).focus();
            }
          });
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
<br>
	<table border="1" id="main">
	
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
    <div id="form">
    <form action="${pageContext.request.contextPath }/work/PopinsertPro">
    <input type="hidden" name="instrId" value="${inst.instrId}">
    <input type="hidden" name="performDate" value="">
    <ul>
    <li>수량 : <input type="number" name="performQty" class="qty"> </li>
    <li>양불 :<input type="radio" name="gbYn" value="Y"> Y(양품)
		<input type="radio"  name="gbYn" value="N"> N(불량)</li>
    <li>사유 : <select name="dbReason" class="reason">
		<option value="">불량사유</option>
		<option value="파손">파손</option>
		<option value="스크래치">스크래치</option>
		<option value="포장불량">포장불량</option>
		<option value="찍힘">찍힘</option>
		<option value="제품 치수 이상">제품 치수 이상</option>
		<option value="기타">기타</option>
		</select></li>
    
    </ul>
    <input type="submit" value="실적 등록하기">
    </form>
    </div>
<br>
    <div id="keypad">
        <button class="number" value="1">1</button>
        <button class="number" value="2">2</button>
        <button class="number" value="3">3</button><br>
        <button class="number" value="4">4</button>
        <button class="number" value="5">5</button>
        <button class="number" value="6">6</button><br>
        <button class="number" value="7">7</button>
        <button class="number" value="8">8</button>
        <button class="number" value="9">9</button><br>
        <button >초기화</button> 
        <button class="number" value="0">0</button>
        <button >처음으로</button>    
    </div>
    

</body>
</html>