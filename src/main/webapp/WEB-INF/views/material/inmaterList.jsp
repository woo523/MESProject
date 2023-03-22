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
    window.open("material/itemList","popup", "width=500, height=500,left=100, top=100");
}
var a;

</script>
<!-- 스크립트 끝. -->




<div class="content_body"> <!-- 지우면안됨 -->
	<!-- 내용시작 -->
	
		<h1>자재 입고 관리</h1>
	<div class="search_bar">
	<form action="">
	
	<table id="btn">
	<tr><td><button>조회</button></td></tr></table>
	<table id="search">
	<tr><td>입고일자</td>
	<td><input type="date" name="sdate"></td>
	<td><input type="date" name="edate"></td>
	<td>입고창고</td>
		<td><select name="line">
		<option value="1"></option>
		<option value="2" selected></option>
		<option value="3"></option>
		</select></td></tr>
	<tr><td>품번</td>
	<td><input type="text" name="pcd" onclick="openilist()"></td>
	<td><input type="text" name="pnm" onclick="openilist()"></td>
	<td>업체</td>
	<td><input type="text" name="pcd" onclick="openilist()"></td>
	<td><input type="text" name="pnm" onclick="openilist()"></td>
	</tr>
	</table>
	</form>
	</div>

	<br><br><br>
	<h2>자재 입고 목록</h2>
	<br>
	<table border="1" id="main">	
	<tr id="th">
		<th>입고번호</th><th>입고일자</th><th>품번</th><th>품명</th><th>단위</th>
		<th>입고창고</th><th>현재고</th><th>입고수량</th><th>업체코드</th>
		<th>업체명</th><th>입고LOT</th><th>비고</th>
	</tr>
    </table>
	

	<br><br><br>

	<table id="btn">
		<tr><td><button id="add" onclick="addNewRow()">추가</button>
				<button>수정</button>
				<button>삭제</button>
				<button>취소</button>
				<button>저장</button></td></tr>
	</table>




</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->

