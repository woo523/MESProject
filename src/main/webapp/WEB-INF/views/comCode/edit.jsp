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

	function edit() {
	if (!valChk($("#cdNm"), "코드그룹명")) return false;
	$('#editForm').submit();
	}

	function valChk(obj, alias) {
		if ($(obj).val() == "") {
			alert(alias + '을(를) 입력하세요.');
			$(obj).focus();
			return false;
		} else {
			return true;
		}
	}
</script>
<!-- 스크립트 끝. -->

<div class="content_body">
	<!-- 내용시작 -->
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>

	<h1>공통코드 수정</h1><br><br>

	<div style="width: 60%">
		<form action="/comCode/update" id="editForm" method="post">
		<input type="hidden" name="updateId" id="updateId" value="${sessionScope.id }">
		<input type="hidden" name="cdGrp" id="cdGrp" value="${comCodeDTO.cdGrp }">
		<input type="hidden" name="sortNum" id="sortNum" value="1">
		
		<table>
			<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
				<tr>
					<th>코드그룹</th>
					<td><input type="text" name="cd" id="cd" value="${dto.cd }" readonly></td>
				</tr>
				<tr>
					<th>코드그룹명</th>
					<td><input type="text" name="cdNm" id="cdNm" value="${dto.cdNm }" placeholder="코드그룹명을 입력하세요"></td>
				</tr>
				<tr>
					<th>사용여부</th>
					<td>
						<input type="radio" name="useYn" value="Y" <c:if test="${dto.useYn eq 'Y'}">checked</c:if>>사용 
						<input type="radio" name="useYn" value="N"<c:if test="${dto.useYn eq 'N'}">checked</c:if>>미사용
					</td>
				</tr>
				</tbody>
			</table><br><br>
			
			<div class="fr">
				<button type="button" class="btn" onclick="edit();">수정</button>
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