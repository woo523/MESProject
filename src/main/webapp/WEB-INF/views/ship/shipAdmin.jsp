<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출하관리</title>
	
	<link href="/resources/css/instruct/ship.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<script type="text/javascript">
  $(function() {
    $( ".datepicker" ).datepicker();
  });
  $(function() {
	    $( ".datepicker1" ).datepicker1();
	  });
function openilist1(){
    window.open("${pageContext.request.contextPath }/order/itemList","popup", "width=600, height=600,left=100, top=100");
}
function openilist2(){
    window.open("${pageContext.request.contextPath }/order/userList","popup", "width=600, height=600,left=100, top=100");
}
function openilist3(){
    window.open("${pageContext.request.contextPath }/order/clientList","popup", "width=600, height=600,left=100, top=100");
}
</script>

<div class="content_body">
<article>
	<h2>출하관리</h2>
	<form id="shipsearch">
		<div class="selectButtons">
			<button type="submit">조회</button>
			<button type="button">취소</button>
			<button type="button">삭제</button>
			<button type="submit">저장</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>출하번호</td>
				<td><input type="text" id="shipNum" onclick="openilist1()"></td>
				<td>출하일자</td>
				<td><input type= "text" class="datepicker" name = "date" id="shipDt"/></td>
				<td>등록자</td>
				<td><input type="text" id="name" onclick="openilist2()"></td>
				<td>등록일</td>
				<td><input type= "text" class="datepicker" name = "date" id="insertDt"/></td>
				
			</tr>
		</table>
	
		
		
		<table class="searchBox">
			<tr>
				<td>품번</td>
				<td><input type="text" id="itemNum" onclick="openilist1()"></td>
				<td>품명</td>
				<td><input type="text" id="itemName" onclick="openilist1()"/></td>
				<td>단위</td>
				<td><input type="text" id="itemUnit" onclick="openilist1()"></td>
				<td>바코드</td>
				<td><input type="text" id="barcord" onclick="openilist1()"></td>
			</tr>
		</table>
		
		
		
		<table class="searchBox">
			<tr>
				<td>수주번호</td>
				<td><input type="text" id="ordNum" onclick="openilist3()"></td>
				<td>수주량</td>
				<td><input type="text" id="ordQty" onclick="openilist1()"></td>
				<td>출하량</td>
				<td><input type="text" id="shipQty" onclick="openilist1()"></td>
			</tr>
		</table>
		
		
	
		<h2>목록</h2>
		
		<div class="listButtons">
			<button type="button">취소</button>
			<button type="button">삭제</button>
			<button type="button">저장</button>
		</div>
		
		<table border="1" class="shipList">
			<tr>
				<th>출하번호</th>
				<th>출하일자</th>
				<th>등록자</th>
				<th>등록일</th>
				<th>변경자</th>
				<th>변경일</th>
				<th>품번</th>
				<th>품명</th>
				<th>단위</th>
				<th>바코드</th>
				<th>수주번호</th>
				<th>수주량</th>
				<th>출하량</th>
			</tr>
			
			<c:forEach var="orderDTO" items="${orderList}">
						<tr>
							<td>${shipDTO.shipNum}</td>
							<td>${shipDTO.shipDt}</td>
							<td>${shipDTO.insertId}</td>
							<td>${shipDTO.insertDt}</td>
							<td>${shipDTO.updateId}</td>
							<td>${shipDTO.updateDt}</td>
							<td>${shipDTO.itemNum}</td>
							<td>${shipDTO.itemName}</td>
							<td>${shipDTO.itemUnit}</td>
							<td>${shipDTO.barcord}</td>
							<td>${shipDTO.ordNum}</td>
							<td>${shipDTO.ordQty}</td>
							<td>${shipDTO.shipQty}</td>
						</tr>
			</c:forEach>
		</table>
	</form>
</article>
	
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

</html>