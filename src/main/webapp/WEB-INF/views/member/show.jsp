<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%>
<link href="/resources/css/table.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/common.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
	function delMember() {
		$("#deleteForm").submit();
	}
</script>
<!-- 스크립트 끝. -->

<div class="content_body">
<!-- 내용시작 -->
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>

	<h1>사용자 조회</h1> <br><br>
	
	<div style="width: 60%">
		<table class="view_table">
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<tbody>
			<tr>
				<th>아이디</th>
				<td>${memberDTO.id }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>${memberDTO.pass }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${memberDTO.name }</td>
			</tr>
			<tr>
				<th>부서</th>
				<td>${memberDTO.departmentsNm }</td>
			</tr>
			<tr>
				<th>직책</th>
				<td>${memberDTO.position }</td>
			</tr>
			<tr>
				<th>이메일주소</th>
				<td>${memberDTO.email }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${memberDTO.tell }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${memberDTO.phone }</td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td>
				${memberDTO.useYn }
				</td>
			</tr>
			</tbody>
		</table>
		<br><br><br>
		
		<div class="fr">
 			<button type="button" class="btn" onclick="location.href='/member/edit?id=${memberDTO.id }'">수정</button>
 			<button type="button" class="btn" onclick="delMember();">삭제</button>
 		</div>
		<div class="clear"></div>
 			
 	</div>
</div>

<form name="deleteForm" id="deleteForm" action="/member/delete"  method="POST">
	<input type="hidden" name="id" value="${memberDTO.id }">
</form>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
