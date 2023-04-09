<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<link href="/resources/css/tablelist.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/common.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
function delMember(id) {
	if(confirm("정말 삭제하시겠습니까?")){
		$("#deleteForm #id").val(id); // ("#deleteForm #id" : deleteForm이라는 이름의 form의 id값만 가져온다 / val(memId) == function delMember(memId) 
		$("#deleteForm").submit(); // deleteForm을 전송한다.
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

	<h1>‖ 시스템메뉴 등록 ‖</h1><br><br>
	<div style="width: 60%">
		<form action="/menu/insert" id="createForm" method="post">
			<input type="hidden" name="insertId" id="insertId" value="${sessionScope.id }">

			<table>
				<thead>
					<tr>
						<th>메뉴코드</th>
						<th>상위메뉴코드</th>
						<th>메뉴명</th>
						<th>정렬순서</th>
						<th>URL</th>
						<th>사용여부</th>
						<th>비고</th>
					</tr>
				</thead>	
				<tbody>
					<c:if test="${fn:length(menulist) eq 0}">
					<tr>
						<td colspan="7">결과가 없습니다.</td>
					</tr>
					</c:if>
				<c:forEach items="${memberList }" var="dto" varStatus="i" > 	
					<tr>
						<td>${dto.menuCd}</td>
						<td>${dto.upperMenuCd}</td>
						<td>${dto.menuNm}</td>
						<td>${dto.sortNum}</td>
						<td>${dto.url}</td>
						<td>${dto.useYn }
						<td><button type="button" class="sm_btn" onclick="delMember('${dto.id }');">삭제</button></td>
				</c:forEach> 				
				</tbody>
			</table>
			<br><br>
			<div class="fr">
				<button type="button" class="btn" onclick="create();">등록</button>
			</div>
			<div class="clear"></div>
		</form>
	</div>
	









<!-- 내용끝 -->
</div>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->