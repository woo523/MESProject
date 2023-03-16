<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<meta charset="UTF-8">
<title>MESProject</title>

<!-- 공통CSS -->
<link href="/resources/css/header.css" rel="stylesheet" type="text/css">

<!-- 공통JS-->
<script type="text/javascript" src="/resources/js/jquery/jquery-3.6.3.js"></script>

</head>
<!-- <body> -->

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

</script>
<!-- 스크립트 끝. -->


<header>
<div class="container">
<!-- 	<div class="top-bar"> -->
	
<!-- 	<div id="login">사용자 oo님 반갑습니다</div> -->
<!-- <div id="login" onclick="location.href='MemberLogout.me'">로그아웃</div> -->
	
<!-- 		<div id="login" onclick="#">로그인</div> -->
<!-- 		<div id="login" onclick="#">회원가입</div> -->
	
<!-- 	</div> -->
    	
	    	<span class="cursor-pointer">
	    	<img src="/resources/image/logo.png" title="회사 로고" />
	    	<a href="#"></a>
	    	</span>
	    	<nav>
	    		<ul class='ul-main no_dot'>
	    			<li class="li-drop cursor-pointer">HOME</a></li>
	    			<li class="cursor-pointer"><a href="#">시스템관리</a></li>
	    			<li class="cursor-pointer"><a href="#">기준정보관리</a></li>
	    			<li class="cursor-pointer"><a href="#">영업관리</a></li>
	    			<li class="cursor-pointer"><a href="#">생산관리</a></li>
	    			<li class="cursor-pointer"><a href="#">자재관리</a></li>
	    		</ul>
	    		<ul> </ul>
	    	</nav>
    	</div>
    </header>

<jsp:include page="menu.jsp"/>
