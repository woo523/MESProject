<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<!-- 헤더 -->
<%@ include file="../inc/header.jsp" %>
<style type="text/css">
table {

	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 1125px;
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
  width:1125px;
}

</style>

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

</script>
<!-- 스크립트 끝. -->
</head>
<body>

<div class="content_body">
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="${pageContext.request.contextPath }/login/login"></c:redirect>
</c:if>

<h1>권한 관리</h1> <br><br>


	<table border="1" id="main">
	
	<tr id="th"><th>아이디</th>
					<th>이름</th>
					<th>부서</th>
					<th>직책</th>
					<th>권한</th></tr>
	
	
<c:forEach items="${memberList }" var="dto"> 
					<tr id="con">
						<td>${dto.id }</td>
						<td>${dto.name }</td>
						<td>${dto.departmentsNm }</td>
						<td>${dto.positionNm }</td>
						<td><button type="button" class="sm_btn" onclick="location.href='${pageContext.request.contextPath }/auth/auth?userId=${dto.id }'">권한 설정하기</button></td>
					</tr>
				</c:forEach> 	

    </table>
<br>
<br>

<div class="center">
<div id="pagination">
	<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/auth/user&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/auth/user?pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>


	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/auth/user?pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/auth/user?pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/auth/user?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	
</div>
</div>

 		
<!-- 내용끝 -->
</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp" %>

