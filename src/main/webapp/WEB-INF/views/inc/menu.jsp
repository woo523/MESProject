<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MESProject</title>
<!-- 공통CSS -->
<link href="/resources/css/menu.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 공통JS-->
<script type="text/javascript" src="/resources/js/jquery/jquery-3.6.3.js"></script>


</head>
<body>
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
<!-- 왼쪽 사이드 메뉴 스크립트 -->

    $(function () {
        $(".left_sub_menu").hide();
        $(".has_sub").click(function () {
            $(".left_sub_menu").fadeToggle(300);
        });
        // 왼쪽메뉴 드롭다운
        $(".sub_menu ul.small_menu").hide();
        $(".sub_menu ul.big_menu").click(function () {
            $("ul", this).slideToggle(300);
        });
        // 외부 클릭 시 좌측 사이드 메뉴 숨기기
        $('.overlay').on('click', function () {
            $('.left_sub_menu').fadeOut();
            $('.hide_sidemenu').fadeIn();
        });
    });
</script>

<!-- 스크립트 끝. -->

<!-- <div id="wrapper"> -->
        <div class="topbar" style="position: absolute; top:0;">
        	<div class="sidebar">
            <!-- 왼쪽 메뉴 -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub">
                                <img src="/resources/image/icon_menu.png" title="메뉴 아이콘"  style="width:45px">
<!--                             <a href="javascript:void(0);" class="waves-effect"> -->
                                <i class="fas fa-bars">
                                <!--메뉴 아이콘  제작자: FR_Media - Flaticon  --></a></i>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <div class="left_sub_menu">
                <div class="sub_menu">
<!--                     <input type="search" name="SEARCH" placeholder="SEARCH"> -->
                    <h2>MENU</h2>
                    <ul class="big_menu">
                        <li>시스템관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="#">사용자 관리</a></li>
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
                            <li><a href="#">실적등록</a></li>
                            <li><a href="#">생산실적 현황</a></li>
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
<!--             <div class="overlay"></div> -->
        </div>
<!-- </div> -->