<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출하정보</title>
<%@ include file="../inc/header2.jsp"%><!-- 지우면안됨 -->

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon-16x16.png">



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
	font-size: 1em;
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
h1{
	padding-left: 40px;
	padding-top: 10px;
	font-size: 22.5px;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}
#btn{
	width: 500px; 
	text-align: right;
	margin: 0px auto;
}

</style>
</head>


<body>

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">


</script>
<!-- 스크립트 끝. -->

<div id="main"> <!-- 지우면안됨 -->
<br>
<form>

	<h1>출하품목상세</h1>
	<div class="content">
		<div id="btn">
			<input type="button" value="수정" class="btn"
				onclick="location.href='${pageContext.request.contextPath}/ship/shupdate?shipId=${shipDTO.shipId }'">
			<input type="button" value="삭제" class="btn"
				onclick="location.href='${pageContext.request.contextPath}/ship/shdelete?shipId=${shipDTO.shipId }'">
			</div>
				<br>

	<table id="content" border="1">
<%-- 	<tr><td>${orderDTO.ordId }</td></tr> --%>
	
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
	<tr><td>수주량</td>
	<td>${shipDTO.ordQty }</td></tr>
	<tr><td>재고량</td>
	<td>${shipDTO.curStock }</td></tr>
	<tr><td>출하량</td>
	<td>${shipDTO.shipQty }</td></tr>
	</table>
	</div>
<br>

</form>
</div>
	
<!-- 	<div id="pagination"> -->

<!-- 		<!-- 1페이지 이전 --> -->
<%-- 		<c:if test="${pageDTO.currentPage > 1}"> --%>
<!-- 			<a -->
<%-- 				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${pageDTO.currentPage-1}"></a> --%>
<%-- 		</c:if> --%>

<!-- 		<!-- 10페이지 이전 --> -->
<%-- 		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}"> --%>
<!-- 			<a -->
<%-- 				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"></a> --%>
<%-- 		</c:if> --%>

<%-- 		<c:forEach var="i" begin="${pageDTO.startPage }" --%>
<%-- 			end="${pageDTO.endPage }" step="1"> --%>
<!-- 			<a -->
<%-- 				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${i}">${i}</a> --%>
<%-- 		</c:forEach> --%>

<!-- 		<!-- 1페이지 다음 --> -->
<%-- 		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}"> --%>
<!-- 			<a -->
<%-- 				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${pageDTO.currentPage+1}">></a> --%>
<%-- 		</c:if> --%>

<!-- 		<!-- 10페이지 다음 --> -->
<%-- 		<c:if test="${pageDTO.endPage < pageDTO.pageCount}"> --%>
<!-- 			<a -->
<%-- 				href="${pageContext.request.contextPath }/ship/shipInfo?shipNum=${search.shipNum}&shipQty=${search.shipQty}&shipDt=${search.shipDt}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a> --%>
<%-- 		</c:if> --%>

<!-- 	</div> -->
</body>
<!-- 푸터 -->
<%-- <%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 --> --%>
</html>
