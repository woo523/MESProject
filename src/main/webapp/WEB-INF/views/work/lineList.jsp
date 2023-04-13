<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lineList</title>


<style type="text/css">

@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
	
body {
	font-family: 'NanumSquare', sans-serif;
}

table.lineSearch {
	margin : 0px auto;
	margin-bottom : 10px;
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 425px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

table.lineList {
	margin : 0px auto;
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 425px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: center;
	background: #b9b9b9;
	font-weight: 700;
}


td, th {
	padding: 1em .5em;
	
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}
h2{
	text-align: center;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}
</style>
</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header3.jsp" />
<!-- </header> -->

	<h2>라인 조회</h2>
	<form>
		<table class="lineSearch">
			<tr>
				<td>라인명</td>
				<td><input type="text" name="lineName"></td>
				<td><input type="submit" id="submit" value="조회"></td>
			</tr>
		</table>
	</form>
	<table class="lineList">
		<tr>
			<th>라인명</th>
			<th>작업장</th>
			<th>사용여부</th>
		</tr>
		<c:forEach var="lineList" items="${getLineList}">
			<tr id="con"
				onclick="selectline('${lineList.lineName}','${lineList.linePlace}','${lineList.useChoice}','${lineList.lineId}')">
				<td>${lineList.lineName}</td>
				<td>${lineList.linePlace}</td>
				<td>${lineList.useChoice}</td>
			</tr>
			<input type="hidden" value="${lineList.lineId}">
		</c:forEach>
	</table>
</body>
<script type="text/javascript">

function selectline(a, b, c, d) { // 부모창으로 값 넘기기
	
	opener.document.getElementById("lineName").value = a
	opener.document.getElementById("linePlace").value = b
	opener.document.getElementById("useChoice").value = c
	opener.document.getElementById("lineId").value = d
	window.close();
	
}

</script>
</html>