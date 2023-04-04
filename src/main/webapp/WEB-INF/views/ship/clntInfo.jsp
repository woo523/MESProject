<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clntInfo</title>
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

	<h2>고객 정보</h2>
		<form>
			<table>
				<tr>
					<td>고객코드</td>
					<td><input type="text" name="clntCd"></td>
					<td>고객번호</td>
					<td><input type="text" name="clntNm"></td>
				</tr>
				<tr>
					<td>고객 ID</td>
					<td><input type="text" name="clntId"></td>
					<td><input type="submit" value="조회"></td>
				</tr>
			</table>
		</form>
			<table>
				<tr>
					<td>고객코드</td>
					<td>고객번호</td>
					<td>ID</td>
				</tr>
				<c:forEach var="clntInfo" items="${clntInfo }">
					<tr id="sh" onclick="selectClnt('${clntInfo.clntCd }','${clntInfo.clntNm }','${clntInfo.clntId }')">
						<td>${clntInfo.clntCd }</td>
						<td>${clntInfo.clntNm }</td>
						<td>${clntInfo.clntId }</td>
					</tr>
				
					<script type="text/javascript">
					function selectClnt(a, b, c) { 
						opener.document.getElementById("clntCd").value = a
						opener.document.getElementById("clntNm").value = b
						opener.document.getElementById("clntId").value = c
						window.close();
						}
					</script>
				</c:forEach>
			</table>
	
	
	<div id="pagination">

		<!-- 1페이지 이전 -->
		<c:if test="${pageDTO.currentPage > 1}">
			<a
				href="${pageContext.request.contextPath }/ship/clntInfo?clntCd=${search.clntCd}&clntNm=${search.clntNm}&clntId=${search.clntId}&pageNum=${pageDTO.currentPage-1}"></a>
		</c:if>

		<!-- 10페이지 이전 -->
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a
				href="${pageContext.request.contextPath }/ship/clntInfo?clntCd=${search.clntCd}&clntNm=${search.clntNm}&clntId=${search.clntId}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"></a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/ship/clntInfo?clntCd=${search.clntCd}&clntNm=${search.clntNm}&clntId=${search.clntId}&pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- 1페이지 다음 -->
		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/clntInfo?clntCd=${search.clntCd}&clntNm=${search.clntNm}&clntId=${search.clntId}&pageNum=${pageDTO.currentPage+1}">></a>
		</c:if>

		<!-- 10페이지 다음 -->
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/clntInfo?clntCd=${search.clntCd}&clntNm=${search.clntNm}&clntId=${search.clntId}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
		</c:if>

	</div>
</body>
</html>
