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

$('#update').submit(function(){ // 유효성 검사
    if($('.mtDate').val()==null||$('.mtDate').val()==""){
    	alert("입고일을 입력하세요");
		$('.mtDate').focus();
		return false;
    }

if($('.Qty').val()==null||$('.Qty').val()==""){
	alert("입고 수량을 입력하세요");
	$('.Qty').focus();
	return false;
}

if($('.Qty').val()<=0){
	alert("입고 수량은 양수로 입력해주세요");
	$('.Qty').focus();
	return false;
}

//수정 여부 확인 후 폼 전송
function checkForm() {
	if(confirm("수정하시겠습니까?")) {
		return true;	// 폼 전송 O
	} else {
		return false;	// 폼 전송 X
	}
}
</script>


</head>
<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
	<h2> 자재 입고 수정 </h2>
	<br>
	<form action="${pageContext.request.contextPath}/material/inmtrlModifyPro" id="update" method="post" onsubmit="return checkForm()">
		<input type="hidden" name="inmtrlId" value="${materialDTO.inmtrlId}">
			<ul>
				<li> 수정자  <input type="text" name="insertId" value="${sessionScope.id}" readonly> </li>
				<li> 입고번호 <input type="text"  name="inmtrlNum" value="${inmaterialDTO.inmtrlNum}" readonly></li>
				<li> 입고일자 <input type="date" id="Date" class="mtDate" name="inmtrlDt" value="${inmaterialDTO.inmtrlDt}"></li>
				<li>제품 정보 <input type="text" id="pcd" placeholder="품번코드"  value="${itemDTO.itemNum}" onclick="openilist()">
					   <input type="text" id="pnm" placeholder="품번명" "${itemDTO.itemName}" readonly></li>
					    <input type="hidden" name="itemId" id="pid" >
				<li>거래처 정보 <input type="text" id="ccd" placeholder="업체코드" value="${clientDTO.clientCode}" onclick="openclist()">
						 <input type="text" id="cnm" placeholder="업체명" value="${clientDTO.clientName}"readonly></li>
						 <input type="hidden" name="clntId" id="cid">
				<li> 단위 <input type="text" name="itemUnit" value="${itemDTO.invntUnit}"></li>
				<li> 입고수량 <input type="number" class="Qty" name="inmtrlQty" value="${inmaterialDTO.inmtrlQty}"></li>
				<li> 입고LOT <input type="text" name="inmtrlLot" value="${inmaterialDTO.inmtrlLot}"></li>
				<li> 비고 <input type="text" name="note" value="${inmaterialDTO.note}"></li>
				</ul>
			
			<input type="submit" value="수정">
			<button type="reset">취소</button>
</form>
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>
</html>