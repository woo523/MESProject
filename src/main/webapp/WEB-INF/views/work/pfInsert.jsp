<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-ui-1.9.2.custom.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-migrate-1.4.1.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.cookie.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mCustomScrollbar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-datetimepicker.ko.js"></script>


<style type="text/css">
@import
	url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
	;
	
	
body{
	font-family: 'NanumSquare', sans-serif;
}
h2{
	text-align: center;
	font-weight: 900;
	
}
form{
border:1px solid;
padding:10px;
width: 350px;
margin: 0px auto;
}

#num, #bu{
	text-align: center;
}

table{
	margin: 0px auto;

	font-size:12pt;
}

td{
	padding : 6px;
}

input, select, button{
	font-size: 12pt;
	font-family: 'NanumSquare', sans-serif;
}

#red{
	color:red;
}
</style>	
	
	
	
<script type="text/javascript">

$(document).ready(function(){
	 
    $("input:radio[name=gbYn]").click(function(){
 
        if($("input[name=gbYn]:checked").val() == "N"){
            $("select[name=dbReason]").attr("disabled",false);
 
        }else if($("input[name=gbYn]:checked").val() == "Y"){ //양품일때 불량사유 목록 비활성화
              $("select[name=dbReason]").attr("disabled",true);

        }
    });
    
	$('#insert').submit(function(){ // 유효성 검사
	    if($('.pfDate').val()==null||$('.pfDate').val()==""){
	    	alert("실적일을 입력하세요");
			$('.pfDate').focus();
			return false;
	    }
	    
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
	
    // 날짜 미래 날짜 선택 못하게
    var today = new Date(); // 오늘 날짜
    var year = today.getFullYear(); // 년도 YYYY
    var month = ("0"+(today.getMonth()+1)).slice(-2); // 달 MM
    var date = ("0"+today.getDate()).slice(-2); // 일 DD
    var today = year+"-"+month+"-"+date; // YYYY-MM-DD
	document.getElementById("Date").setAttribute("max", today);
    
});


</script> 
<%@ include file="../inc/header3.jsp"%>

<body>
<h2>생산 실적 등록 </h2>

<div id="num">- 작업지시 번호 : ${getInstr.workNum} - </div><br>
<form action="${pageContext.request.contextPath }/work/PinsertPro" id="insert">



<input type="hidden" name="instrId" value="${getInstr.instrId}">
<table>
<tr><td>품번</td><td><input type="text"  value="${getInstr.itemNum}" readonly></td> </tr>
<tr><td>품명</td><td><input type="text"  value="${getInstr.itemName}" readonly></td> </tr>
<tr><td>실적일 <span id="red">*</span></td><td><input type="date" id="Date" class="pfDate" name="performDate"></td></tr>
<tr><td>지시수량 </td><td><input type="text" value="${getInstr.workQty}" readonly> (${getInstr.invntUnit})</td></tr>
<tr><td>실적수량 <span id="red">*</span></td><td><input type="number" class="Qty" name="performQty"> (${getInstr.invntUnit})</td></tr>
<tr><td>양불여부 <span id="red">*</span></td><td><input type="radio" name="gbYn" value="Y"> Y(양품)
		<input type="radio"  name="gbYn" value="N"> N(불량)
		</td></tr>
<tr><td>불량사유 <span id="red">*</span></td><td><select name="dbReason" class="reason">
		<option value="">불량사유</option>
		<option value="파손">파손</option>
		<option value="스크래치">스크래치</option>
		<option value="포장불량">포장불량</option>
		<option value="찍힘">찍힘</option>
		<option value="제품 치수 이상">제품 치수 이상</option>
		<option value="기타">기타</option>
		</select>
</td></tr>
<tr><td>비고</td><td><input type="text" name="note"></td></tr>
</table><br>
<div id="bu">
<input type="submit" value="실적 등록"> &nbsp;&nbsp;
<button type="reset">초기화</button>
</div>
</form>
</body>
</html>