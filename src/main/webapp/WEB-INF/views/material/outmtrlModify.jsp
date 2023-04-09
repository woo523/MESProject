<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

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
	<h2> 자재 출고 수정 </h2>
	<br>
	<form action="${pageContext.request.contextPath}/material/outmtrlModifyPro" id="update" method="post">
		<input type="hidden" name="outmtrlId" value="${outmaterialDTO.outmtrlId}">
			<ul>
				<li> 등록자 <input type="text"  name="insertId" value="${outmaterialDTO.insertId}" readonly></li>
				<li> 수정자  <input type="text" name="updateId" value="${sessionScope.id}" readonly> </li>
				<li> 출고번호 <input type="text"  name="outmtrlNum" value="${outmaterialDTO.outmtrlNum}" readonly></li>
				<li> 출고일자 <input type="date" id="Date" class="mtDate" name="outmtrlDt" value="${outmaterialDTO.outmtrlDt}"></li>
				<li>제품 정보 <input type="text" id="pcd"  value="${getOutmtrl.itemNum}" onclick="openilist()">
					   <input type="text" id="pnm" value="${getOutmtrl.itemName}" readonly></li>
					    <input type="hidden" name="itemId" id="pid" value="${getOutmtrl.itemId}">
				<li>거래처 정보 <input type="text" id="ccd"  value="${getOutmtrl.clientCode}" onclick="openclist()">
						 <input type="text" id="cnm" value="${getOutmtrl.clientName}"readonly></li>
						 <input type="hidden" name="clntId" id="cid" value="${getOutmtrl.clientId}">
				<li> 단위 <input type="text" value="${getOutmtrl.itemUnit}"></li>
				<li> 출고수량 <input type="number" class="Qty" name="outmtrlQty" value="${outmaterialDTO.outmtrlQty}"></li>
				<li> 비고 <input type="text" name="note" value="${outmaterialDTO.note}"></li>
				</ul>
			
			<input type="submit" value="수정">
			<button type="reset">취소</button>
</form>
</div>

</body>
</html>