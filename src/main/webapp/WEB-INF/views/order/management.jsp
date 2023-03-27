<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%-- <%@ include file="../inc/header.jsp"%><!-- 지우면안됨 --> --%>


</head>
<body>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
 .datepicker{
    }
</style>
   
<script type="text/javascript">
  $(function() {
    $( ".datepicker" ).datepicker();
  });
function openilist1(){
    window.open("${pageContext.request.contextPath }/order/itemList","popup", "width=500, height=500,left=100, top=100");
}
function openilist2(){
    window.open("${pageContext.request.contextPath }/order/userList","popup", "width=500, height=500,left=100, top=100");
}
function openilist3(){
    window.open("${pageContext.request.contextPath }/order/clientList","popup", "width=500, height=500,left=100, top=100");
}
</script>

<div class="content_body">
<div class="search_bar">
<form action="" method="get">
	<fieldset>
		<legend><label>수주관리</label></legend>
		<label>업체</label>
		<input type="text" id="clnt_cd" onclick="openilist3()">
		<label>수주일자</label>
		<input type= "text" class="datepicker" name = "date" id="order_dt"/>
		<label>담당자</label>
		<input type="text" id="name" onclick="openilist2()">
		<label>납품예정일</label>
		<input type= "text" class="datepicker" name = "date" id="dlvry_dt"/>
		<input type="submit" value="조회" class="check">
	</fieldset>
</form>
</div>
<br>

<form action="" method="get">
	<fieldset>
		<legend>수주품목상세</legend>
		<label>수주업체코드</label>
		<input type="text" id="clnt_cd" onclick="openilist3()">
		<label>수주일자</label>
		<input type= "text" class="datepicker" name = "date" id="order_dt"/>
		<label>담당자</label>
		<input type="text" id="name" onclick="openilist2()">
		<label>납품예정일</label>
		<input type= "text" class="datepicker" name = "date" id="dlvry_dt"/>
		<label>고객수주번호</label>
		<input type="text" id="csmtr_ord_num">
		<input type="reset" value="취소" class="reset">
		<input type="button" value="삭제" class="cancel">
		<input type="submit" value="저장" class="btn">
	</fieldset>
</form>
<br>
<form action="" method="get">
	<fieldset>
		<legend>수주정보</legend>
		<label>품번</label>
		<input type="text" id="item_num" onclick="openilist1()">
		<label>품명</label>
		<input type="text" id="item_nm" onclick="openilist1()">
		<label>단위</label>
		<input type="text" id="ea">
		<label>수량</label>
		<input type="text" id="increase">
		<input type="reset" value="취소" class="reset">
		<input type="button" value="삭제" class="cancel">
		<input type="submit" value="저장" class="btn">
	</fieldset>
</form>
<br>
<table border="1">
	<tr>
	<td>수주업체코드</td>
	<td>수주업체</td>
	<td>수주일자</td>
	<td>납품예정일</td>
	<td>담당자코드</td>
	<td>담당자</td>
	<td>고객수주번호</td>
	</tr>
	
	<c:forEach var="odto" items="${checkList }">
	<tr>
		<td>${odto.clntCd }</td>
		<td>${odto.clntNm }</td>
	  	<td>${odto.orderDt}</td>
	  	<td>${odto.dlvryDt}</td>
	  	<td>${odto.id}</td>
	 	<td>${odto.name}</td>
	  	<td>${odto.csmtrOrdNum}</td>
	 </tr>
	</c:forEach>

	</table>
	</div>
</body>
</html>
<!-- 푸터 -->
<%-- <%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 --> --%>
