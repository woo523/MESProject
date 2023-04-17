<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>storage</title>
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
<style type="text/css">
h1{
	margin : 20px 0px;
	font-size: 22.5px;
}
table{
    width: 100%;  
} 

.storage_body{
	padding : 40px;
	margin : 40px;
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
    margin-left: 5px;
}
.storage_filter{
	border : 1px solid black;
	width : 100%;
	margin-top : 5px;
	margin-bottom : 30px;
}

.storage_filter td{
/*  	border:0px; */
 	padding : 10px;
}

#data{
	text-align : center;
	width:100%;
}
 
#data:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}

#data td{
    vertical-align: middle;
    width : 20%; 
    text-align:center;
    height : 15px; 
}

.StorageButtons{
	width: 100%; 
	text-align:right;
}

.search{
	text-align:right;
	display :block;	
	padding : 3px;
}

.storagecount{
	text-align:right;
	margin-bottom: 8px;
}

.storage_content{
	margin-top: 100px;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	
	$('#storagecount').html("총 "+ ${storagecount} + "건");
	
	
	var scount = "${searchcount}";
	if(scount != "") {
		$('#storagecount').html("총 "+ ${searchcount} + "건");
	}
});
function modifyLine(obj){
	console.log('수정');

	var tr = $(obj);
	var storId=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
	console.log(storId);
	
	window.open("${pageContext.request.contextPath}/mdm/storageupdate?storId="+storId,"popup", "width=400, height=400, left=500, top=250");
}//수정
function insertLine(obj){
	console.log('추가');
	
	window.open("/mdm/storageinsert", "a", "width=400, height=400, left=500, top=250");
}//추가

function deleteLine(obj){

	var storId=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
	if(confirm("삭제하시겠습니까?")){
	console.log(storId); 
	location.href="${pageContext.request.contextPath}/mdm/storagedelete?storId="+storId+"&pageNum=${pageDTO.pageNum}";
	$(obj).closest('tr').remove();
	alert("삭제되었습니다.");
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

<div class="storage_body">
<h1>창고정보 관리</h1><br>
<form id="storageSearch">
<div class="search"><button type="submit">조회</button><button type="button" onclick="insertLine();">등록</button></div>	
<table class="storage_filter">
	<tr>
	<td>창고명</td> <td><input type="text" class="storName" name="storName"></td>
	<td>창고코드</td> <td><input type="text" class="storCode" name="storCode"></td>
	<td>창고유형</td> <td><select name="storType">
				<option value="" selected>전체</option>
				<option value="자재">자재</option>
				<option value="제품">제품</option>
				<option value="불량">불량</option>
			</select></td>
	
	<td>사용여부</td> <td><select name="useYn">
						<option value="" selected>전체</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
						</select></td>		
</table>
</form>

	
<div class="storage_content">
<h1> 창고 목록 </h1><br>
	
	<div class="storagecount"><span id="storagecount"></span></div>
	<form name="storagelist" id="storagelist" method="post">
	<table border="1" class="storageList">
		<thead>
		<tr id="th">
			<th>창고코드</th>
			<th>창고명</th>
			<th>창고유형</th>
			<th>사용여부</th>
			<th>수량</th>
		</tr>
		<c:forEach var="storageDTO" items="${storageList}">
			<tr id="data">
				<td>${storageDTO.storCode}</td>
				<td>${storageDTO.storName}</td>
				<td>${storageDTO.storType}</td>
				<c:choose>
					<c:when test="${storageDTO.useYn eq 'Y'}">
						<td class="tduseyn" style="color: blue">${storageDTO.useYn}</td>
					</c:when>
					<c:otherwise>
						<td class="tduseyn" style="color: red">${storageDTO.useYn}</td>
					</c:otherwise>
				</c:choose>
				<td>${storageDTO.itemCount}</td>
				<td id="helpbutton" style="width:10px; text-align:center;vertical-align:middle;">
				<a href="#" class="modifyLine"><img src='${pageContext.request.contextPath}/resources/image/modify.png' id="modify" width='17px' onclick="modifyLine(this);"></a>
				<a href="#" ><img src='${pageContext.request.contextPath}/resources/image/del.png' width='17px' onclick="deleteLine(this);"></a>
				<input class="tdstorageid" id="tdstorageid" type="hidden" name="storId"  value="${storageDTO.storId}" readonly>
				<input class="tdstorageistid" type="hidden" name="insertId"  value="${storageDTO.insertId}" readonly>
				<input class="tdstorageistdt" type="hidden" name="insertDate"  value="${storageDTO.insertDate}" readonly>
				<input class="tdstorageudtid" type="hidden" name="updateId"  value="${storageDTO.updateId}" readonly>
				<input class="tdstorageudtdt" type="hidden" name="updateDate"  value="${storageDTO.updateDate}" readonly>
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
				<a href="/mdm/storage?storCode=${storageSearch.storCode}&storName=${storageSearch.storName}&storType=${storageSearch.storType}&useYn=${storageSearch.useYn}&pageNum=${pageDTO.startPage - pageDTO.pageBlock}">◀</a>
			</c:when>
			<c:otherwise>
				<a class="none">◀</a>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
			<a href="/mdm/storage?storCode=${storageSearch.storCode}&storName=${storageSearch.storName}&storType=${storageSearch.storType}&useYn=${storageSearch.useYn}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
		</c:forEach>
		
		<c:choose>
			<c:when test="${pageDTO.endPage < pageDTO.pageCount}">
				<a href="/mdm/storage?storCode=${storageSearch.storCode}&storName=${storageSearch.storName}&storType=${storageSearch.storType}&useYn=${storageSearch.useYn}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">▶</a>
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