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
function delComCd(cdGrp,cd) {
	if(confirm("정말 삭제하시겠습니까?")){
		$("#deleteForm #cdGrp").val(cdGrp); // ("#deleteForm #id" : deleteForm이라는 이름의 form의 id값만 가져온다 / val(memId) == function delMember(memId) 
		$("#deleteForm #cd").val(cd);
		$("#deleteForm").submit(); // deleteForm을 전송한다.
	}
}


function openPop(cdGrp) {
	window.open("/comCode/listPop?cdGrp="+cdGrp,"하위코드목록","width=750,height=600");
}

</script>
<!-- 스크립트 끝. -->

<div class="content_body">
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>

<h1>공통코드 조회</h1> <br><br>

		<table>
			<colgroup>
				<col width="20%">
				<col width="*">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
				<th>코드그룹</th>
				<th>그룹명</th>
				<th>사용여부</th>
				<th>하위코드</th>
				<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(comCodeList) eq 0}">
					<tr>
						<td colspan="5">결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${comCodeList }" var="dto" varStatus="i" > 
				<!-- 반복문. items=컨트롤러.model에서 넣어준 값(리스트가 받아올 배열이름) / var=for문 내부에서 사용할 변수 / varStatus = 상태용 변수 -->
					<tr>
						<td>${dto.cd }</td>
						<td><a href="/comCode/edit?cd=${dto.cd }">${dto.cdNm }</a></td>
						<td>${dto.useYn }</td>
						<td><button type="button" class="sm_btn" onclick="openPop('${dto.cd }')">하위코드 보기</button></td>
						<td><button type="button" class="sm_btn" onclick="delComCd('${dto.cdGrp }','${dto.cd }');">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody> 	
		</table>
		<br><br>
		
		<div class="fr">
		<button type="button" class="btn" onclick="location.href='/comCode/create'">등록</button>
		</div>
		<div class="clear"></div>
		

	<div class="center">
	 	<div class="pagination">			
			<c:choose>
				<c:when test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a href="/comCode/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">◀</a>
				</c:when>
				<c:otherwise>
					<a class="none">◀</a>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
				<a href="/comCode/list?pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageDTO.endPage < pageDTO.pageCount  }">
					<a href="/comCode/list?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">▶</a>
				</c:when>
				<c:otherwise>
					<a class="none">▶</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
 			


<form name="deleteForm" id="deleteForm" action="/comCode/delete"  method="POST">
 	<input type="hidden" id="cdGrp" name="cdGrp" value="">
 	<input type="hidden" id="cd" name="cd" value="">
</form>
<!-- 내용끝 -->
</div>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp" %>

