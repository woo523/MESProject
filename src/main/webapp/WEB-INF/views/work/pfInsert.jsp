<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

ul {
	list-style-type: none;
}

</style>
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
	 
    $("input:radio[name=gbYn]").click(function(){
 
        if($("input[name=gbYn]:checked").val() == "N"){
            $("select[name=dbReason]").attr("disabled",false);
 
        }else if($("input[name=gbYn]:checked").val() == "Y"){
              $("select[name=dbReason]").attr("disabled",true);

        }
    });
});



</script> 


<body>
<h2>생산 실적 등록 </h2>


<form action="${pageContext.request.contextPath }/work/PinsertPro">

★ 등록할 작업지시 번호 : ${getInstr.instrId} <br>

<input type="hidden" name="instrId" value="${getInstr.instrId}">

품번 : <input type="text"  value="${getInstr.itemNum}" readonly> <br>
품명 : <input type="text"  value="${getInstr.itemName}" readonly> <br>
실적일 : <input type="date" name="performDate"> <br>
실적수량 : <input type="text" name="inputQty"> <br>
양불여부 : <input type="radio" class="YN" name="gbYn" value="Y"> Y(양품)
		<input type="radio" class="YN" name="gbYn" value="N"> N(불량)
		<br>
불량사유 : <select name="dbReason">
		<option>불량사유</option>
		<option value="파손">파손</option>
		<option value="스크래치">스크래치</option>
		<option value="포장불량">포장불량</option>
		<option value="찍힘">찍힘</option>
		<option value="제품 치수 이상">제품 치수 이상</option>
		<option value="기타">기타</option>
		</select>
<br>
비고 : <input type="text" name="note"><br>


<input type="submit" value="전송">
<button type="reset">취소</button>

</form>
</body>
</html>