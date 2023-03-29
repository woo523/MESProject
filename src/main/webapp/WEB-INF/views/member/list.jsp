<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp" %>
<link href="/resources/css/tablelist.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/common.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
function delMember(memId) {
	if(confirm("정말 삭제하시겠습니까?")){
		$("#deleteForm #id").val(memId); // ("#deleteForm #id" : deleteForm이라는 이름의 form의 id값만 가져온다 / val(memId) == function delMember(memId) 
		$("#deleteForm").submit(); // deleteForm을 전송한다.
	}
}
</script>
<!-- 스크립트 끝. -->

<div class="content_body">
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>

<h1>‖ 사용자 조회 ‖</h1> <br><br>
		<table>
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>부서</th>
					<th>직책</th>
					<th>연락처</th>
					<th>사용여부</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>		
				<c:if test="${fn:length(memberList) eq 0}">
					<tr>
						<td colspan="7">결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${memberList }" var="dto" varStatus="i" > 
				<!-- 반복문. items=컨트롤러.model에서 넣어준 값(리스트가 받아올 배열이름) / var=for문 내부에서 사용할 변수 / varStatus = 상태용 변수 -->
					<tr>
						<td>${dto.id }</td>
						<td>
							<a href="/member/show?id=${dto.id }">${dto.name }</a>
						</td>
						<td>${dto.departmentsNm }</td><!-- DTO에 추가한 이름으로 뿌려주기 -->
						<td>${dto.positionNm }</td>
						<td>${dto.phone }</td>
						<td>${dto.useYn }</td>
						<td><button type="button" class="sm_btn" onclick="delMember('${dto.id }');">삭제</button></td>
					</tr>
				</c:forEach> 	
			</tbody>	
		</table>
		<br><br>
		
		<div class="fr">
			<button type="button" class="btn" onclick="location.href='/member/create'">등록</button>
		</div>
		<div class="clear"></div>
		

 	<div class="center">
	 	<div class="pagination">			
			<c:choose>
				<c:when test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a href="/member/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">◀</a>
				</c:when>
				<c:otherwise>
					<a class="none">◀</a>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
				<a href="/member/list?pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageDTO.endPage < pageDTO.pageCount  }">
					<a href="/member/list?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">▶</a>
				</c:when>
				<c:otherwise>
					<a class="none">▶</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


<form name="deleteForm" id="deleteForm" action="/member/delete"  method="POST">
	<input type="hidden" id="id" name="id" value="">
</form>
 		
<!-- 내용끝 -->
</div>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp" %>

