<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>equip</title>
	
	<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon-16x16.png">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/resources/js/addressapi.js"></script>
	
<style type="text/css">
h1{
	margin : 20px 0px;
	font-size: 22.5px;
}
table{
      width: 100%;  
} 

.equip_body{
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
.equip_filter{
	border : 1px solid black;
	width : 100%;
	margin-top : 5px;
	margin-bottom : 30px;
}

.equip_filter td{
/*  	border:0px; */
 	padding : 10px;
}

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
    width : 13%; 
    text-align:center;
    height : 15px; 
}

.EquipButtons{
	width: 100%; 
	text-align:right;
}

.search{
	text-align:right;
	display :block;	
	padding : 3px;
}

.equipcount{
	text-align:right;
	margin-bottom: 8px;
}


</style>

<script type="text/javascript">

$(document).ready(function(){
	
	$('#equipcount').html("총 "+ ${equipcount} + "건");
	
	
	var scount = "${searchcount}";
	if(scount != "") {
		$('#equipcount').html("총 "+ ${searchcount} + "건");
	}
});

function modifyLine(obj){
	console.log('수정');

	var tr = $(obj);
	var equpId=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
	console.log(equpId);
	
	window.open("${pageContext.request.contextPath}/mdm/equipupdate?equpId="+equpId,"popup", "width=450, height=500, left=500, top=250");
}//수정
function insertLine(obj){
	console.log('추가');
	
	window.open("/mdm/equipinsert", "a", "width=450, height=500, left=500, top=250");
}//추가

function deleteLine(obj){

	var equpId=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
	if(confirm("삭제하시겠습니까?")){
	console.log(equpId); 
	location.href="${pageContext.request.contextPath}/mdm/equipdelete?equpId="+equpId+"&pageNum=${pageDTO.pageNum}";
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

<div class="equip_body">
<h1> 설비정보 관리 </h1><br>
<form id="equipSearch">
<div class="search"><button type="submit">조회</button><button type="button" onclick="insertLine();">등록</button></div>	

<table class="equip_filter">
	<tr>	
	<td>설비명</td>  <td><input type="text" class="equpName" name="equpName"></td>
	<td>설비코드</td> <td><input type="text" class="equpCode" name="equpCode"></td>
	<td>설비유형</td> <td><select name="equpType">
				<option value="" selected>전체</option>
				<option value="조립">조립</option>
				<option value="멸균">멸균</option>
				<option value="포장">포장</option>
			</select></td>
	<td>설비상태</td> <td><select name="equpStat">
				<option value="" selected>전체</option>
				<option value="가동">가동</option>
				<option value="대기">대기</option>
				<option value="고장">고장</option>
			</select></td>
	<td>사용여부</td>  <td><select name="useYn">
				<option value="" selected>전체</option>
				<option value="Y">Y</option>
				<option value="N">N</option>
			</select></td>
</table>
</form>
	
<div>
<h1> 설비 목록 </h1><br>
	
	<div class="equipcount"><span id="equipcount"></span></div>
	<form name="equiplist" id="equiplist" method="post">
	<table border="1" class="equipList">
		<thead>
		<tr id="th">
			<th>설비코드</th>
			<th>설비명</th>
			<th>설비유형</th>
			<th>구매처</th>
			<th>구매일자</th>
			<th>구매금액</th>
			<th>사용여부</th>
			<th>설비상태</th>
			<th></th>
		</tr>
		<c:forEach var="equipDTO" items="${equipList}">
			<tr id="data">
				<td>${equipDTO.equpCode}</td>
				<td>${equipDTO.equpName}</td>
				<td>${equipDTO.equpType}</td>
				<td>${equipDTO.poNum}</td>
				<td>${equipDTO.poDate}</td>
				<td>${equipDTO.poAmount}</td>
				<c:choose>
					<c:when test="${equipDTO.useYn eq 'Y'}">
						<td class="tduseyn" style="color: blue">${equipDTO.useYn}</td>
					</c:when>
					<c:otherwise>
						<td class="tduseyn" style="color: red">${equipDTO.useYn}</td>
					</c:otherwise>
				</c:choose>
				<td>${equipDTO.equpStat}</td>
				<td id="helpbutton" style="width:10px; text-align:center;vertical-align:middle;">
				<a href="#" class="modifyLine"><img src='${pageContext.request.contextPath}/resources/image/modify.png' id="modify" width='17px' onclick="modifyLine(this);"></a>
				<a href="#" ><img src='${pageContext.request.contextPath}/resources/image/del.png' width='17px' onclick="deleteLine(this);"></a>
				<input class="tdequpid" id="tdequpid" type="hidden" name="equpId"  value="${equipDTO.equpId}" readonly>
				<input class="tdequpistid" type="hidden" name="insertId"  value="${equipDTO.insertId}" readonly>
				<input class="tdequpistdt" type="hidden" name="insertDate"  value="${equipDTO.insertDate}" readonly>
				<input class="tdequpudtid" type="hidden" name="updateId"  value="${equipDTO.updateId}" readonly>
				<input class="tdequpudtdt" type="hidden" name="updateDate"  value="${equipDTO.updateDate}" readonly>
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
				<a href="/mdm/equip?equpCode=${equipSearch.equpCode}&equpName=${equipSearch.equpName}&equpType=${equipSearch.equpType}&equpStat=${equipSearch.equpStat}&useYn=${equipSearch.useYn}&pageNum=${pageDTO.startPage - pageDTO.pageBlock}">◀</a>
			</c:when>
			<c:otherwise>
				<a class="none">◀</a>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
			<a href="/mdm/equip?equpCode=${equipSearch.equpCode}&equpName=${equipSearch.equpName}&equpType=${equipSearch.equpType}&equpStat=${equipSearch.equpStat}&useYn=${equipSearch.useYn}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
		</c:forEach>
		
		<c:choose>
			<c:when test="${pageDTO.endPage < pageDTO.pageCount}">
				<a href="/mdm/equip?equpCode=${equipSearch.equpCode}&equpName=${equipSearch.equpName}&equpType=${equipSearch.equpType}&equpStat=${equipSearch.equpStat}&useYn=${equipSearch.useYn}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">▶</a>
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