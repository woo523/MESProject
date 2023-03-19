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
<form action="${pageContext.request.contextPath }/member/updatePro" method="post">
아이디 : <input type="text" name="id" value="${memberDTO.id }" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name" value="${memberDTO.name }"><br>
<input type="submit" value="회원정보수정">
</form>	
<a href="${pageContext.request.contextPath }/member/main">메인으로 이동</a>

<!-- 내용끝 -->
</div><!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp" %><!-- 지우면안됨 -->