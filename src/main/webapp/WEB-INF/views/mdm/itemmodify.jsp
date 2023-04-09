<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemInsert</title>
<script type="text/javascript">
$('#modify').click(function(){
	alert("수정되었습니다.");
});
</script>
</head>
<body>
<h2>|| 품목추가 ||</h2><br>
<form action="${pageContext.request.contextPath }/mdm/itemupdatePro" method="post">
<table>
	<tr>
	<td>품번</td>  <td><input type="text" name="itemNum"></td>
	<td>품명</td>  <td><input type="text" name="itemName"></td>
	<td>자재유형</td> <td><select name="mtrlType">
						<option value="원자재" selected>원자재</option>
						<option value="부자재">부자재</option>
						<option value="완제품">완제품</option>
					</select></td>
	<td>자재구분</td> <td><select name="mtrlSort">
						<option value="사내" selected>사내</option>
						<option value="사외">사외</option>
					</select></td>
	<td>재고단위</td> <td><select name="invntUnit">
						<option value="EA" selected>EA</option>
						<option value="PK">PK</option>
					</select></td>
	</tr>
	<tr>
	<td>재질</td> <td><input type="text" name="invntQlt"></td>
	<td>규격</td> <td><input type="text" name="standard"></td>
	<td>사용여부</td> <td><select name="useYn">
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select></td>
	<tr>
	<td>거래처</td> <td><select name="clntName">
						<option value="">거래처</option>
						<c:forEach var="clientDTO" items="${clientList}">
							<option value="${clientDTO.clntName}">${clientDTO.clntName}</option>
						</c:forEach>
	  				   </select>
				  </td>
	<td>매입단가</td> <td><input type="text" name="buyPrice"></td>
	<td>매출단가</td> <td><input type="text" name="salePrice"></td>
	<td>비고</td> <td><input type="text" name="note"></td>
	</tr>
</table>
<input type="submit" value="수정" id="modify">
</form>
</body>
</html>