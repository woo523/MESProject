<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>MES 주식회사</title>
	
	<!-- 공통CSS-->
	<link href="/resources/css/reset.css"  rel="stylesheet" type="text/css">
	<link href="/resources/css/style.css"  rel="stylesheet" type="text/css">
	<link href="/resources/css/jquery/jquery-ui.min.css" rel="stylesheet" type="text/css"  />
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap-datetimepicker.min.css"  media="screen">
	
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

	
</head>

<!-- 스크립트 끝. -->
<body>
	<div class="container">
		<div class="topBar">
		
		<c:choose>
			<c:when test="${id==null }">
				<div id="login" onclick="location.href='${pageContext.request.contextPath }/member/login'">로그인</div>
			</c:when>
			<c:otherwise>
				<div id="login">로그인 아이디:${id }</div>
				<div id="login" onclick="location.href='${pageContext.request.contextPath }/member/logout'">로그아웃</div>
			</c:otherwise>
		</c:choose>
		
		</div>
		
		<header>
			<img src="/resources/image/logo.png" title="로고" onclick="location.href='${pageContext.request.contextPath }/member/login'">
		</header>
		
		<div class="containerBody">
		<div class="side">
			<div class="left_sub_menu">
                <div class="sub_menu">
                    <ul class="big_menu">
                        <li>시스템관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="${pageContext.request.contextPath }/member/list">사용자 관리</a></li>
                            <li><a href="#">권한 관리</a></li>
                            <li><a href="">공통 코드 관리</a></li>
                            <li><a href="#">시스템 메뉴 관리</a></li>
                        </ul>
                    </ul>
                    <ul class="big_menu">
                        <li>기준정보 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">품목정보 관리</a></li>
                            <li><a href="#">소요량 관리</a></li>
                            <li><a href="#">라인정보 관리</a></li>
                            <li><a href="#">거래처정보 관리</a></li>
                        </ul>
                    </ul>
                    <ul class="big_menu">
                        <li>영업 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">수주관리</a></li>
                            <li><a href="#">수주현황</a></li>
                            <li><a href="#">출하관리</a></li>
                            <li><a href="#">출하현황</a></li>
                        </ul>
   					</ul>
                    <ul class="big_menu">
                        <li>생산 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">작업지시 정보관리</a></li>
                            <li><a href="#">작업지시 현황</a></li>
                            <li><a href="${pageContext.request.contextPath }/work/performRegist">실적등록</a></li>
                            <li><a href="${pageContext.request.contextPath }/work/performList">생산실적 현황</a></li>
                        </ul>
                    </ul>
                     <ul class="big_menu">
                        <li>자재 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">자재입고 관리</a></li>
                            <li><a href="#">자재출고 관리</a></li>
                            <li><a href="#">자재재고 현황</a></li>
                        </ul>   
                    	</ul>    
                </div>
            </div>
		</div>
		<div class="content">
		
		

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
$(document).ready(function(){

	// 왼쪽메뉴 드롭다운
	$(".sub_menu ul.small_menu").hide();
	$(".sub_menu ul.big_menu").click(function () {

		$("ul", this).fadeIn();
		$(this).addClass("active");
	});
	
});
</script>