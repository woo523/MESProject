<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<link href="/resources/css/table.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/common.css"  rel="stylesheet" type="text/css">
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

	<h1>‖ 공통코드 등록 ‖</h1><br><br>
	
	<div style="width: 60%">
		<form action="/comCode/insert" id="createForm" method="post">
		<input type="hidden" name="insertId" id="insertId" value="${sessionScope.id }">
		<input type="hidden" name="cdGrp" id="cdGrp" value="0000">
		<input type="hidden" name="sortNum" id="sortNum" value="1">
			
			<table>
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
				<tr>
					<th>코드그룹</th>
					<td><input type="text" name="cd" id="cd" placeholder="코드그룹을 입력하세요"></td>
				</tr>
				<tr>
					<th>코드그룹명</th>
					<td><input type="text" name="cdNm" id="cdNm" placeholder="코드그룹명을 입력하세요" ></td>
				</tr>
				<tr>
					<th>사용여부</th>
					<td>
						<input type="radio" name="useYn" value="Y" checked>사용 
						<input type="radio" name="useYn" value="N">미사용
					</td>
				</tr>
				</tbody>
			</table><br><br>
			
			<div class="fr">
				<button type="button" class="btn" onclick="create();">등록</button>
				<button type="reset" class="btn">취소</button>
			</div>
			<div class="clear"></div>
	 		
		</form>
	</div>
	
	<!-- 내용끝 -->
</div>
<!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->