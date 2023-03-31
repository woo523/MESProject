<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>instruct insert</title>
</head>
<body>
	<h2>작업지시 등록</h2>
	<form action="${pageContext.request.contextPath }/work/InstrInsertPro" method="get">
		<ul>
			<li>작업지시번호 <input type="text" name="instrNum"></li>
			<li>거래처 정보 <input type="text"></li>
			<li>수주번호 <input type="text"></li>
			<li>지시상태
				<input type="checkbox" name="workSts1" value="지시" class="sCheck">지시
				<input type="checkbox" name="workSts2" value="시작" class="sCheck">시작
				<input type="checkbox" name="workSts3" value="마감" class="sCheck">마감 </li>
			<li>제품 정보 <input type="text"></li>
			<li>공정 정보 <input type="text"></li>
			<li>지시수량  <input type="text"></li>
			<li>등록일  <input type="text"> </li>
			<li>등록자  <input type="text"> </li>
		</ul>
		
		<input type="submit" value="등록">
		<button type="reset">취소</button>
	</form>
</body>
</html>