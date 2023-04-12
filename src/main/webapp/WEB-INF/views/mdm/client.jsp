<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>client</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
<style type="text/css">
h1{
	margin : 20px 0px;
	font-size: 22.5px;
}
table{
      width: 100%;  
} 

.client_body {
	padding : 20px;
}

#th{
	border-bottom: 1px solid black;
/* 	padding: 10px; */
/* 	margin-bottom: 10px; */
}

#th th{
	border-top: 1px solid black;
    border-bottom: 1px solid black;
    padding: 5px;
    margin-bottom: 10px;
    font-weight: bold;
    vertical-align: middle;
    width : 8%; 	
}

button{
	display: inline-block;
    width: 70px;
    height: 28px;
    font-size: 15px;
    margin-left : 5px;
}
.client_filter{
	border : 1px solid black;
	width : 100%;
	margin-top : 5px;
	margin-bottom : 30px;
}

.client_filter td{ 
 	padding : 10px; 
} 

/* .client_filter tr, td{ */
/*  	border:0px; */
/* } */

#data {
	text-align : center;
	width:100%;
}
 
#data:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}

#data td{
    vertical-align: middle;
    width : 9%; 
    text-align:center;
    height : 15px; 
}

.ClientButtons{
	width: 100%; 
	text-align:right;
}

.searchclient{
	text-align:right;
	display :block;	
	padding : 3px;
}

.clientcount{
	text-align:right;
	margin-bottom: 8px;
}

</style>

<script type="text/javascript">

$(document).ready(function() {
	

	$('#clientcount').html("총 "+ ${clientcount} + "건");
	
	
	var scount = "${searchcount}";
	if(scount != "") {
		$('#clientcount').html("총 "+ ${searchcount} + "건");
	}
});

function modifyLine(obj){
	console.log('수정');

	var tr = $(obj);
	var clntId=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
	console.log(clntId);
	
	window.open("${pageContext.request.contextPath}/mdm/clientupdate?clntId="+clntId,"popup", "width=450, height=750, left=500, top=250");
}//수정
function insertLine(obj){
	console.log('추가');
	
	window.open("/mdm/clientinsert", "a", "width=450, height=750, left=500, top=250");
}//추가

function deleteLine(obj){

	var clntId=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
	if(confirm("삭제하시겠습니까?")){
	console.log(clntId); 
	location.href="${pageContext.request.contextPath}/mdm/clientdelete?clntId="+clntId+"&pageNum=${pageDTO.pageNum}";
	$(obj).closest('tr').remove();
	}else{
		return false;
	}
} //삭제
</script>

</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="client_body">
<h1> 거래처정보관리 </h1><br>
<form id="clientSearch">
<div class="searchclient"><button type="submit">조회</button><button type="button" onclick="insertLine();">추가</button></div>
<table class="client_filter">
	<tr>	
	<td>거래처코드</td> <td><input type="text" class="clntCode" name="clntCode"></td>
	<td>거래처명</td>  <td><input type="text" class="clntName" name="clntName"></td>
	<td>거래처구분</td> <td><select name="clntType">
						<option value="" selected>전체</option>
						<option value="자사">자사</option>
						<option value="고객사">고객사</option>
						<option value="협력사">협력사</option>
					</select></td>
	<td>사용여부</td> <td><select name="useYn">
						<option value="" selected>전체</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
						</select></td>
</table>
</form>
	
<div>
<h1> 거래처 목록</h1><br>
	
	<div class="clientcount"><span id="clientcount"></span></div>
	
	<form name="clientlist" id="clientlist" method="post">
	<table border="1" class="clientList">
		<thead>
		<tr id="th">
			<th>거래처코드</th>
			<th>거래처명</th>
			<th>거래처구분</th>
			<th>사업자번호</th>
			<th>업테</th>
			<th>종목</th>
			<th>대표자</th>
			<th>담당자</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>전화번호</th>
			<th>연락처</th>
			<th>팩스번호</th>
			<th>E-MAIL</th>
			<th>비고</th>
			<th>사용여부</th>
		</tr>
		<c:forEach var="clientDTO" items="${clientList}">
			<tr id="data">
				<td>${clientDTO.clntCode}</td>
				<td>${clientDTO.clntName}</td>
				<td>${clientDTO.clntType}</td>
				<td>${clientDTO.bsnsNum}</td>
				<td>${clientDTO.industry}</td>
				<td>${clientDTO.event}</td>
				<td>${clientDTO.daepyo}</td>
				<td>${clientDTO.manager}</td>
				<td>${clientDTO.address}</td>
				<td>${clientDTO.addrDtl}</td>
				<td>${clientDTO.tell}</td>
				<td>${clientDTO.phone}</td>
				<td>${clientDTO.fax}</td>
				<td>${clientDTO.email}</td>
				<td>${clientDTO.note}</td>
				<c:choose>
					<c:when test="${clientDTO.useYn eq 'Y'}">
						<td class="tduseyn" style="color: blue">${clientDTO.useYn}</td>
					</c:when>
					<c:otherwise>
						<td class="tduseyn" style="color: red">${clientDTO.useYn}</td>
					</c:otherwise>
				</c:choose>
				<td id="helpbutton" style="width:10px; text-align:center;vertical-align:middle;">
				<a href="#" class="modifyLine"><img src='${pageContext.request.contextPath}/resources/image/modify.png' id="modify" width='17px' onclick="modifyLine(this);"></a>
				<a href="#" ><img src='${pageContext.request.contextPath}/resources/image/del.png' width='17px' onclick="deleteLine(this);"></a>
				<input class="tdclntid" id="tdclntid" type="hidden" name="clntId"  value="${clientDTO.clntId}" readonly>
				<input class="tdclntistid" type="hidden" name="insertId"  value="${clientDTO.insertId}" readonly>
				<input class="tdclntistdt" type="hidden" name="insertDate"  value="${clientDTO.insertDate}" readonly>
				<input class="tdclntudtid" type="hidden" name="updateId"  value="${clientDTO.updateId}" readonly>
				<input class="tdclntudtdt" type="hidden" name="updateDate"  value="${clientDTO.updateDate}" readonly>
				</td>
			</tr>
		</c:forEach>
		</thead>
		<tbody id="tbody_id">
		</tbody>
	</table>
	</form>
</div>
</div>

<div class="center">
 	<div class="pagination">			
		<c:choose>
			<c:when test="${pageDTO.startPage > pageDTO.pageBlock}">
				<a href="/mdm/client?clntCode=${clientSearch.clntCode}&clntName=${clientSearch.clntName}&clntType=${clientSearch.clntType}&useYn=${clientSearch.useYn}&pageNum=${pageDTO.startPage - pageDTO.pageBlock}">◀</a>
			</c:when>
			<c:otherwise>
				<a class="none">◀</a>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
			<a href="/mdm/client?clntCode=${clientSearch.clntCode}&clntName=${clientSearch.clntName}&clntType=${clientSearch.clntType}&useYn=${clientSearch.useYn}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
		</c:forEach>
		
		<c:choose>
			<c:when test="${pageDTO.endPage < pageDTO.pageCount}">
				<a href="/mdm/client?clntCode=${clientSearch.clntCode}&clntName=${clientSearch.clntName}&clntType=${clientSearch.clntType}&useYn=${clientSearch.useYn}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">▶</a>
			</c:when>
			<c:otherwise>
				<a class="none">▶</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

<script>
   
</script>
</html>