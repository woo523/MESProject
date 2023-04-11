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

<!-- <style type="text/css"> -->
<!-- /* .sub_menu ul.small_menu1,ul.small_menu2,ul.small_menu3,ul.small_menu4,ul.small_menu5{ */
/* 		color: #333; */
/* 	font-size: 14px; */
/* 	font-weight: 600; */
/* } */ -->
<!-- </style>	 -->
</head>

<!-- 스크립트 끝. -->
<body>
	<div class="container">
		<div class="topBar">
		<c:choose>
			<c:when test="${id==null }">
				<div id="login" onclick="location.href='${pageContext.request.contextPath }/login/login'">로그인</div>
			</c:when>
			<c:otherwise>
				<div >${name }(${id })</div>
				<div id="login" onclick="location.href='${pageContext.request.contextPath }/login/logout'">로그아웃</div>
				
			</c:otherwise>
		</c:choose>
		
		</div>
		
		<header>
			<img style="width: 250px; height: 135px;" src="/resources/image/mes.png" onclick="location.href='${pageContext.request.contextPath }/main/main'">
		</header>
		
		<div class="containerBody">
		<div class="side">
			<div class="left_sub_menu">
                <div class="sub_menu">
                    <c:if test="${not empty menu1 || not empty menu2 || not empty menu3}">
                    <ul class="big_menu1">            	
                        <li>시스템관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu1" id="sub1">
                        	<c:if test="${not empty menu1}">
                            <li><a href="${pageContext.request.contextPath}/member/list">사용자 관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu2}">
                            <li><a href="${pageContext.request.contextPath}/auth/user">권한 관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu3}">
                            <li><a href="${pageContext.request.contextPath}/comCode/list">공통 코드 관리</a></li>
							</c:if>
                        </ul>
                    </ul>
                    </c:if>
                    <c:if test="${not empty menu4 || not empty menu5 || not empty menu6 || not empty menu7 || not empty menu8}">
                    <ul class="big_menu2">
                        <li>기준정보 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu2" id="sub2">
                        	<c:if test="${not empty menu4}">
                            <li><a href="${pageContext.request.contextPath}/mdm/item">품목정보 관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu5}">
                            <li><a href="${pageContext.request.contextPath}/mdm/client">거래처정보 관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu6}">
                            <li><a href="${pageContext.request.contextPath}/line/line">라인정보 관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu7}">
                            <li><a href="${pageContext.request.contextPath}/mdm/equip">설비정보 관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu8}">
                            <li><a href="${pageContext.request.contextPath}/mdm/storage">창고정보 관리</a></li>
                            </c:if>
                        </ul>
                    </ul>
                    </c:if>
                    <c:if test="${not empty menu9 || not empty menu10 || not empty menu11 || not empty menu12}">
                    <ul class="big_menu3">
                        <li>영업 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu3" id="sub3">
                        	<c:if test="${not empty menu9}">
                            <li><a href="${pageContext.request.contextPath }/order/orderMng">수주관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu10}">
                            <li><a href="${pageContext.request.contextPath }/order/orderSts">수주현황</a></li>
                            </c:if>
                            <c:if test="${not empty menu11}">
                            <li><a href="${pageContext.request.contextPath }/ship/shipAdmin">출하관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu12}">
                            <li><a href="${pageContext.request.contextPath }/ship/shipList">출하현황</a></li>
                            </c:if>
                        </ul>
   					</ul>
   					</c:if>
   					<c:if test="${not empty menu13 || not empty menu14 || not empty menu15 || not empty menu16}">
                    <ul class="big_menu4">
                        <li>생산 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu4" id="sub4">
                        	<c:if test="${not empty menu13}">
                            <li><a href="${pageContext.request.contextPath}/work/instructList">작업지시 정보관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu14}">
                            <li><a href="${pageContext.request.contextPath}/work/instructState">작업지시 현황</a></li>
                            </c:if>
                            <c:if test="${not empty menu15}">
                            <li><a href="${pageContext.request.contextPath }/work/performRegist">실적등록</a></li>
                            </c:if>
                            <c:if test="${not empty menu16}">
                            <li><a href="${pageContext.request.contextPath }/work/performList">생산실적 현황</a></li>
                            </c:if>
                        </ul>
                    </ul>
                    </c:if>
                    <c:if test="${not empty menu17 || not empty menu18 || not empty menu19}">
                     <ul class="big_menu5">
                        <li>자재 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu5" id="sub5">
                       	    <c:if test="${not empty menu17}">
                            <li><a href="${pageContext.request.contextPath }/material/inmaterList">자재입고 관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu18}">
                            <li><a href="${pageContext.request.contextPath }/material/outmaterList">자재출고 관리</a></li>
                            </c:if>
                            <c:if test="${not empty menu19}">
                            <li><a href="${pageContext.request.contextPath }/material/materialState">자재재고 현황</a></li>
                            </c:if>
                        </ul>   
                    	</ul>    
                    </c:if>
                </div>
            </div>
		</div>
		<div class="content">
		
		

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
// $(document).ready(function(){

// 	// 왼쪽메뉴 드롭다운
// 	$(".sub_menu ul.small_menu").hide();
// 	$(".sub_menu ul.big_menu").click(function () {

// 		$("ul", this).slideDown();
// 		$(this).addClass("active");
// 	});
	
// 	// 왼쪽메뉴 드롭다운
// 	$(".sub_menu ul.big_menu").click(function () {
// 		$("ul", this).slideUp();
// 	});	
// });

let subToggle=true;
$(".sub_menu ul.small_menu1,ul.small_menu2,ul.small_menu3,ul.small_menu4,ul.small_menu5").hide();
$(".sub_menu ul.big_menu1").click(()=>{
  if(subToggle){
    $("#sub1").slideDown(1000);
  }else{
    $("#sub1").slideUp(1000);
  }
  subToggle=!subToggle;
});

$(".sub_menu ul.big_menu2").click(()=>{
	  if(subToggle){
	    $("#sub2").slideDown(1000);
	  }else{
	    $("#sub2").slideUp(1000);
	  }
	  subToggle=!subToggle;
	});
	
$(".sub_menu ul.big_menu3").click(()=>{
	  if(subToggle){
	    $("#sub3").slideDown(1000);
	  }else{
	    $("#sub3").slideUp(1000);
	  }
	  subToggle=!subToggle;
	});

$(".sub_menu ul.big_menu4").click(()=>{
	  if(subToggle){
	    $("#sub4").slideDown(1000);
	  }else{
	    $("#sub4").slideUp(1000);
	  }
	  subToggle=!subToggle;
	});

$(".sub_menu ul.big_menu5").click(()=>{
	  if(subToggle){
	    $("#sub5").slideDown(1000);
	  }else{
	    $("#sub5").slideUp(1000);
	  }
	  subToggle=!subToggle;
	});


</script>