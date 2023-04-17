<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemInsert</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">
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

div #ibutton{
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

<script type="text/javascript">
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
	if(confirm("등록하시겠습니까?")) {
		return true;
	} else {
		return false;
	}
}
// 품목에 따른 품목코드 부여
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

$(document).ready(function(){
	var obj = $('#mtrlType').val();
	if(obj == "원자재") {
		$('input[name=itemNum]').attr('value',"SYRM00");
	}
	
	if(obj == "부자재") {
		$('input[name=itemNum]').attr('value',"SYSM00");
	}
	
	if(obj == "완제품") {
		$('input[name=itemNum]').attr('value',"SYPD00");
	}
 });
</script>
</head>
<body>

<jsp:include page="../inc/header2.jsp" />
<div class="div">
<h2> 품목추가 </h2><br>
<form action="${pageContext.request.contextPath }/mdm/iteminsertPro" method="post" onsubmit="return check()" id="form">
<table>
	<tr><td>품번 <span class="star">*</span></td>  <td><input type="text" name="itemNum" id="itemNum" maxlength="6" class="itemNum"></td></tr>
	<tr><td>품명 <span class="star">*</span></td>  <td><input type="text" name="itemName" class="itemName"></td></tr>
	<tr><td>자재유형</td> <td><select name="mtrlType" id="mtrlType" onchange="itemCode(this);">
						<option value="원자재">원자재</option>
						<option value="부자재">부자재</option>
						<option value="완제품">완제품</option>
					</select></td></tr>
	<tr><td>자재구분</td> <td><select name="mtrlSort" id="mtrlSort">
						<option value="사내" selected>사내</option>
						<option value="사외">사외</option>
					</select></td></tr>
	<tr><td>재고단위</td> <td><select name="invntUnit" id="invntUnit">
						<option value="EA" selected>EA</option>
						<option value="PK">PK</option>
					</select></td></tr>
	<tr><td>재질</td> <td><input type="text" name="invntQlt"></td></tr>
	<tr><td>규격</td> <td><input type="text" name="standard"></td></tr>
	<tr><td>사용여부</td> <td><input type="radio" name="useYn" value="Y" id="Y" checked>Y
							<input type="radio" name="useYn" value="N" id="N">N</td></tr>
	<tr><td>거래처 <span class="star">*</span></td> <td><select name="clntName" class="clntName">
						<option value="">-</option>
						<c:forEach var="clientDTO" items="${clientList}">
							<option value="${clientDTO.clntName}">${clientDTO.clntName}</option>
						</c:forEach>
	  				   </select>
				  </td></tr>
	<tr><td>매입단가</td> <td><input type="text" name="buyPrice" value="0" placeholder="숫자만 입력하세요"></td></tr>
	<tr><td>매출단가</td> <td><input type="text" name="salePrice" value="0" placeholder="숫자만 입력하세요"></td></tr>
	<tr><td>비고</td> <td><input type="text" name="note"></td></tr>

</table>
<div id="ibutton">
<input type="submit" value="추가">
<button type="reset">초기화</button>
</div>
</form>
</div>
</body>
</html>