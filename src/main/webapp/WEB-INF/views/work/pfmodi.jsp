<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-ui-1.9.2.custom.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-migrate-1.4.1.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.cookie.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.mCustomScrollbar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap-datetimepicker.ko.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	
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
 
        }else if($("input[name=gbYn]:checked").val() == "Y"){ // 양품선택하면 불량사유 목록 비활성화
              $("select[name=dbReason]").attr("disabled",true);

        }
    });
    

	
	$('#update').submit(function(){ // 유효성 검사
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


function fun1() {
	alert("실적 수정되었습니다");
}

</script>



</head>
<body>
<h2> 실적 수정 </h2>

<form action="${pageContext.request.contextPath }/work/PmodiPro" id="update" method="post">


<input type="hidden" name="performId" value="${pfDTO.performId}">
품번 : <input type="text"  value="${getInstr.itemNum}" readonly> <br>
품명 : <input type="text"  value="${getInstr.itemName}" readonly> <br>
실적일 : <input type="date" id="Date" class="pfDate" name="performDate" value="${pfDTO.performDate}"> <br>
실적수량 : <input type="number" class="Qty" name="performQty" value="${pfDTO.performQty}"> <br>
양불여부 : <input type="radio" name="gbYn" id="Y" value="Y"> Y(양품)
		<input type="radio" name="gbYn" id="N" value="N"> N(불량)
		<br>
불량사유 : <select name="dbReason" class="reason" id="dbReason">
		<option value="">불량사유</option>
		<option value="파손">파손</option>
		<option value="스크래치">스크래치</option>
		<option value="포장불량">포장불량</option>
		<option value="찍힘">찍힘</option>
		<option value="제품 치수 이상">제품 치수 이상</option>
		<option value="기타">기타</option>
		</select>
<br>
비고 : <input type="text" name="note" value="${pfDTO.note}"><br>


<input type="submit"  onclick="fun1()" value="실적 수정">
<button type="reset">초기화</button>

</form>


</body>
</html>