<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출하현황</title>
	
	<link href="/resources/css/instruct/ship.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" /><!-- 지우면안됨 -->

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
	
	function rowAdd(){
		var trCnt = $('#shAdmin tr').length;
		if(trCnt < 100) {
			var innerHtml ="";
			innerHtml += '<tr style="font-size:15px; font-weight:bold;">';
			innerHtml += '		<td class="text-center">'+trCnt+'</td>';
			innerHtml += '		<td class="text-center">'출하번호'</td>';
			innerHtml += '		<td class="text-center">'출하일자'</td>';
			innerHtml += '		<td class="text-center">'등록자'</td>';
			innerHtml += '		<td class="text-center">'등록일'</td>';
			innerHtml += '		<td class="text-center">'변경자'</td>';
			innerHtml += '		<td class="text-center">'변경일'</td>';
			innerHtml += '		<td class="text-center">'품번'</td>';
			innerHtml += '		<td class="text-center">'품명'</td>';
			innerHtml += '		<td class="text-center">'단위'</td>';
			innerHtml += '		<td class="text-center">'바코드'</td>';
			innerHtml += '		<td class="text-center">'수주번호'</td>';
			innerHtml += '		<td class="text-center">'수주량'</td>';
			innerHtml += '		<td class="text-center">'출하량'</td>';
			innerHtml += '</tr>';
			
			$('#shAdmin > tbody:last').append(innerHtml);
		}else{
			alert("최대 100개까지만 가능합니다.");
			return false;
		}
	}

	function rowDel(){
		var trCnt = $('#shAdmin tr').length;
		if(trCnt>2){
			$('#myTable > tbody:last > tr:last').remove();
		}else {
			return false;
		}
	}

</script>
<!-- 스크립트 끝. -->


<div class="content_body"> <!-- 지우면안됨 -->
<article>
	<!-- 내용시작 -->
	
	<h2>test</h2>
		<table class="searchBox">
			<tr>
				<td>출하</td>
				<td><input type="text" name="shipCode"></td>
				<td>출하일자</td>
				<td><input type="text" name="shipName"></td>
				<td>사용여부</td>
				<td><select name="useChoice">
						<option value="" selected>전체</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select></td>
			</tr>
		</table>
	
	
	
	
	
	
	
	<h2>출하현황</h2>
	
	<form id="shAdmin">
		<div class="selectButtons">
			<button type="submit" id="submit">조회</button>
			<button type="button" class="btn btn-default" onclick="rowAdd()">추가</button>
			<button type="button" class="btn btn-default" onclick="rowMod()">수정</button>
			<button type="button" class="btn btn-default" onclick="rowDel()">삭제</button>
			<button type="button" class="btn btn-default" onclick="rowPrt()">출력</button>
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
		<c:forEach var="shipDTO" items="${shipList}">
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
<!-- 내용끝 -->
</article>
</div><!-- 지우면안됨 -->



<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" /><!-- 지우면안됨 -->

</body>

</html>

