<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
#con:hover {
	background-color: #e1e1e1;
	cursor: pointer;
}

#pagination {
	text-align: center;
}
</style>

</head>
	<h2>실사량</h2>
	<form action="${pageContext.request.contextPath}/material/quantityPro" id="update" method="post">
	<input type="hidden" name="stockId" value="${stockDTO.stockId}">
		<table>
			<tr style="text-align:center;">
				<td>실사량</td>
				<td><input type="number" class="stockcur" name="stockcur" value="${stockDTO.stockcur}"></td>
			</tr>
			<tr>
				<td><input type="submit" value="저장">
			</td>
			</tr>
		</table>
	</form>



</body>
</html>