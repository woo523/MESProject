<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>
품번 조회
</h2>
<form>
<table>
<tr><td>품번</td><td><input type="text" name="itemNum"></td><td>품명</td><td><input type="text" name="itemName"></td><td><input type="submit" value="조회"></td></tr>
</table>
</form>
<table>
<tr><td>품번</td><td>품명</td></tr>
<c:forEach var="itemList" items="${itemList }">
<tr onclick="selectItem('${itemList.itemNum }','${itemList.itemName }')"><td>${itemList.itemNum }</td><td>${itemList.itemName }</td></tr>

    <script type="text/javascript">

        function selectItem(a,b){ // 부모창으로 값 넘기기

          opener.document.getElementById("pcd").value = a 
          opener.document.getElementById("pnm").value = b
          window.close();

        }

   </script>



</c:forEach>

</table>

    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${pageDTO.currentPage-1}">◀</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}">[10페이지 이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${pageDTO.currentPage+1}">▶</a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/work/itemList?itemNum=${search.itemNum}&itemName=${search.itemName}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">[10페이지 다음]</a>
	</c:if>
</body>
</html>