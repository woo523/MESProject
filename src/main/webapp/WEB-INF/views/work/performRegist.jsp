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
        window.open("${pageContext.request.contextPath }/work/itemList","popup", "width=500, height=500,left=100, top=100");
    }

function getPerformList(a){ // 해당 작업지시번호에 맞는 생산실적 ajax로 불러오기
	console.log("getPerformList 호출");
	var instrId = a;
// 	alert(instrId);

	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath }/work/Pflist",
		data : {"instrId" : instrId},
		dataType : "json",
		async : false, 
		/* 동기는 응답을 받을 때까지 기다렸다가 다음 작업을 하는 것 */
		/* 비동기는 요청에 대한 응답이 끝나기 전에 다음 작업을 먼저 함 */
		/* asyns는 기본 값이 true, false이면 응답이 끝나면 다음 작업을 수행하라는 의미 */
		success : function(array){
// 			alert("성공");
// 			alert("array.length"+ array.length);
			PerformListPrint(array);
		} //function(array) 
		
	}); // ajax
} 

function PerformListPrint(array){ // 해당 생산실적 출력

	var output ="<tr id='th' ><th>품번</th><th>품명</th><th>실적일</th><th>양불여부</th><th>실적수량</th><th>불량사유</th></tr>";

	if(array.length==0){
		output=output+"<tr id='con'><td colspan='6'> 해당 자료가 없습니다 </td> </tr>";
	}else{
	for (var i=0; i<array.length; i++) {
	
		output=output+"<tr id='con'>";
		output=output+"<td>"+array[i].itemNum+"</td>";
		output=output+"<td>"+array[i].itemName+"</td>";
		output=output+"<td>"+array[i].performDate+"</td>";
		output=output+"<td>"+array[i].gbYn+"</td>";	
		output=output+"<td>"+array[i].performQty+"</td>";	
		output=output+"<td>"+array[i].dbReason+"</td>";
		output=output+"</tr>";	
		}	
	}
	$("#PerformList_ajax").html(output); // innerHtml과 같은 역할
} //PerformListPrint(array)




</script>
<!-- 스크립트 끝. -->




<div class="content_body"> <!-- 지우면안됨 -->
	<!-- 내용시작 -->
	
		<h1>실적등록</h1>
	<div class="search_bar">
	<form>
	<table id="btn">
	<tr><td><button>조회</button></td></tr></table>
	<table id="search">
	<tr><td>라인</td>
	<td><select name="line"> <!-- 라인 리스트 완성되면 불러오기 -->
		<option value="1"></option>
		<option value="2"></option>
		<option value="3"></option>
		</select></td>
	<td>지시일자</td>
	<td><input type="date" name="sdate"></td>
	<td><input type="date" name="edate"></td>
	<td>품번</td>
	<td><input type="text" name="pcd" onclick="openilist()"></td>
	<td><input type="text" name="pnm" onclick="openilist()"></td></tr>
	<tr><td>지시상태</td>
	<td colspan="8">
	<input type="checkbox" name="ists1" value="지시"> 지시 
	<input type="checkbox" name="ists2" value="시작"> 시작 
	<input type="checkbox" name="ists3" value="마감"> 마감</td>
	</tr>
	</table>
	</form>
	</div>

	<br><br><br>
	<h2>작업지시</h2>
	<br>
	<table border="1" id="main">
	
	<tr id="th"><th>작업지시번호</th><th>라인</th><th>라인명</th><th>품번</th><th>품명</th><th>지시상태</th><th>지시일자</th><th>지시수량</th><th>수주번호</th><th>업체</th></tr>
	
	
	<c:forEach var="idto" items="${instrList }">
	<tr id="con" onclick="getPerformList(${idto.instrId })">
		<td>${idto.instrId }</td>
		<td>${idto.lineCd }</td>
	  	<td>${idto.lineName}</td>
	  	<td>${idto.itemNum}</td>
	  	<td>${idto.itemName}</td>
	 	<td>${idto.workSts}</td>
	  	<td>${idto.workDate}</td>
	  	<td>${idto.workQty}</td>
	  	<td>${idto.ordNum}</td>
	  	<td>${idto.ClientName}</td></tr>
	</c:forEach>

    </table>
	

	<br><br><br>
	<h2>생산실적</h2>

	<table id="btn">
	<tr><td><button id="add" onclick="addNewRow()">추가</button>
	<button>수정</button>
	<button>삭제</button>
	</td></tr></table>

	

	<table border="1" id="PerformList_ajax">
	<tr id="th" ><th>품번</th><th>품명</th><th>실적일</th><th>양불여부</th><th>실적수량</th><th>불량사유</th></tr>
	<tr id="con"><td colspan="6"> 해당 자료가 없습니다 </td></tr>
    </table>

	
	













</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
