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
품번 조회
</h2>
<form>
<table>
<tr>
	<td>품번</td><td><input type="text" name="itemNum"></td>
	<td>품명</td><td><input type="text" name="itemName"></td>
	<td><input type="submit" value="조회"></td></tr>
</table>
</form>
<table>
<tr><td>품번</td><td>품명</td></tr>
<c:forEach var="itemList" items="${itemList}">
<tr id="con" onclick="selectItem('${itemList.itemNum }','${itemList.itemName }','${itemList.itemId}')">
	<td>${itemList.itemNum}</td>
	<td>${itemList.itemName}</td>
	<td><input type="hidden" value="${itemList.itemId}"></td></tr>

    <script type="text/javascript">

        function selectItem(a,b,c){ // 부모창으로 값 넘기기
		  
          opener.document.getElementById("pcd").value = a 
          opener.document.getElementById("pnm").value = b
          opener.document.getElementById("pid").value = c
          window.close();

        }

   </script>

</c:forEach>
</table>
<div id="pagination">

    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	
</div>
</body>
</html>