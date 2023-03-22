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
	<!-- 지우면안됨 -->
	<!-- 내용시작 -->

	<!-- http://localhost:8080/myweb/member/insert -->
	<!-- http://localhost:8080/myweb/member/insertPro -->

	<form action="/member/update" method="post">
		<h1>‖ 사용자 수정 ‖</h1>
		<br>
		<br>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${memberDTO.id }" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" value="${memberDTO.pass }" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${memberDTO.name }" placeholder="이름"></td>
			</tr>
			<tr>
				<td>부서</td>
				<td><input type="text" name="departments" value="${memberDTO.departments }" placeholder="부서"></td>
			</tr>
			<tr>
				<td>직책</td>
				<td><input type="text" name="position" value="${memberDTO.position }" placeholder="직책"></td>
			</tr>
			<tr>
				<td>이메일주소</td>
				<td><input type="text" name="email" value="${memberDTO.email }" placeholder="이메일주소"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tell" value="${memberDTO.tell }" placeholder="전화번호"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone"  value="${memberDTO.phone }" placeholder="연락처"></td>
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
		<input type="submit" value="수정하기">
		<input type="reset" value="수정취소">
	</form>
	<button type="button" onclick="location.href='/member/list'">
 		메인으로 이동
 		</button>
	<!-- 내용끝 -->
</div>
<!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->