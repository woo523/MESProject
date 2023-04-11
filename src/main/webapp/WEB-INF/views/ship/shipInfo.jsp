<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출하정보</title>
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<style type="text/css">
 table {
      width: 1125px;  
   } 

th,td{
border-bottom: 1px solid black;
padding: 10px;
}
#th {
	font-weight: bold;
}

#con {
	text-align: center;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}



h1{
	font-weight: bold;
}

.search_bar tr, td{
 border:0px;
}

table#search {
 border:1px solid;
}

table#detail {
 border:1px solid;
}
table#info {
 border:1px solid;
}


#btn{
      width: 1125px; 
	text-align: right;
 
}
#pagination{
      width: 1125px;  
text-align: center;
}

#num:hover{
	background-color : #e1e1e1;
}

.form-control{
	width:150px;
	background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#pcd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#pnm {
	background-color: #EAEAEA;
	border: 1px solid;
}

</style>
</head>


<body>

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">


</script>
<!-- 스크립트 끝. -->

<div class="content_body"> <!-- 지우면안됨 -->
<br>
<form>

	<h1>출하품목상세</h1>
	<div class="content">
		<div id="btn">
			<input type="button" value="수정" class="btn"
				onclick="location.href='${pageContext.request.contextPath}/ship/shupdate?ordId=${shipDTO.shipId }'">
			<input type="button" value="삭제" class="btn"
				onclick="location.href='${pageContext.request.contextPath}/ship/shdelete?ordId=${shipDTO.shipId }'">
			</div>
				<br>

	<table id="content" border="1">
	<tr><td>${orderDTO.ordId }</td></tr>
	
	<tr><td>출하고객</td>
	<td>${shipDTO.clntNm }</td></tr>
	<tr><td>출하일자</td>
	<td>${shipDTO.shipDt }</td></tr>
	<tr><td>담당자</td>
	<td>${shipDTO.userNm }</td></tr>
	<tr><td>납품예정일</td>
	<td>${shipDTO.dlvryDt }</td></tr>
	<tr><td>품번</td>
	<td>${shipDTO.itemNum }</td></tr>
	<tr><td>품명</td>
	<td>${shipDTO.itemNm }</td></tr>
	<tr><td>단위</td>
	<td>${shipDTO.invntUnit }</td></tr>
	<tr><td>수량</td>
	<td>${shipDTO.shipQty }</td></tr>
	</table>
	</div>
<br>

</form>
</div>
	
	<div id="pagination">

		<!-- 1페이지 이전 -->
		<c:if test="${pageDTO.currentPage > 1}">
			<a
				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${pageDTO.currentPage-1}"></a>
		</c:if>

		<!-- 10페이지 이전 -->
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a
				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"></a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- 1페이지 다음 -->
		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${pageDTO.currentPage+1}">></a>
		</c:if>

		<!-- 10페이지 다음 -->
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
		</c:if>

	</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
</html>
