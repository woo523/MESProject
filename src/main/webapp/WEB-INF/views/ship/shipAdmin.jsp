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
    window.open("${pageContext.request.contextPath }/order/itemList","popup", "width=500, height=500,left=100, top=100");
}
function openilist2(){
    window.open("${pageContext.request.contextPath }/order/userList","popup", "width=500, height=500,left=100, top=100");
}
function openilist3(){
    window.open("${pageContext.request.contextPath }/order/clntList","popup", "width=500, height=500,left=100, top=100");
}
function openilist4(){
    window.open("${pageContext.request.contextPath }/ship/shipInfo","popup", "width=500, height=500,left=100, top=100");
}
</script>

<div class="content_body">
<article>
	<h2>출하정보</h2>
	<div class="shipinfo">
	<form id="info">
		<div class="selectButtons">
			<button type="submit">조회</button>
			<button type="button">취소</button>
			<button type="submit">저장</button>
		</div>
		
			<table class="searchBox">
				<tr>
				<td>등록자</td>
				<td><input type="text" id="insertId" onclick="openilist2()"></td>
				<td>등록일</td>
				<td><input type="text" id="insertDt" onclick="openilist2()"></td>
				</tr>
				<tr>
				<td>출하번호</td>
				<td><input type="text" id="shipNum" onclick="openilist4()"></td>
				<td>출하일자</td>
				<td><input type= "text" class="datepicker" name = "date" id="shipDt" placeholder="날짜를 선택해주세요" readonly/></td>
				</tr>
			</table>
		</form>
	</div>	
		
	<h2>품목정보</h2>
		<div class="iteminfo">
		<form id="item">
		<div class="selectButtons">
			<button type="submit">조회</button>
			<button type="button">취소</button>
			<button type="submit">저장</button>
		</div>
		<table class="searchBox">
			<tr>
				<td>품번</td>
				<td><input type="text" id="itemNum" onclick="openilist1()"></td>
				<td>품명</td>
				<td><input type="text" id="itemName" onclick="openilist1()"/></td>
				<td>바코드</td>
				<td><input type="text" id="barcord" onclick="openilist1()"></td>
				</tr>
				<tr>
				<td>단위</td>
				<td><input type="text" id="itemUnit"></td>
				<td>수량</td>
				<td><input type="text" id="amount"></td>
			</tr>
		</table>
	</form>
	</div>	
		
		<h2>출하</h2>
		<div class="shipqty">
		<form id="qty">
		<div class="selectButtons">
			<button type="submit">조회</button>
			<button type="button">취소</button>
			<button type="submit">저장</button>
		</div>
		<table class="searchBox">
			<tr>
				<td>출하고객</td>
				<td><input type="text" id="clntId" onclick="openilist3()"></td>
			</tr>
		</table>
		</form>
	</div>		
		
		
		<h2>목록</h2>
		<form id="list">
		<div class="listButtons">
			<button type="button">삭제</button>
		</div>
		
		<table border="1" class="shipList">
			<tr>
				<th>등록자</th>
				<th>등록일</th>
				<th>출하번호</th>
				<th>출하일자</th>
				<th>품번</th>
				<th>품명</th>
				<th>바코드</th>
				<th>단위</th>
				<th>수량</th>
				<th>출하고객</th>
			</tr>
			
			<c:forEach var="shipDTO" items="${shipList}">
						<tr>
							<td>${shipDTO.insertId}</td>
							<td>${shipDTO.insertDt}</td>
							<td>${shipDTO.shipNum}</td>
							<td>${shipDTO.shipDt}</td>
							<td>${shipDTO.itemNum}</td>
							<td>${shipDTO.itemName}</td>
							<td>${shipDTO.barcord}</td>
							<td>${shipDTO.itemUnit}</td>
							<td>${shipDTO.amount}</td>
							<td>${orderDTO.clntId}</td>
						</tr>
			</c:forEach>
		</table>
	</form>
</article>
	
</div>

<!-- 1페이지 이전, 다음 페이징 -->













<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

</html>