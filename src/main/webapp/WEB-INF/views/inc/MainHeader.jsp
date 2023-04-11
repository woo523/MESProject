<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>MES 주식회사</title>
	
	<!-- 공통CSS-->
<!-- 	<link href="/resources/css/reset.css"  rel="stylesheet" type="text/css"> -->
<!-- 	<link href="/resources/css/style.css"  rel="stylesheet" type="text/css"> -->
	<link href="/resources/css/jquery/jquery-ui.min.css" rel="stylesheet" type="text/css"  />
<!-- 	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap-datetimepicker.min.css"  media="screen"> -->
	
	<!-- 공통JS-->
	<script type="text/javascript" src="/resources/js/jquery/jquery-3.6.3.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-ui-1.9.2.custom.js"></script>  
	<script type="text/javascript" src="/resources/js/jquery/jquery-migrate-1.4.1.min.js"></script>  
	<script type="text/javascript" src="/resources/js/jquery/jquery.cookie.js"></script> 
	<script type="text/javascript" src="/resources/js/jquery/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.mCustomScrollbar.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap/bootstrap-datetimepicker.ko.js"></script>
	
	
	<style type="text/css">
	.topBar {
		height: 30px;
		background-color: #ececec;
		display: flex;
		justify-content: flex-end;
	}
	.topBar>div {
		font-size: 12px;
		color: #8C8C8C;
		margin: 5px 0px;
		padding: 0px 30px;
	}
	header {
		width: 100%;
		top: 0;
		left: 0;
		background: #ececec;
		height: 100px;
		display: flex;
		justify-content: center;
	}
	#login {
		cursor: pointer;
	}
	</style>
</head>


<body>
	<div class="topBar">
		<c:choose>
			<c:when test="${empty sessionScope.id}">
				<div id="login" onclick="location.href='${pageContext.request.contextPath }/login/login'">로그인</div>
			</c:when>
			<c:otherwise>
				<div >${name}(${id})</div>
				<div id="login" onclick="location.href='${pageContext.request.contextPath }/login/logout'">로그아웃</div>
			</c:otherwise>
		</c:choose>
	</div>
	<header>
		<img src="/resources/image/mes1.png" style="width: 220px; height: 100px;">
	</header>
		
	
