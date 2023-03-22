<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<link href="/resources/css/table.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
	
</script>
<!-- 스크립트 끝. -->


<div class="content_body">
	<!-- 내용시작 -->
	<form action="${pageContext.request.contextPath }/login/loginPro" method="post">
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id"></td>
			</tr>
			
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="pass"></td>
			</tr>
		</table>
		<br>
			<input type="submit" value="로그인">
	</form>
	<!-- 내용끝 -->
</div>
<!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->