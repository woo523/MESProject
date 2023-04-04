<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<style type="text/css">

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



h1{
	font-weight: bold;
}

.search_bar tr, td{
 border:0px;
}

table#search {
 border:1px solid;
}

table#detail {
 border:1px solid;
}
table#info {
 border:1px solid;
}


#btn{
      width: 1125px; 
	text-align: right;
 
}
#pagination{
      width: 1125px;  
text-align: center;
}

#num:hover{
	background-color : #e1e1e1;
}

.form-control{
	width:150px;
	background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#pcd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#pnm {
	background-color: #EAEAEA;
	border: 1px solid;
}



</style>
</head>


<body>

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">


</script>
<!-- 스크립트 끝. -->

<div class="content_body"> <!-- 지우면안됨 -->
<br>
<form>

	<h1>수주품목상세</h1>
	<div class="content">
		<div id="btn">
			<input type="button" value="수정" class="btn"
				onclick="location.href='${pageContext.request.contextPath}/order/update?ordId=${orderDTO.ordId }'">
			<input type="button" value="삭제" class="btn"
				onclick="location.href='${pageContext.request.contextPath}/order/delete?ordId=${orderDTO.ordId }'">
			</div>
				<br>

	<table id="content" border="1">
	<tr><td>${orderDTO.ordId }</td></tr>
	
	<tr><td>업체명</td>
	<td>${orderDTO.clntNm }</td></tr>
	<tr><td>수주일자</td>
	<td>${orderDTO.orderDt }</td></tr>
	<tr><td>담당자</td>
	<td>${orderDTO.userNm }</td></tr>
	<tr><td>납품예정일</td>
	<td>${orderDTO.dlvryDt }</td></tr>
	<tr><td>품번</td>
	<td>${orderDTO.itemNum }</td></tr>
	<tr><td>품명</td>
	<td>${orderDTO.itemNm }</td></tr>
	<tr><td>단위</td>
	<td>${orderDTO.invntUnit }</td></tr>
	<tr><td>수량</td>
	<td>${orderDTO.ordQty }</td></tr>
	</table>
	</div>
<br>

</form>
</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
