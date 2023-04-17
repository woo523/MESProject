<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">

<style type="text/css">
@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

body{
	font-family: 'TheJamsil5Bold';

	background-color: black;
	color : white;
	margin-top: 50px;
}

table{
	text-align: center;
	margin : 0px auto;
	font-size: 35pt;
}

.popcontainer{
	width: 1450px;
	
	margin : 0px auto;

}

#submit{
	text-align: center;
}

#title{
	text-align: center;
	font-size: 50pt;
}

#subti{
	text-align : center;
	font-size : 40pt; 
 }
 
 td{
padding : 20px;
 }
 
.id, .pass{
	width:300px;
	height: 80px;
}
</style>
</head>
<body>

<div class = popcontainer>
<br><br><br><br>
<br><br><br>
<div id="title">
MES 주식회사</div>
<div id="subti">
현장 생산 관리시스템</div>
<br>
<br>
<br>
	<form action="${pageContext.request.contextPath }/work/loginPro" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" class="id" style="font-size:40pt; 	font-family: 'TheJamsil5Bold';"></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" class="pass" style="font-size:40pt; 	font-family: 'TheJamsil5Bold';"></td>
			</tr>
		</table>
		<br>
			<div id="submit"><input type="submit" value="로그인" style="width:200px; height:80px; font-size:35pt; font-family: 'TheJamsil5Bold';"></div>
	</form>
	
</div>
</body>
</html>