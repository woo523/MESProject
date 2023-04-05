<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>item</title>
	<link href="/resources/css/instruct/line.css" rel="stylesheet" type="text/css">
	
<style type="text/css">
h2{
	margin : 20px 0px;
}
.item_body {
	padding : 30px;
}
.itemfilter{
	border : 1px solid black;
	width : 100%;
	margin-top : 5px;
	margin-bottom : 30px;
}
.itemfilter td{
	padding : 10px;
}
.searchitem{
	display :block;	
}
button{
display: inline-block;
    width: 70px;
    height: 28px;
    font-size: 15px;
}
.tableinput{
	width : 95%;
	border : white;
}
.datalist td{
	border : 1px solid #black;
	width : 10px;
	text-align : center;
	vertical-align:middle;
}

.itemtitle{
	border : 1px solid #black;
}
.itemtitle th{
	border-top: 1px solid black;
    border-bottom: 1px solid black;
    padding: 5px;
    margin-bottom: 10px;
    font-weight: bold;
    vertical-align: middle;
    width : 8%; 	
}

.itemcontent{
	width:100%;
}

.itemcontent td{
    padding: 5px;
    margin-bottom: 10px;
    font-weight: bold;
    vertical-align: middle;
    width : 9%; 
    text-align:center;
    height : 30px;
}

.imodifyList td{
    padding: 5px;
    margin-bottom: 10px;
    font-weight: bold;
    vertical-align: middle;
    width : 9%; 
    text-align:center;
    background : yellow;
    height : 30px;
}

.listButtons{
	margin-bottom: 5px;
}

.itemcontent td input{ 
	padding: 5px;
    margin-bottom: 10px;
    font-weight: bold; 
    vertical-align: middle;
    width : 100%;
    text-align:center;
    border : 0px;
    pointer-events: none;
    height : 80%;     
}

.imodifyList td input{
  	background : yellow;  
 	border : 3px solid #elelel; 
 	padding: 5px; 
     margin-bottom: 10px; 
     font-weight: bold;  
     vertical-align: middle; 
     width : 100%; 
     height : 80%; 
     text-align:center; 
}


</style>
	<script type="text/javascript">
		
	
	function insert_item(){
		var row_idx = parseInt($(".row_idx:last").text()) + 1;
		if(!row_idx){row_idx=1;}
		var table = "";
	
	
		table += "<tr class=\"datalist\">";
// 		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'>"+row_idx+"</td>";
		table += 	"<td><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle;'><input class=\"tableinput\" type=\"text\"></td>";
		table += 	"<td style='border: 1px solid black; width:10px; text-align:center;vertical-align:middle'>";
		table += 		"<div class=\"delete\">";
		table += 			"<button type='button' name='item_save' onclick=\"saveLine(this)\";>저장</button>";
		table += 			"<button type='button' name='item_del' onclick=\"deleteLine(this)\";>삭제</button>";
		table += 		"</div>";
		table +=	 "</td>";
		table += "</tr>";
		
		$("#tbody_id:last").append(table);
	} //추가

	function modifyLine(obj){
		console.log('수정');

		var tr = $(obj);
// 		var item=$(obj).closest('tr').children('.tditemname').find('input[type="text"]').val();
// 		console.log(item); 
		
// 		$(".itemcontent").attr("class","imodifyList"); ->클래스 변경
		$(obj).closest('tr').children().find('input[type="text"]').prop('readonly',false);

		//input css변형
		$(obj).closest('tr').children('td').find('input[type="text"]').css("border", "3px solid gray");    
		$(obj).closest('tr').children('td').find('input[type="text"]').css("height", "50%"); 
		$(obj).closest('tr').children('td').find('input[type="text"]').css("width", "90%"); 
		$(obj).closest('tr').children('td').find('input[type="text"]').css("pointer-events", "inherit"); 
		
		//취소 버튼 눌렀을 때
// 		$('#cancel').click(function(){
// 			$(obj).closest('tr').children('td').find('input[type="text"]').removeAttr("style");
// 		});
		
		var itemId=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
		console.log(itemId);
// 		location.href="${pageContext.request.contextPath}/mdm/itemupdate?itemId="+itemId;
		
		var itemNum=$(obj).closest('tr').children('.tditemnum').find('input[type="text"]').val();
		var itemName=$(obj).closest('tr').children('.tditemname').find('input[type="text"]').val();
		var mtrlType=$(obj).closest('tr').children('.tdmtrltype').find('input[type="text"]').val();
		var mtrlSort=$(obj).closest('tr').children('.tdmtrlsort').find('input[type="text"]').val();
		var invntUnit=$(obj).closest('tr').children('.tdinvntunit').find('input[type="text"]').val();
		var invntQlt=$(obj).closest('tr').children('.tdinvntqlt').find('input[type="text"]').val();
		var standard=$(obj).closest('tr').children('.tdstandard').find('input[type="text"]').val();
		var useYn=$(obj).closest('tr').children('.tduseyn').find('input[type="text"]').val();
		var clntName=$(obj).closest('tr').children('.tdclntname').find('input[type="text"]').val();
		var salePrice=$(obj).closest('tr').children('.tdsaleprice').find('input[type="text"]').val();
		var buyPrice=$(obj).closest('tr').children('.tdbuyprice').find('input[type="text"]').val();
		var note=$(obj).closest('tr').children('.tdnote').find('input[type="text"]').val();	
// 		console.log(itemNum);
// 		console.log(itemName);
// 		console.log(mtrlType);
// 		console.log(mtrlSort);
// 		console.log(invntUnit);
// 		console.log(invntQlt);
// 		console.log(standard);
// 		console.log(useYn);
// 		console.log(clntName);
// 		console.log(salePrice);
// 		console.log(buyPrice);
// 		console.log(note);
        //저장버튼 눌렀을 때
// 		$('#save').click(function(){
// 			$(obj).closest('tr').children('td').find('input[type="text"]').removeAttr("style");
	
// 		});
// 	 		console.log(itemNum);
// 	 		console.log(itemName);
// 	 		console.log(mtrlType);
// 	 		console.log(mtrlSort);
// 	 		console.log(invntUnit);
// 	 		console.log(invntQlt);
// 	 		console.log(standard);
// 	 		console.log(useYn);
// 	 		console.log(clntName);
// 	 		console.log(salePrice);
// 	 		console.log(buyPrice);
// 	 		console.log(note);

// 			var formString = $("form[name=formlist]").serialize();
// 			$.ajax({
// 				type : 'post',
// 				url : '/mdm/itemupdatePro',
// 				data : formString,
// 				dataType : 'json',
// 				data: {
// 					"itemNum" : itemNum,
// 					"itemName" : itemName,
// 					"mtrlType" : mtrlType,
// 					"mtrlSort" : mtrlSort,
// 					"invntUnit" : invntUnit,
// 					"invntQlt" : invntQlt,
// 					"standard" : standard,
// 					"useYn" : useYn,
// 					"clntName" : clntName,
// 					"salePrice" : salePrice,
// 					"buyPrice" : buyPrice,
// 					"note" : note
// 				},
// 				success: function(result) {
// 					alert("저장되었습니다.");
// 				}
// 			})
// 		});

	} //수정

	function cancleLine(obj){
		$('#cancel').click(function(){
			$(obj).closest('tr').children('td').find('input[type="text"]').removeAttr("style");
		});
	}
	
	function saveLine(obj){
		var itemId=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
			
// 			$(obj).closest('tr').find('input[type="text"]').val();
		var tr = $(obj);
		console.log('저장');
		console.log(itemId);
		
		$(obj).closest('tr').find('input[type="text"]').removeAttr("style");
		
		$('#formlist').attr("action", "/mdm/itemupdatePro");
		
		$('#formlist').submit();
		
		} //저장
	
	function deleteLine(obj){

		var id=$(obj).closest('tr').children('#helpbutton').find('input[type="hidden"]').val();
	
		console.log(id); 
		$(obj).closest('tr').remove();
		location.href="${pageContext.request.contextPath}/mdm/itemdelete?itemId="+id;
		
	} //삭제
	
// 	function openmodifybox() {
// 		window.open("/mdm/itemupdate","m","width=1000, height=200");	
// 	} //수정박스
	function openinsertbox() {
		window.open("/mdm/iteminsert", "a", "width=1000, height=200");
	} //추가박스
	
	</script>
</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->
<div class="item_body" id="item_body">
<h2>|| 품목검색 ||</h2><br>
<form id="itemSearch">		
<div class="searchitem"><button type="submit">조회</button></div>
<table class="itemfilter">
	<tr>
	<td>품번</td>  <td><input type="text" class="itemNum" name="itemNum"></td>
	<td>품명</td>  <td><input type="text" class="itemName" name="itemName"></td>
	<td>자재유형</td> <td><select name="mtrlType">
						<option value="" selected>전체</option>
						<option value="원자재">원자재</option>
						<option value="부자재">부자재</option>
						<option value="완제품">완제품</option>
					</select></td>
	<td>자재구분</td> <td><select name="mtrlSort">
						<option value="" selected>전체</option>
						<option value="사내">사내</option>
						<option value="사외">사외</option>
					</select></td>
	<td>사용여부</td> <td><select name="useYn">
						<option value="" selected>전체</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select></td>
</table>
</form>
<div class="itemlist">
<h2>|| 품목리스트 ||</h2><br>
	<div class="listButtons">
		<button type="button" id="cancel" onclick="cancleLine(this);">취소</button>
		<button type="button" onclick="openinsertbox();">추가</button>
	</div>

<form name="formlist" id="formlist" method="post">
	<table style="width:100%;" class="itemList">
		<thead>
		<tr class="itemtitle">
			<th>품번</th>
			<th>품명</th>
			<th>자재유형</th>
			<th>자재구분</th>
			<th>재고단위</th>
			<th>재질</th>
			<th>규격</th>
			<th>사용여부</th>
			<th>거래처</th>
			<th>매입단가</th>
			<th>매출단가</th>
			<th>비고</th>
			<th> </th>
		</tr>
		<c:forEach var="itemDTO" items="${itemList}">	
			<tr class="itemcontent" id="modifybox">		
				<td class="tditemnum"><input type="text"  name="itemNum"  value="${itemDTO.itemNum}" readonly></td>
				<td class="tditemname"><input type="text" name="itemName"  value="${itemDTO.itemName}" readonly></td>
				<td class="tdmtrltype"><input type="text" name="mtrlType"  value="${itemDTO.mtrlType}" readonly></td>
				<td class="tdmtrlsort"><input type="text"  name="mtrlSort" value="${itemDTO.mtrlSort}" readonly></td>
				<td class="tdinvntunit"><input type="text" name="invntUnit" value="${itemDTO.invntUnit}" readonly></td>
				<td class="tdinvntqlt"><input type="text" name="invntQlt"  value="${itemDTO.invntQlt}" readonly></td>
				<td class="tdstandard"><input type="text" name="standard"  value="${itemDTO.standard}" readonly></td>
				<td class="tduseyn"><input type="text" name="useYn"  value="${itemDTO.useYn}" readonly></td>
				<td class="tdclntname"><input type="text" name="clntName"  value="${itemDTO.clntName}" readonly></td>
				<td class="tdsaleprice"><input type="text" name="salePrice"  value="${itemDTO.salePrice}" readonly></td>
				<td class="tdbuyprice"><input type="text" name="buyPrice"  value="${itemDTO.buyPrice}" readonly></td>
				<td class="tdnote"><input type="text" name="note"  value="${itemDTO.note}" readonly></td>
				<td id="helpbutton" style="width:10px; text-align:center;vertical-align:middle;">
				<a href="#" class="modifyLine"><img src='${pageContext.request.contextPath}/resources/image/modify.png' id="modify" width='17px' onclick="modifyLine(this);"></a>
<%-- 				<a href="#" class="modifyLine"><img src='${pageContext.request.contextPath}/resources/image/modify.png' id="modify" width='17px' onclick="openmodifybox();"></a> --%>
				<a href="#" ><img src='${pageContext.request.contextPath}/resources/image/del.png' width='17px'></a>
				<a href="#" ><img src='${pageContext.request.contextPath}/resources/image/save.png' id="save" width='17px' onclick="saveLine(this)";></a>
<%-- 				<input type="image" src="${pageContext.request.contextPath}/resources/image/save.png" alt="" id="save" width='17px' onclick="saveLine(this);"> --%>
<%-- 				<input class="tditemid" type="hidden"  value="${itemDTO.itemId}" readonly> --%>
				<input class="tditemid" type="hidden" name="itemId"  value="${itemDTO.itemId}" readonly>
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
		<c:choose >
			<c:when test="${pageDTO.startPage > pageDTO.pageBlock}">
				<a href="/mdm/item?itemNum=${itemSearch.itemNum}&itemName=${itemSearch.itemName}&mtrlType=${itemSearch.mtrlType}&mtrlSort=${itemSearch.mtrlSort}&useYn=${itemSearch.useYn}&pageNum=${pageDTO.startPage - pageDTO.pageBlock}">◀</a>
			</c:when>
			<c:otherwise>
				<a class="none">◀</a>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
			<a href="/mdm/item?itemNum=${itemSearch.itemNum}&itemName=${itemSearch.itemName}&mtrlType=${itemSearch.mtrlType}&mtrlSort=${itemSearch.mtrlSort}&useYn=${itemSearch.useYn}&pageNum=${i}" <c:if test="${pageDTO.pageNum eq i}">class="active"</c:if>>${i}</a>
		</c:forEach>
		
		<c:choose>
			<c:when test="${pageDTO.endPage < pageDTO.pageCount}">
				<a href="/mdm/item?itemNum=${itemSearch.itemNum}&itemName=${itemSearch.itemName}&mtrlType=${itemSearch.mtrlType}&mtrlSort=${itemSearch.mtrlSort}&useYn=${itemSearch.useYn}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">▶</a>
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