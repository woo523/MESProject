<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%>
<link href="/resources/css/table.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
	function delMember() {
		$("#deleteForm").submit();
	}
</script>
<!-- 스크립트 끝. -->

<div class="content_body">
	<h1>‖ 사용자 조회 ‖</h1> <br><br>
		<table>
			<tr>
				<td>아이디</td>
				<td>${memberDTO.id }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${memberDTO.pass }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${memberDTO.name }</td>
			</tr>
			<tr>
				<td>부서</td>
				<td>${memberDTO.departments }</td>
			</tr>
			<tr>
				<td>직책</td>
				<td>${memberDTO.position }</td>
			</tr>
			<tr>
				<td>이메일주소</td>
				<td>${memberDTO.email }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${memberDTO.tell }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${memberDTO.phone }</td>
			</tr>
			<tr>
				<td>사용여부</td>
				<td>
				${memberDTO.useYn }
				</td>
			</tr>
		</table>
		<br><br><br>
		
 		<button type="button" onclick="location.href='/member/edit?id=${memberDTO.id }'">수정</button>
 		
 		<form name="deleteForm" id="deleteForm" action="/member/delete"  method="POST">
 		
 			<input type="hidden" name="id" value="${memberDTO.id }">
 	
 		</form>

 			<button type="button" onclick="delMember();">삭제</button>
</div>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->




