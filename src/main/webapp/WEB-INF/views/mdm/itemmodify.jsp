<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon-16x16.png">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
<style type="text/css">
body{
	font-family: 'NanumSquare', sans-serif;
}
div h2{
	text-align: center;
	margin-left : 40px;
	font-weight: 900;
}

div #mbutton{
	text-align: center;
}

div table{
	margin: 0px auto;

	font-size:12pt;
}


div input, select, button{
	font-size: 12pt;
	font-family: 'NanumSquare', sans-serif;
}

.star{
	color : red;
}

.div{
	padding : 10px;
	width: 350px;
	margin: 0px auto;
}

.div td{
	padding : 6px;
}

#form{
	border:1px solid;
	padding : 15px;
}
</style>
<meta charset="UTF-8">
<title>ItemModify</title>
<script type="text/javascript">
$(document).ready(function() {
	var useyn = "${itemDTO.useYn}";
	console.log(useyn);
	$("#"+useyn).prop("checked", true);
	
	var mtrlType = "${itemDTO.mtrlType}";
	console.log(mtrlType);
	$("#mtrlType").val(mtrlType).prop("selected", true);
	
	var mtrlSort = "${itemDTO.mtrlSort}";
	console.log(mtrlSort);
	$("#mtrlSort").val(mtrlSort).prop("selected", true);
	
	var invntUnit = "${itemDTO.invntUnit}";
	console.log(invntUnit);
	$("#invntUnit").val(invntUnit).prop("selected", true);
	
	var clntName = "${itemDTO.clntName}";
	$("#clntName").val(clntName).prop("selected", true);
});

function check(){
	if($('.itemNum').val() == "") {
		alert("품번을 입력하세요");
		$('.itemNum').focus();
	
		return false;
	}
	if($('.itemNum').val().length != 6) {
		alert("품번을 6자로 입력하세요.");
		$('.clntCode').focus();
	
		return false;
	}
	if($('.itemName').val() == "") {
		alert("품명을 입력하세요.");
		$('.itemName').focus();
		
		return false;
	}
	if($('.clntName').val() == "") {
		alert("거래처를 선택하세요.");
		
		return false;
	}
	if(confirm("수정하시겠습니까?")) {
		return true;
	} else {
		return false;
	}
}

//품목에 따른 품목코드 부여
function itemCode(obj){
	var obj = $(obj).val();
	console.log(obj);
	if(obj == "원자재") {
		$('input[name=itemNum]').attr('value',"SYRM00");
	}
	
	if(obj == "부자재") {
		$('input[name=itemNum]').attr('value',"SYSM00");
	}
	
	if(obj == "완제품") {
		$('input[name=itemNum]').attr('value',"SYPD00");
	}
	
};

// $(document).ready(function(){
// 	var obj = $('#mtrlType').val();
// 	if(obj == "원자재") {
// 		$('input[name=itemNum]').attr('value',"SYRM00");
// 	}
	
// 	if(obj == "부자재") {
// 		$('input[name=itemNum]').attr('value',"SYSM00");
// 	}
	
// 	if(obj == "완제품") {
// 		$('input[name=itemNum]').attr('value',"SYPD00");
// 	}
//  });
</script>
</head>
<body>

<jsp:include page="../inc/header2.jsp" />
<div class="div">
<br>
<h2> 품목 수정 </h2>
<form action="${pageContext.request.contextPath }/mdm/itemupdatePro" method="post" onsubmit="return check()" id="form">
<input type="hidden" name="itemId" value="${itemDTO.itemId}">
<table>
	<tr><td>품번 <span class="star">*</span></td>  <td><input type="text" name="itemNum" class="itemNum" id="itemNum" maxlength="6" value="${itemDTO.itemNum}"></td></tr>
	<tr><td>품명 <span class="star">*</span></td>  <td><input type="text" name="itemName" class="itemName" value="${itemDTO.itemName}"></td></tr>
	<tr><td>자재유형</td> <td><select name="mtrlType" id="mtrlType" class="mtrlType" onchange="itemCode(this);">
						<option value="원자재">원자재</option>
						<option value="부자재">부자재</option>
						<option value="완제품">완제품</option>
					</select></td></tr>
	<tr><td>자재구분</td> <td><select name="mtrlSort" id="mtrlSort" class="mtrlSort">
						<option value="사내" selected>사내</option>
						<option value="사외">사외</option>
					</select></td></tr>
	<tr><td>재고단위</td> <td><select name="invntUnit" class="invntUnit" id="invntUnit">
						<option value="EA" selected>EA</option>
						<option value="PK">PK</option>
					</select></td></tr>
	<tr><td>재질</td> <td><input type="text" name="invntQlt" class="invntQlt" id="invntQlt" value="${itemDTO.invntQlt}"></td></tr>
	<tr><td>규격</td> <td><input type="text" name="standard" class="standard" id="standard" value="${itemDTO.standard}"></td></tr>
	<tr><td>사용여부</td> <td><input type="radio" name="useYn" value="Y" class="Y" id="Y">Y
							<input type="radio" name="useYn" value="N" class="N" id="N">N</td></tr>
	<tr><td>거래처 <span class="star">*</span></td> <td><select name="clntName" class="clntName" id="clntName" class="clntName">
<!-- 						<option value="">거래처</option> -->
						<c:forEach var="clientList" items="${clientList}">
							<option value="${clientList.clntName}">${clientList.clntName}</option>
						</c:forEach>
	  				   </select>
				  </td></tr>
	<tr><td>매입단가</td> <td><input type="text" name="buyPrice" class="buyPrice" id="buyPrice"  value="${itemDTO.buyPrice}"></td></tr>
	<tr><td>매출단가</td> <td><input type="text" name="salePrice" class="salePrice" id="salePrice" value="${itemDTO.salePrice}"></td></tr>
	<tr><td>비고</td> <td><input type="text" name="note" class="note" id="note" value="${itemDTO.note}"></td></tr>
</table>
<div id="mbutton">
	<input type="submit" value="수정" id="modify">
	<button type="reset">초기화</button>

</div>
</form>
</div>

<%-- <jsp:include page="../inc/header2.jsp" /> --%>
</body>
</html>