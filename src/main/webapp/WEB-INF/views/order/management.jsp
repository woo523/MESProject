<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>order</title>
	
	<link href="/resources/css/instruct/order.css" rel="stylesheet" type="text/css">
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
	<h2>수주관리</h2>
	<form id="orderSearch">
		<div class="selectButtons">
			<button type="submit">조회</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>업체</td>
				<td><input type="text" id="clntCd" onclick="openilist3()"></td>
				<td>수주일자</td>
				<td><input type= "text" class="datepicker" name = "date" id="orderDt1"/></td>
				<td><input type= "text" class="datepicker" name = "date" id="orderDt2"/></td>
				<td>담당자</td>
				<td><input type="text" id="name" onclick="openilist2()"></td>
				<td>납품예정일</td>
				<td><input type= "text" class="datepicker" name = "date" id="dlvryDt1"/></td>
				<td><input type= "text" class="datepicker" name = "date" id="dlvryDt2"/></td>
			</tr>
		</table>

	<h2>수주품목상세</h2>
	<form id="orderSearch">
		<div class="selectButtons">
			<button type="button">취소</button>
			<button type="button">삭제</button>
			<button type="submit">저장</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>수주업체코드</td>
				<td><input type="text" id="clntCd" onclick="openilist3()"></td>
				<td>수주일자</td>
				<td><input type= "text" class="datepicker1" name = "date" id="orderDt"/></td>
				<td>담당자</td>
				<td><input type="text" id="name" onclick="openilist2()"></td>
				<td>납품예정일</td>
				<td><input type= "text" class="datepicker1" name = "date" id="dlvryDt"/></td>
				<td>고객수주번호</td>
				<td><input type="text" id="csmtrOrdNum"></td>
			</tr>
		</table>
	
	<h2>수주정보</h2>
	<form id="orderSearch">
		<div class="selectButtons">
			<button type="button">취소</button>
			<button type="button">삭제</button>
			<button type="submit">저장</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>품번</td>
				<td><input type="text" id="itemNum" onclick="openilist1()"></td>
				<td>품명</td>
				<td><input type="text" id="itemNum" onclick="openilist1()"></td>
				<td>단위</td>
				<td><input type="text" id="ea"></td>
				<td>수량</td>
				<td><input type="text" id="increase"></td>
			</tr>
		</table>
	
		<h2>목록</h2>
		
		<div class="listButtons">
			<button type="button">취소</button>
			<button type="button">삭제</button>
			<button type="button">저장</button>
		</div>
		
		<table border="1" class="orderList">
			<tr>
				<th>수주업체코드</th>
				<th>수주업체</th>
				<th>수주일자</th>
				<th>납품예정일</th>
				<th>담당자코드</th>
				<th>담당자</th>
				<th>고객수주번호</th>
			</tr>
			<c:choose>
				<c:when test="${empty orderList}">
					<tr><td colspan="6"></td></tr>
					<tr>
						<td colspan="6">해당 주문 정보가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="orderDTO" items="${orderList}">
						<tr>
							<td>${orderDTO.clntCd}</td>
							<td>${orderDTO.clntNm}</td>
							<td>${orderDTO.orderDt}</td>
							<td>${orderDTO.dlvryDt}</td>
							<td>${orderDTO.id}</td>
							<td>${orderDTO.name}</td>
							<td>${orderDTO.csmtrOrdNum}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
</article>
	
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

</html>