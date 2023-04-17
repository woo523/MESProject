<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mtrInfo</title>

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

	<h2>재고 정보</h2>
		<form>
			<table>
				<tr>
					<td>현재고</td>
					<td><input type="text" name="curStock"></td>
					<td>입고창고</td>
					<td><input type="text" name="whouse"></td>
				</tr>
				<tr>
					<td>입고일자</td>
					<td><input type="text" name="inmtrlDt"></td>
					<td>출고일자</td>
					<td><input type="text" name="outmtrlDt"></td>
					<td>출하예정량</td>
					<td><input type="text" name="shipSch"></td>
					<td><input type="submit" value="조회"></td>
				</tr>
			</table>
		</form>
			<table>
				<tr>
					<td>현재고</td>
					<td>입고창고</td>
					<td>입고일자</td>
					<td>출고일자</td>
					<td>출하예정량</td>
				</tr>
				<c:forEach var="mtrInfo" items="${mtrInfo }">
					<tr id="sh" onclick="selectClnt('${mtrInfo.curStock }','${mtrInfo.whouse }','${mtrInfo.inmtrlDt }','${mtrInfo.outmtrlDt }','${mtrInfo.shipSch }')">
						<td>${mtrInfo.curStock }</td>
						<td>${mtrInfo.whouse }</td>
						<td>${mtrInfo.inmtrlDt }</td>
						<td>${mtrInfo.outmtrlDt }</td>
						<td>${mtrInfo.shipSch }</td>
					</tr>
				
					<script type="text/javascript">
					function selectClnt(a, b, c, d, e) { 
						opener.document.getElementById("curStock").value = a
						opener.document.getElementById("whouse").value = b
						opener.document.getElementById("inmtrlDt").value = c
						opener.document.getElementById("outmtrlDt").value = d
						opener.document.getElementById("shipSch").value = e
						window.close();
						}
					</script>
				</c:forEach>
			</table>
	
	
	<div id="pagination">

		<!-- 1페이지 이전 -->
		<c:if test="${pageDTO.currentPage > 1}">
			<a
				href="${pageContext.request.contextPath }/ship/mtrInfo?curStock=${search.curStock}&whouse=${search.whouse}&inmtrlDt=${search.inmtrlDt}&outmtrlDt=${search.outmtrlDt}&shipSch=${search.shipSch}&pageNum=${pageDTO.currentPage-1}"></a>
		</c:if>

		<!-- 10페이지 이전 -->
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a
				href="${pageContext.request.contextPath }/ship/mtrInfo?curStock=${search.curStock}&whouse=${search.whouse}&inmtrlDt=${search.inmtrlDt}&outmtrlDt=${search.outmtrlDt}&shipSch=${search.shipSch}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"></a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/ship/mtrInfo?curStock=${search.curStock}&whouse=${search.whouse}&inmtrlDt=${search.inmtrlDt}&outmtrlDt=${search.outmtrlDt}&shipSch=${search.shipSch}&pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- 1페이지 다음 -->
		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/mtrInfo?curStock=${search.curStock}&whouse=${search.whouse}&inmtrlDt=${search.inmtrlDt}&outmtrlDt=${search.outmtrlDt}&shipSch=${search.shipSch}&pageNum=${pageDTO.currentPage+1}">></a>
		</c:if>

		<!-- 10페이지 다음 -->
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/mtrInfo?curStock=${search.curStock}&whouse=${search.whouse}&inmtrlDt=${search.inmtrlDt}&outmtrlDt=${search.outmtrlDt}&shipSch=${search.shipSch}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
		</c:if>

	</div>
</body>
</html>
