<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.content_body button {
	display: inline-block;
	width: 70px;
	height: 28px;
	font-size: 15px;
}

table {
    width: 1125px;
  }
  
th,td{
border-bottom: 1px solid black;
padding: 10px;
}

#th {
	font-weight: bold;
}

#con {
	text-align: center;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}

.search_bar tr, td{
 border:0px;
}

table#search {
 border:1px solid;
}

#btn{
	width: 1125px;
	text-align:right;
}

table#search {
 border:1px solid;
}

#pagination{
      width: 1125px;  
text-align: center;
}

#pcd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
}

#pnm {
	background-color: #EAEAEA;
	background-position:98%;
	border: 1px solid;
	
}

	
.content_body .searchBox {
	width: 100%;
	height: 20px;
	border: 1px solid black;
	margin: 10px 0px 40px 0px;
}
	
.searchBox td {
	padding: 10px;
}
	
.content_body td {
	padding: 10px;
	text-align: center;
}	

.content_body .inList th{
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 5px;
	margin-bottom: 10px;
	font-weight: bold;
	vertical-align: middle;
}

.content_body .inList td {
	padding: 10px;
	text-align: center;
}
</style>

</head>

<script type="text/javascript">

function openlist(){
    window.open("${pageContext.request.contextPath }/material/itemList","popup", "width=500, height=500,left=100, top=100");
}

function openadd(){
    window.open("${pageContext.request.contextPath }/material/addList","popup", "width=500, height=500,left=100, top=100");
}
</script>

<c:if test="${empty sessionScope.id }">
<c:redirect url="${pageContext.request.contextPath }/login/login"></c:redirect>
</c:if>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
<article>
	<h2>자재재고현황</h2>
		<div class="search_bar">
		<form id="search">
		<div id="btn">
			<button type="submit" id="submit">조회</button>
		</div>
		<br>
		<table id="search">
			<tr>
				<td>자재유형</td>
				<td><select name="mtrltype">
						<option value="" selected>전체</option>
						<option value="원자재">원자재</option>
						<option value="완제품">완제품</option>
						<option value="부자재">부자재</option>
					</select></td>
				<td>품번</td>
				<input type="hidden" id="pid">
					<td><input type="text" name="pcd" id="pcd" class="form-control" placeholder="품번코드" onclick="openlist()">
						<input type="text" name="pnm" id="pnm" class="form-control" placeholder="품번명" readonly></td>
			</tr>
	</table>
</form>
</div>
<br><br><br>	
	<h2>자재재고</h2>
	<br>	
	<h2>총 ${pageDTO.count } 건</h2>
	<br>
	<table border="1" class="inList">	
	<tr id="th">
		<th>품번</th>
		<th>품명</th>
		<th>자재유형</th>
		<th>단위</th>
		<th>창고</th>
		<th>현재고</th>
		<th>실사량</th>
	</tr>
	<c:choose>
		<c:when test="${empty materialState}">
			<tr><td colspan="14"></td></tr>
				<tr>
					<td colspan="14">해당 데이터가 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
	<c:forEach var="inte" items="${materialState}">
		<tr id="con" onclick="materialState(${inte.inmaterId})">
		  	<td>${inte.itemNum}</td>
		  	<td>${inte.itemName}</td>
		  	<td>${inte.mtrltype}</td>
		  	<td>${inte.itemUnit}</td>
		  	<td>${inte.stockwhouse}</td>
		  	<td>${inte.stockcur}</td>
		  	<td><img src='${pageContext.request.contextPath}/resources/image/add.png' width='17px' onclick='openadd()'></td>
		</tr>
		</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
</article>
</div>

	<div class="center">
	 	<div class="pagination">			
			<c:choose>
				<c:when test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a href="/material/materialState?mtrltype=${search.mtrltype}&pcd=${search.pcd}&pageNum=${pageDTO.startPage - pageDTO.pageBlock}">◀</a>
				</c:when>
				<c:otherwise>
					<a class="none">◀</a>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
				<a href="/material/materialState?mtrltype=${search.mtrltype}&pcd=${search.pcd}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageDTO.endPage < pageDTO.pageCount }">
					<a href="/material/materialState?mtrltype=${search.mtrltype}&pcd=${search.pcd }&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">▶</a>
				</c:when>
				<c:otherwise>
					<a class="none">▶</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div> <!-- 페이징 -->

</body>
</html>