<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<link href="/resources/css/table.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

	$(document).ready(function() {
	
	
	});

	function create() {
	$('#createForm').submit();
	}
	
</script>
<!-- 스크립트 끝. -->

<div class="content_body">
<!-- 내용시작 -->
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>

	<form action="/comCode/insert" id="createForm" method="post">
	<input type="hidden" name="insertId" id="insertId" value="${sessionScope.id }">
	<input type="hidden" name="cdGrp" id="cdGrp" value="0000">
	
		<h1>‖ 공통코드 등록 ‖</h1><br><br>
		<table>
			<tr>
				<td>상위품번</td>
				<td><input type="cdGrp" name="cdGrp" id="cdGrp" placeholder="상위품번을 입력하세요" maxlength="5"></td>
			</tr>
			<tr>
				<td>상위품목</td>
				<td><input type="cdGrpNm" name="cdGrpNm" id="cdGrpNm" placeholder="상위품목을 입력하세요" ></td>
			</tr>
			<tr>
				<td>하위품번</td>
				<td><input type="cd" name="cd" id="cd" placeholder="하위품번을 입력하세요" maxlength="5"></td>
			</tr>
			<tr>
				<td>하위품목</td>
				<td><input type="cdNm" name="cdNm" id="cdNm" placeholder="하위품목을 입력하세요" ></td>
			</tr>
			<tr>
				<td>정렬순서</td>
				<td><input type="sortNum" name="sortNum" id="sortNum" placeholder="정렬순서를 입력하세요" ></td>
			</tr>
			<tr>
				<td>사용여부</td>
				<td>
				<input type="radio" name="useYn" value="Y" checked>사용 
				<input type="radio" name="useYn" value="N">미사용
				</td>
			</tr>
			
		</table><br><br>
 		<button type="button" onclick="create();">등록</button>
		<button type="reset">취소</button>
	</form>
	
	
	<!-- 내용끝 -->
</div>
<!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->