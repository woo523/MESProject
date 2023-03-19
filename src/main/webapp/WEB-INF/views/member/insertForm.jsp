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

<!-- http://localhost:8080/myweb/member/insert -->
<!-- http://localhost:8080/myweb/member/insertPro -->
<form action="${pageContext.request.contextPath }/member/insertPro" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name"><br>
부서 : <input type="text" name="departments"><br>
직책 : <input type="text" name="position"><br>
이메일주소 : <input type="text" name="email"><br>
전화번호 : <input type="text" name="tell"><br>
연락처 : <input type="text" name="phone"><br>
사용여부 : <input type="radio" name="useYn" value="Y">사용
		<input type="radio" name="useYn" value="N">미사용<br>
<input type="submit" value="회원가입">
</form>

<!-- 내용끝 -->
</div><!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp" %><!-- 지우면안됨 -->