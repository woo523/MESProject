<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}

#pagination{
text-align: center;
}
</style>
</head>
<body>

<h2>
업체 조회
</h2>
<form>
	<table>
		<tr>
			<td>업체번호</td><td><input type="text" name="clientCode"></td>
			<td>업체명</td><td><input type="text" name="clientName"></td>
			<td><input type="submit" value="조회"></td>
		</tr>
	</table>
	
<table>
	<tr>
		<td>업체번호</td>
		<td>업체명</td>
	</tr>
	<c:forEach var="clientList" items="${clientList }">
		<tr id="con" onclick="selectClient('${clientList.clientCode }','${clientList.clientName }')">
			<td>${clientList.clientCode }</td>
			<td>${clientList.clientName }</td>
		</tr>	
		<script type="text/javascript">
			function selectClient(a,b){ // 부모창으로 값 넘기기
				opener.document.getElementById("ccd").value = a 
		        opener.document.getElementById("cnm").value = b
		        window.close();
			}
		</script>
	</c:forEach>
</table>

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

</form>
</body>
</html>