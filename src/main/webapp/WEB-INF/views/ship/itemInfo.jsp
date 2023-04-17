<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>itemInfo</title>

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">

<style type="text/css">
	#sh:hover {
		background-color: #e1e1e1;
		cursor: pointer;
	}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

</style>


</head>
<body>

	<h2>제품 정보</h2>
		<form>
			<table>
				<tr>
					<td>품번</td>
					<td><input type="text" name="itemNum"></td>
					<td>품명</td>
					<td><input type="text" name="itemName"></td>
				</tr>
				<tr>
					<td>재고단위</td>
					<td><input type="text" name="invntUnit"></td>
					<td><input type="submit" value="조회"></td>
				</tr>
			</table>
		</form>
			<table>
				<tr>
					<td>품번</td>
					<td>품명</td>
					<td>재고단위</td>
				</tr>
				<c:forEach var="itemInfo" items="${itemInfo }">
					<tr id="sh" onclick="selectClnt('${itemInfo.itemNum }','${itemInfo.itemName }','${itemInfo.invntUnit }')">
						<td>${itemInfo.itemNum }</td>
						<td>${itemInfo.itemName }</td>
						<td>${itemInfo.invntUnit }</td>
					</tr>
				
					<script type="text/javascript">
					function selectClnt(a, b, c) { 
						opener.document.getElementById("itemNum").value = a
						opener.document.getElementById("itemName").value = b
						opener.document.getElementById("invntUnit").value = c
						window.close();
						}
					</script>
				</c:forEach>
			</table>
	
	
	<div id="pagination">

		<!-- 1페이지 이전 -->
		<c:if test="${pageDTO.currentPage > 1}">
			<a
				href="${pageContext.request.contextPath }/ship/itemInfo?itemNum=${search.itemNum}&itemName=${search.itemName}&invntUnit=${search.invntUnit}&pageNum=${pageDTO.currentPage-1}"></a>
		</c:if>

		<!-- 10페이지 이전 -->
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a
				href="${pageContext.request.contextPath }/ship/itemInfo?itemNum=${search.itemNum}&itemName=${search.itemName}&invntUnit=${search.invntUnit}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"></a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/ship/itemInfo?itemNum=${search.itemNum}&itemName=${search.itemName}&invntUnit=${search.invntUnit}&pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- 1페이지 다음 -->
		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/itemInfo?itemNum=${search.itemNum}&itemName=${search.itemName}&invntUnit=${search.invntUnit}&pageNum=${pageDTO.currentPage+1}">></a>
		</c:if>

		<!-- 10페이지 다음 -->
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/itemInfo?itemNum=${search.itemNum}&itemName=${search.itemName}&invntUnit=${search.invntUnit}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
		</c:if>

	</div>
</body>
</html>
