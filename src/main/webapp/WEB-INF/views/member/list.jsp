<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 -->
<%@ include file="../inc/header.jsp" %><!-- 지우면안됨 -->

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

</script>
<!-- 스크립트 끝. -->

<div class="content_body"> <!-- 지우면안됨 -->
<!-- 내용시작 -->

<h1>member/list.jsp</h1>

	<table border="1">
	
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입날짜</td>
		</tr>
		
		<%-- 	<c:forEach var="변수"	 items="배열"> --%>
		<c:forEach var="memberDTO" items="${memberList }">
			<tr>
				<td>${memberDTO.id }</td>
				<td>${memberDTO.pass }</td>
				<td>${memberDTO.name }</td>
				<td>${memberDTO.date }</td>
			</tr>
		</c:forEach>
		
	</table>
<!-- 내용끝 -->
</div><!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp" %><!-- 지우면안됨 -->