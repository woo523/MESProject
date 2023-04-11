<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
#mbutton{
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
<meta charset="UTF-8">
<title>ItemInsert</title>
<script type="text/javascript">

</script>
</head>
<body>
<br>
<h2> 품목 수정 </h2>
<form action="${pageContext.request.contextPath }/mdm/itemupdatePro" method="post">
<table>
	<tr><td>품번</td>  <td><input type="text" name="itemNum" value="${itemDTO.itemNum}"></td></tr>
	<tr><td>품명</td>  <td><input type="text" name="itemName" value="${itemDTO.itemName}"></td></tr>
	<tr><td>자재유형</td> <td><select name="mtrlType" id="mtrlType">
						<option value="원자재">원자재</option>
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
	<tr><td>재질</td> <td><input type="text" name="invntQlt" value="${itemDTO.invntQlt}"></td></tr>
	<tr><td>규격</td> <td><input type="text" name="standard" value="${itemDTO.standard}"></td></tr>
	<tr><td>사용여부</td> <td><input type="radio" name="useYn" value="Y">Y
							<input type="radio" name="useYn" value="N">N</td></tr>
	<tr><td>거래처</td> <td><select name="clntName" id="clntName" class="clntName">
<!-- 						<option value="">거래처</option> -->
						<c:forEach var="clientList" items="${clientList}">
							<option value="${clientList.clntName}">${clientList.clntName}</option>
						</c:forEach>
	  				   </select>
				  </td></tr>
	<tr><td>매입단가</td> <td><input type="text" name="buyPrice" value="${itemDTO.buyPrice}"></td></tr>
	<tr><td>매출단가</td> <td><input type="text" name="salePrice" value="${itemDTO.salePrice}"></td></tr>
	<tr><td>비고</td> <td><input type="text" name="note" value="${itemDTO.note}"></td></tr>
</table>
<div id="mbutton">
	<input type="submit" value="수정" id="modify">
	<button type="reset">초기화</button>

</div>
</form>
</body>
</html>