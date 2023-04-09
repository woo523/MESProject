<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>instruct insert</title>

<script type="text/javascript">
function openilist(){
    window.open("${pageContext.request.contextPath }/material/itemList","popup", "width=500, height=500,left=100, top=100");
}

function openclist(){
    window.open("${pageContext.request.contextPath }/material/clientList","popup", "width=500, height=500,left=100, top=100");
}

// $('#insert').submit(function(){ // 유효성 검사
   
// 	if($('.mtDate').val()==null||$('.mtDate').val()==""){
//     	alert("입고일을 입력하세요");
// 		$('.mtDate').focus();
// 		return false;
//     }

// 	if($('.Qty').val()==null||$('.Qty').val()==""){
// 		alert("출고 수량을 입력하세요");
// 		$('.Qty').focus();
	
// 		return false;
// 	}
	
// 	if($('.Qty').val()<=0){
// 		alert("출고 수량은 양수로 입력해주세요");
// 		$('.Qty').focus();
	
// 		return false;
// 	}
	
// 	if($('.unit').val()==null||$('.unit').val()==""){
// 		alert("단위를 입력하세요");
// 		$('.unit').focus();
	
// 		return false;
// 	}
	
// 	if($('.pcd').val()==null||$('.pcd').val()==""){
// 		alert("제품 정보를 입력하세요");
// 		$('.pcd').focus();
	
// 		return false;
// 	}
	
// 	if($('.ccd').val()==null||$('.ccd').val()==""){
// 		alert("거래처 정보를 입력하세요");
// 		$('.ccd').focus();
	
// 		return false;
// 		}
// 	}

// });
</script>
</head>


<body>

	<h2>자재출고 등록</h2>
	<br>
	<form action="${pageContext.request.contextPath }/material/outmtrlInsertPro" id="insert" method="post">	
	

				
		<ul>

			<li>등록자  <input type="text" name="insertId" value="${sessionScope.id}" readonly> </li>
			<li>출고일자 <input type="date" id="Date" class="mtDate" name="outmtrlDt"></li>
			<li>제품 정보 <input type="text" id="pcd" class="pcd" placeholder="품번코드" onclick="openilist()">
					   <input type="text" id="pnm" placeholder="품번명" readonly></li>
					    <input type="hidden" name="itemId" id="pid" >
			<li>거래처 정보 <input type="text" id="ccd" class="ccd" placeholder="업체코드" onclick="openclist()">
						 <input type="text" id="cnm" placeholder="업체명" readonly></li>
						 <input type="hidden" name="clntId" id="cid">
						 <input type="hidden" name="whouse" id="whouse">
						<input type="hidden" name="curStock" id="stockcur">
			<li>단위  <input type="text" name="unit"></li>
			<li>출고수량  <input type="number" class="Qty" name="outmtrlQty"></li>
			<li>비고  <input type="text" name="note"> </li>
		</ul>
		
		<input type="submit" value="등록">
		<button type="reset">초기화</button>
	</form>
	

</body>
</html>