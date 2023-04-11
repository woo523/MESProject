<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

@import
	url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
	;

body{
	font-family: 'NanumSquare', sans-serif;
}

/* 페이징 */


#pagination {
  display: inline-block;
}

#pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

#pagination a.active {
	background-color: #b9b9b9;
  color: white;
  border: 1px solid #b9b9b9;
}

#pagination a:hover:not(.active,.none) {background-color: #ddd;}

.center {
  text-align: center;
}


table {
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
<h2>
업체 조회
</h2>
<br>
<form>
	<table>
		<tr>
			<td>업체번호</td><td><input type="text" name="clientCode" style="width:120px;"></td>
			<td>업체명</td><td><input type="text" name="clientName" style="width:120px;"></td>
			<td><input type="submit" value="조회"></td>
		</tr>
	</table>
</form>	
<table>
	<tr><th>업체번호</th><th>업체명</th></tr>
	<c:forEach var="clientList" items="${clientList }">
		<tr onclick="selectClient('${clientList.clientCode }','${clientList.clientName }', ${clientList.clientId } )">
			<td id="con">${clientList.clientCode }</td>
			<td id="con">${clientList.clientName }</td>
		</tr>	
		
		<script type="text/javascript">
			function selectClient(a,b,c){ // 부모창으로 값 넘기기
				opener.document.getElementById("ccd").value = a 
		        opener.document.getElementById("cnm").value = b
		        opener.document.getElementById("cid").value = c
		        window.close();
			}
		</script>
	</c:forEach>
</table>
<br>
<div class="center">
<div id="pagination">

    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/material/clientList?clientCode=${search.clientCode}&clientName=${search.clientName}&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/material/clientList?clientCode=${search.clientCode}&clientName=${search.clientName}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/material/clientList?clientCode=${search.clientCode}&clientName=${search.clientName}&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/material/clientList?clientCode=${search.clientCode}&clientName=${search.clientName}&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/material/clientList?clientCode=${search.clientCode}&clientName=${search.clientName}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	
</div>
</div>
</body>
</html>