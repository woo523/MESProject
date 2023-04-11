<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%@ include file="../inc/header2.jsp"%><!-- 지우면안됨 -->
<style type="text/css">

@import
	url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css)
	;
	
	
body{
	font-family: 'NanumSquare', sans-serif;
}



/* 페이징 */


#pagination {
  display: inline-block;
}

#pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}



#pagination a.active {
	background-color: #b9b9b9;
  color: white;
  border: 1px solid #b9b9b9;
}

#pagination a:hover:not(.active,.none) {background-color: #ddd;}

.center {
  text-align: center;
}


table {
	margin : 0px auto;
	border: 1px #a39485 solid;
	font-size: 1em;
	width: 425px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	
}

th {
	text-align: center;
	background: #b9b9b9;
	font-weight: 700;
}


td, th {
	padding: 1em .5em;
	
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}
h1{
	padding-left: 40px;
	padding-top: 10px;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}
#btn{
	width: 500px; 
	text-align: right;
	margin: 0px auto;
}

</style>
</head>


<body>

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">


</script>
<!-- 스크립트 끝. -->

<div id="main"> <!-- 지우면안됨 -->
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
<%-- 	<tr><td>${orderDTO.ordId }</td></tr> --%>
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