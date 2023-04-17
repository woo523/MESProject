<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>MES 주식회사</title>
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">
	<!--Bootstrap Css-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<!--Font-aweome-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
	<!--Custom Css-->
	<link type="text/css" rel="stylesheet" href="/resources/css/login.css" />

	<script type="text/javascript" src="/resources/js/jquery/jquery-3.6.3.js"></script>
</head>

<body>


<script type="text/javascript">


	$(document).ready(function() {
	
	
	});


	
	function login() {
		if (!valChk($("#id"), "아이디")) return false;
		if (!valChk($("#login_password"), "비밀번호")) return false;
		
		
		$('#loginForm').submit();
	}
	
	

	function valChk(obj, alias) {
		if ($(obj).val() == "") {
			alert(alias + '을(를) 입력하세요.');
			$(obj).focus();
			return false;
		} else {
			return true;
		}
	}

	function onKeyUp() {
		if(window.event.keyCode == '13'){
			login();
		}
	}
</script>

  <section class="login_section">
    <div class="container outer_container accounts_container">
      <div class="row h-100">
        <div class="col col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
          <div class="accounts_image w-100 h-100">
            <img src="/resources/image/logo.png" alt="accounts_image" class="img-fluid" />
          </div>
          <!--accounts_image-->
        </div>
        <!--account_col-->
        <div class="col col-lg-4 m-0 p-0 accounts_col" style="background: #eeeeee;">
          <!--accounts_forms-->
          <div class="accounts_forms  w-100 h-100" id="login">
            <div class="title  mt-4 p-4 w-100" style="margin-top: 100px!important;">
              <h1>Login</h1>
              <p class="mt-3">아이디와 비밀번호를 입력해주세요.</p>
            </div>
            <!--title-->
            <form name="loginForm" id="loginForm" class="form w-100 p-4" action="/login/loginPro" method="post">
              <div class="form-group">
                <label for="email">아이디</label>
                <input type="text" id="id" name="id" class="form-control" onfocus="labelUp(this)" onblur="labelDown(this)" onkeyup="onKeyUp()" required />
              </div>
              <div class="form-group">
                <label for="login_password">비밀번호</label>
                <input type="password" id="login_password"  name="pass" class="form-control" onfocus="labelUp(this)" onblur="labelDown(this)" onkeyup="onKeyUp()" required />
              </div>
              <div class="form-group mb-0">
                <button type="button" class="btn btn-primary register_btn w-100" onclick="login();">Login</button>
              </div>
            </form>

            <div class="already_member_box d-flex justify-content-between px-4">
            	<a href="${pageContext.request.contextPath }/work/poplogin"><span class="text-center" id="to_signup">팝업으로 이동 >></span></a>
            </div>
          </div>
          <!--accounts_forms-->
        </div>
        <!--account_col-->
      </div>
      <!--row-->
    </div>
    <!--accounts_container-->
  </section>
  <!--login_section-->

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <!--Custom Js-->
  <script type="text/javascript" src="/resources/js/login.js"></script>

</body>

</html>