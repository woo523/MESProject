<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemInsert</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
<style type="text/css">
body{
	font-family: 'NanumSquare', sans-serif;
}
div h2{
	text-align: left;
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
</style>

<script type="text/javascript">
function check(){
	if($('.itemNum').val() == "") {
		alert("품번을 입력하세요");
		$('.itemNum').focus();
	
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
</script>
</head>
<body>

<jsp:include page="../inc/header2.jsp" />
<div class="div">
<h2> 품목추가 </h2><br>
<form action="${pageContext.request.contextPath }/mdm/iteminsertPro" method="post" onsubmit="return check()">
<table>
	<tr><td>품번 <span class="star">*</span></td>  <td><input type="text" name="itemNum" class="itemNum"></td></tr>
	<tr><td>품명 <span class="star">*</span></td>  <td><input type="text" name="itemName" class="itemNum"></td></tr>
	<tr><td>자재유형</td> <td><select name="mtrlType">
						<option value="원자재" selected>원자재</option>
						<option value="부자재">부자재</option>
						<option value="완제품">완제품</option>
					</select></td></tr>
	<tr><td>자재구분</td> <td><select name="mtrlSort">
						<option value="사내" selected>사내</option>
						<option value="사외">사외</option>
					</select></td></tr>
	<tr><td>재고단위</td> <td><select name="invntUnit">
						<option value="EA" selected>EA</option>
						<option value="PK">PK</option>
					</select></td></tr>
	<tr><td>재질</td> <td><input type="text" name="invntQlt"></td></tr>
	<tr><td>규격</td> <td><input type="text" name="standard"></td></tr>
	<tr><td>사용여부</td> <td><select name="useYn">
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select></td></tr>
	<tr><td>거래처 <span class="star">*</span></td> <td><select name="clntName" class="clntName">
						<option value="">-</option>
						<c:forEach var="clientDTO" items="${clientList}">
							<option value="${clientDTO.clntName}">${clientDTO.clntName}</option>
						</c:forEach>
	  				   </select>
				  </td></tr>
	<tr><td>매입단가</td> <td><input type="text" name="buyPrice"></td></tr>
	<tr><td>매출단가</td> <td><input type="text" name="salePrice"></td></tr>
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