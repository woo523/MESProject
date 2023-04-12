<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
<!-- Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon-16x16.png">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">

</head>

<body>
	<!-- <header> -->
	<jsp:include page="../inc/MainHeader.jsp" />
	<!-- </header> -->

	<div class="pcoded-content">
		<div class="pcoded-inner-content">
			<div class="main-body">
				<div class="page-wrapper">
					<div class="page-body">
						<div class="row">
							<!-- card1 start -->
							<c:if test="${not empty menu1 || not empty menu2 || not empty menu3}">
								<div class="col-md-6 col-xl-3">
									<div class="card widget-card-1">
										<c:choose>
											<c:when test="${not empty menu1}">
												<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/member/list'">
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${not empty menu2}">
														<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/auth/user'">
													</c:when>
													<c:otherwise>
														<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/comCode/list'">
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>

										<i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
										<h1 class="text-c-blue f-w-600 m-t-10">시스템 관리</h1>
										<div>
											<span class="f-left m-t-10 text-muted"> 
											<i class="text-c-blue f-20 icofont icofont-tag m-r-10"></i>사용자 관리 권한 관리 공통 코드 관리</span>
										</div>
									</div>
								</div>
						</div>
						</c:if>
						<!-- card1 end -->
						<!-- card1 start -->
						<c:if test="${not empty menu4 || not empty menu5 || not empty menu6 || not empty menu7 || not empty menu8}">
							<div class="col-md-6 col-xl-3">
								<div class="card widget-card-1">
									<c:choose>
										<c:when test="${not empty menu4}">
											<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/mdm/item'">
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${not empty menu5}">
													<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/mdm/client'">
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${not empty menu6}">
															<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/line/line'">
														</c:when>
														<c:otherwise>
															<c:choose>
																<c:when test="${not empty menu7}">
																	<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/mdm/equip'">
																</c:when>
																<c:otherwise>
																	<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/mdm/storage'">
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>



									<i class="icofont icofont-ui-home bg-c-pink card1-icon"></i>
									<h1 class="text-c-pink f-w-600 m-t-10">기준정보 관리</h1>
									<div>
										<span class="f-left m-t-10 text-muted"> 
										<i class="text-c-pink f-20 icofont icofont-tag m-r-10"></i>품목정보 관리 거래처정보 관리</span> 
										<span class="f-left m-t-10 text-muted"> 
										<i class="text-c-pink f-20 icofont icofont-tag m-r-10"></i>라인정보 관리 설비정보 관리 창고정보 관리</span>
									</div>
								</div>
							</div>
					</div>
					</c:if>
					<!-- card1 end -->
					<!-- card1 start -->
					<c:if test="${not empty menu9 || not empty menu10 || not empty menu11 || not empty menu12}">
						<div class="col-md-6 col-xl-3">
							<div class="card widget-card-1">
								<c:choose>
									<c:when test="${not empty menu9}">
										<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/order/orderMng'">
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${not empty menu10}">
												<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/order/orderSts'">
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${not empty menu11}">
														<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/ship/shipAdmin'">
													</c:when>
													<c:otherwise>
														<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/ship/shipList'">
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<i class="icofont bg-c-green card1-icon"><img src='${pageContext.request.contextPath}/resources/image/cargo-ship-40.png'></i>
								<h1 class="text-c-green f-w-600 m-t-10">영업 관리</h1>
								<div>
									<span class="f-left m-t-10 text-muted"> 
									<i class="text-c-green f-20 icofont icofont-tag m-r-10"></i>수주관리 수주현황 출하관리 출하현황</span>
								</div>
							</div>
						</div>
				</div>
				</c:if>
				<!-- card1 end -->
				<!-- card1 start -->
				<c:if test="${not empty menu13 || not empty menu14 || not empty menu15 || not empty menu16}">
					<div class="col-md-6 col-xl-3">
						<div class="card widget-card-1">
							<c:choose>
								<c:when test="${not empty menu13}">
									<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/work/instructList'">
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${not empty menu14}">
											<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/work/instructState'">
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${not empty menu15}">
													<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/work/performRegist'">
												</c:when>
												<c:otherwise>
													<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/work/performList'">
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<i class="icofont bg-c-yellow card1-icon">🛠</i>
							<h1 class="text-c-yellow f-w-600 m-t-10">생산 관리</h1>
							<div>
								<span class="f-left m-t-10 text-muted"> 
								<i class="text-c-yellow f-20 icofont icofont-tag m-r-10"></i>작업지시 정보관리 작업지시 현황</span> 
								<span class="f-left m-t-10 text-muted"> 
								<i class="text-c-yellow f-20 icofont icofont-tag m-r-10"></i>실적등록 생산실적 현황</span>
							</div>
						</div>
					</div>
			</div>
			</c:if>
			<!-- card1 end -->
			<!-- card1 start -->
			<c:if test="${not empty menu17 || not empty menu18 || not empty menu19}">
				<div class="col-md-6 col-xl-3">
					<div class="card widget-card-1">
						<c:choose>
							<c:when test="${not empty menu17}">
								<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/material/inmaterList'">
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty menu18}">
										<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/material/outmaterList'">
									</c:when>
									<c:otherwise>
										<div class="card-block-small" onclick="location.href='${pageContext.request.contextPath}/material/materialState'">
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<i class="icofont bg-c-purple card1-icon">⛓</i>
						<h1 class="text-c-purple f-w-600 m-t-10">자재 관리</h1>
						<div>
							<span class="f-left m-t-10 text-muted"> 
							<i class="text-c-purple f-20 icofont icofont-tag m-r-10"></i>자재입고 관리 자재출고 관리 자재재고 현황</span>
						</div>
					</div>
				</div>
		</div>
		</c:if>
		<!-- card1 end -->
	</div>
	</div>
	</div>

	<div id="styleSelector"></div>
	</div>
	</div>
	</div>


	<!-- Warning Section Starts -->
	<!-- Older IE warning message -->
	<!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
	<!-- Warning Section Ends -->

</body>

</html>
