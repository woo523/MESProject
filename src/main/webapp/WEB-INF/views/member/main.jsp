<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 -->
<%@ include file="../inc/header.jsp" %><!-- 지우면안됨 -->

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

</script>
<!-- 스크립트 끝. -->


<div class="content_body"> <!-- 지우면안됨 -->
<!-- 내용시작 -->
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/member/login"></c:redirect>
</c:if>

<!--  달러중괄호중괄호: 출력 , sessionScope :세션내장객체 , .id =세선의 이름 -->
<!-- 달러중괄호중괄호는 주석처리해도 프로그램에서 인식하니까 오류 주의할 것! -->
${sessionScope.id }님 로그인 하셨습니다.  
<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a><br>
<a href="${pageContext.request.contextPath }/member/info">회원정보조회</a><br>
<a href="${pageContext.request.contextPath }/member/update">회원정보수정</a><br>
<a href="${pageContext.request.contextPath }/member/delete">회원정보삭제</a><br>

<!-- 아이디가 비어있지않고  -->
<c:if test="${ ! empty sessionScope.id }"> 
	<!-- admin이면 회원목록이 보이게 -->
	<c:if test="${sessionScope.id eq 'admin'}"> 
		<a href="${pageContext.request.contextPath }/member/list">회원목록</a><br>
	</c:if>
</c:if>

<a href="${pageContext.request.contextPath }/member/BoardWriteForm.bo">글쓰기</a><br>
<a href="${pageContext.request.contextPath }/member/BoardList.bo">글목록</a><br>
<a href="${pageContext.request.contextPath }/member/FileBoardWriteForm.bo">첨부파일 글쓰기</a><br>
<!-- 내용끝 -->
</div><!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp" %><!-- 지우면안됨 -->

