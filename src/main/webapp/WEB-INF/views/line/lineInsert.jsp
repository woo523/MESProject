<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Line insert</title>
</head>
<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
	<h2>라인 등록</h2> 
	<br>
	<form action="${pageContext.request.contextPath}/line/lineInsertPro" method="post">
		<ul>
			<li>라인코드 <input type="text" name="lineCode"></li>
			<li>등록자  <input type="text" name="insertId" value="${sessionScope.id}" readonly> </li>
			<li>라인명 <input type="text" name="lineName" ></li>
			<li>공정 	<select name="proCode">
							<option value="" selected>전체</option>
							<option value="사출">사출</option>
							<option value="포장">포장</option>
						</select></li>
			<li>작업장   <select name="linePlace">
							<option value="" selected>전체</option>
							<option value="1">작업장1</option>
							<option value="2">작업장2</option>
						</select></li>			
			<li>일렬번호 <input type="text" name="sortOrder"> </li>
			<li>사용여부 <input type="radio" name="useChoice" value="Y" class="sCheck">Y
						 <input type="radio" name="useChoice" value="N" class="sCheck">N</li>
			<li>비고 <textarea rows="5" cols="30" name="note"></textarea></li>
		</ul>
		
		<input type="submit" value="등록">
		<button type="reset">취소</button>
	</form>
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

<script type="text/javascript">

</script>

</html>