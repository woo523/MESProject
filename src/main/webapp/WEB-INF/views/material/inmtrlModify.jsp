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
width: 500px;
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

</style>

<script type="text/javascript">

function openilist(){
    window.open("${pageContext.request.contextPath }/material/itemList","popup", "width=500, height=500,left=100, top=100");
}

function openclist(){
    window.open("${pageContext.request.contextPath }/material/clientList","popup", "width=500, height=500,left=100, top=100");
}

// $('#update').submit(function(){ // 유효성 검사
//     if($('.mtDate').val()==null||$('.mtDate').val()==""){
//     	alert("입고일을 입력하세요");
// 		$('.mtDate').focus();
// 		return false;
//     }

// if($('.Qty').val()==null||$('.Qty').val()==""){
// 	alert("입고 수량을 입력하세요");
// 	$('.Qty').focus();
// 	return false;
// }

// if($('.Qty').val()<=0){
// 	alert("입고 수량은 양수로 입력해주세요");
// 	$('.Qty').focus();
// 	return false;
// }

// //수정 여부 확인 후 폼 전송
// function checkForm() {
// 	if(confirm("수정하시겠습니까?")) {
// 		return true;	// 폼 전송 O
// 	} else {
// 		return false;	// 폼 전송 X
// 	}
// }
</script>


</head>
<body>


<div class="content_body">
	<h2> 자재 입고 수정 </h2>
	<br>
	<div id="num"> 등록자 : ${inmaterialDTO.insertId} /
	 수정자 : ${sessionScope.id}  </div><br>
	<form action="${pageContext.request.contextPath}/material/inmtrlModifyPro" id="update" method="post">
		<input type="hidden" name="inmtrlId" value="${inmaterialDTO.inmtrlId}">
			<table>
<%-- 				<tr><td>등록자</td><td><input type="text"  name="insertId" value="${inmaterialDTO.insertId}" readonly></td></tr> --%>
<%-- 				<tr><td>수정자</td><td><input type="text" name="updateId" value="${sessionScope.id}" readonly></td></tr> --%>
				<tr><td>입고번호</td><td><input type="text"  name="inmtrlNum" value="${inmaterialDTO.inmtrlNum}" readonly></td></tr>
				<tr><td>입고일자</td><td><input type="date" id="Date" class="mtDate" name="inmtrlDt" value="${inmaterialDTO.inmtrlDt}"></td></tr>
				<tr><td>제품 정보</td><td><input type="text" id="pcd"  value="${getInmtrl.itemNum}" onclick="openilist()">
					   <input type="text" id="pnm" value="${getInmtrl.itemName}" readonly></td></tr>
					    <input type="hidden" name="itemId" id="pid" value="${getInmtrl.itemId}">
				<tr><td>거래처 정보</td><td><input type="text" id="ccd"  value="${getInmtrl.clientCode}" onclick="openclist()">
						 <input type="text" id="cnm" value="${getInmtrl.clientName}"readonly></td></tr>
						 <input type="hidden" name="clntId" id="cid" value="${getInmtrl.clientId}">
<%-- 				<tr><td>단위</td><td><input type="text" value="${getInmtrl.itemUnit}"></td></tr> --%>
				<tr><td>입고수량</td><td><input type="number" class="Qty" name="inmtrlQty" value="${inmaterialDTO.inmtrlQty}"></td></tr>
				<tr><td>입고LOT</td><td><input type="text" name="inmtrlLot" value="${inmaterialDTO.inmtrlLot}"></td></tr>
				<tr><td>비고</td><td><input type="text" name="note" value="${inmaterialDTO.note}"></td></tr>
			</table><br>
			<div id="bu">
			<input type="submit" value="수정">
			<button type="reset">취소</button>
			</div>
</form>
</div>

</body>
</html>