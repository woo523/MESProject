<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->

<style type="text/css">
table {
    width: 1019px;
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

#btn{
	text-align:right;
}

h1{
	font-weight: bold;
}

.search_bar tr, td{
 border:0px;
}

table#search {
 border:1px solid;
}



</style>

</head>
<body>






<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

function openilist(){
    window.open("${pageContext.request.contextPath }/material/itemList","popup", "width=500, height=500,left=100, top=100");
}

function openilist2(){
    window.open("${pageContext.request.contextPath }/material/clntList","popup", "width=500, height=500,left=100, top=100");
}


</script>
<!-- 스크립트 끝. -->




<div class="content_body"> <!-- 지우면안됨 -->
	<!-- 내용시작 -->
	
		<h1>자재 출고 관리</h1>
	<div class="search_bar">
	<form action="">
	
	<table id="btn">
		<tr><td><button>조회</button></td></tr>
	</table>
	
	<table id="search">
		<tr><td>출고일자</td>
			<td><input type="date" name="sdate"></td>
			<td><input type="date" name="edate"></td>
			<td>출고창고</td>
			<td><select name="outstock">
				<option value="1" selected>전체</option>
				<option value="2">창고 1</option>
				<option value="3">창고 2</option>
				<option value="4">창고 3</option>
		</select></td></tr>
		<tr><td>품번</td>
			<td><input type="text" name="pcd" placeholder="품번코드" onclick="openilist()"></td>
			<td><input type="text" name="pnm" placeholder="품번명" readonly></td>
			<td>업체</td>
			<td><input type="text" name="ccd" placeholder="업체코드" onclick="openilist2()"></td>
			<td><input type="text" name="cnm" placeholder="업체명" readonly></td>
		</tr>
		</table>
	</form>
</div>

	<br><br><br>
	<h1>자재 출고 목록</h1>
	<br>
	<table border="1" id="main">	
	<tr id="th">
		<th>출고번호</th><th>출고일자</th><th>품번</th><th>품명</th><th>단위</th>
		<th>출고창고</th><th>현재고</th><th>출고수량</th><th>업체코드</th>
		<th>업체명</th><th>비고</th>
		
		<c:forEach var="outte" items="${outmaterList }">
	<tr id="con" onclick="outmaterList(${outte.outmaterId })">
			<td>${outte.outmtrlNum}</td>
			<td>${outte.outmtrlDt}</td>
		  	<td>${outte.itemNum}</td>
		  	<td>${outte.itemName}</td>
		  	<td>${outte.itemUnit}</td>
		  	<td>${outte.stockwhouse}</td>
		  	<td>${outte.stockcur}</td>
		  	<td>${outte.outmtrlQty}</td>
		  	<td>${outte.clientCode}</td>
		  	<td>${outte.clientName}</td>
		  	<td>${outte.note}</td>
		</c:forEach>
	</tr>
</table>
	

	<br><br><br>

	<table id="btn">
		<tr><td><button id="add" onclick="addNewRow()">추가</button>
				<button>수정</button>
				<button>삭제</button>
				<button>취소</button></tr>
	</table>




</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->

