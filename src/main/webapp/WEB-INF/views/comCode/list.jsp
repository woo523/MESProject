<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 -->
<%@ include file="../inc/header.jsp" %>
<link href="/resources/css/tablelist.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
function delMember(memId) {
	$("#deleteForm #id").val(memId); // ("#deleteForm #id" : deleteForm이라는 이름의 form의 id값만 가져온다 / val(memId) == function delMember(memId) 
	$("#deleteForm").submit(); // deleteForm을 전송한다.
}
</script>
<!-- 스크립트 끝. -->

<div class="content_body">
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>

<h1>‖ 공통코드 조회 ‖</h1> <br><br>
		<table>
			<tr>
			<th>상위코드</th>
			<th>하위코드</th>
			<th>하위코드명</th>
			<th>정렬순서</th>
			<th>사용여부</th>
			</tr>
			
		<c:forEach items="${comCodeList }" var="dto" varStatus="i" > 
		<!-- 반복문. items=컨트롤러.model에서 넣어준 값(리스트가 받아올 배열이름) / var=for문 내부에서 사용할 변수 / varStatus = 상태용 변수 -->
			<tr>
				<td>${dto.cdGrp }</td>
				<td>${dto.cd }</td>
				<td>${dto.cdNm }</td>
				<td>${dto.sortNum }</td>
				<td>${dto.useYn }</td>
			</tr>
			
		</c:forEach> 	
		</table>
		<br><br>
		<button type="button" onclick="location.href='/comCode/create'">등록</button>
		
		<form name="deleteForm" id="deleteForm" action="/comCode/delete"  method="POST">
 			<input type="hidden" id="id" name="id" value="">
 		</form>

 			
 			
 	<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
		<a href="/comCode/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
		<a href="/comCode/list?pageNum=${i}">${i}</a>
	</c:forEach>
	
	<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
		<a href="/comCode/list?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>



<!-- 내용끝 -->
</div>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp" %>

