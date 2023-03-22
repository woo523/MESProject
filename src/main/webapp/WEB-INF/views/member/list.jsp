<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 -->
<%@ include file="../inc/header.jsp" %>
<link href="/resources/css/tablelist.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
function delMember(memId) {
	$("#deleteForm #id").val(memId); // deleteForm이라는 이름의 form의 id값/
	$("#deleteForm").submit();
}
</script>
<!-- 스크립트 끝. -->

<div class="content_body">
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>


<h1>‖ 사용자 조회 ‖</h1>
		<br>
		<br>
		<table>
			<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>부서</th>
			<th>직책</th>
			<th>연락처</th>
			<th>사용여부</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${memberList }" var="dto" varStatus="i">
			<tr>
				<td>${dto.id }</td>
				<td>
					<a href="/member/show?id=${dto.id }">${dto.name }</a>
				</td>
				<td>${dto.departments }</td>
				<td>${dto.position }</td>
				<td>${dto.phone }</td>
				<td>${dto.useYn }</td>
				<td><button type="button" onclick="delMember('${dto.id }');">삭제</button></td>
			</tr>
		</c:forEach> 	
		</table>
		<br><br>
		<button type="button" onclick="location.href='/member/create'">등록</button>
		
		<form name="deleteForm" id="deleteForm" action="/member/delete"  method="POST">
 			<input type="hidden" id="id" name="id" value="">
 		</form>

 			


<!-- 내용끝 -->
</div>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp" %>

