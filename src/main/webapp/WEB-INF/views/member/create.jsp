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
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>

	<form action="/member/insert" method="post">
		<h1>‖ 사용자 등록 ‖</h1>
		<br>
		<br>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" placeholder="아이디"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="이름"></td>
			</tr>
			<tr>
				<td>부서</td>
				<td><input type="text" name="departments" placeholder="부서"></td>
			</tr>
			<tr>
				<td>직책</td>
				<td><input type="text" name="position" placeholder="직책"></td>
			</tr>
			<tr>
				<td>이메일주소</td>
				<td><input type="text" name="email" placeholder="이메일주소"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tell" placeholder="전화번호"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone" placeholder="연락처"></td>
			</tr>
			<tr>
				<td>사용여부</td>

				<td>
				<input type="radio" name="useYn" value="Y">사용 
				<input type="radio" name="useYn" value="N">미사용
				</td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
 
	</form>
	<!-- 내용끝 -->
</div>
<!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->