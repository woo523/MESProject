<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출하현황</title>
<!-- 헤더 -->
<%-- <jsp:include page="../inc/header.jsp" /><!-- 지우면안됨 --> --%>
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

#clntNm {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
}
#userNm{
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position:98%;
	border: 1px solid;
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
  width:1125px;
}

</style>	
</head>

<body>


<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
  $(function() {
    $( ".datepicker" ).datepicker();
  });
  $(function() {
	    $( ".datepicker1" ).datepicker1();
	  });
function openitemlist(){
    window.open("${pageContext.request.contextPath }/ship/itemInfo","popup", "width=500, height=500,left=100, top=100");
}
function userlist(){
    window.open("${pageContext.request.contextPath }/order/userList","popup", "width=500, height=500,left=100, top=100");
}
function openclntlist(){
    window.open("${pageContext.request.contextPath }/ship/clntInfo","popup", "width=500, height=500,left=100, top=100");
}
function openshiplist(){
    window.open("${pageContext.request.contextPath }/ship/shipInfo","popup", "width=500, height=500,left=100, top=100");
}
function openorderlist(){
    window.open("${pageContext.request.contextPath }/order/orderMng","popup", "width=500, height=500,left=100, top=100");
}


$(function() {
	$("#sshdate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='edate']").datepicker("option", "minDate", selectedDate );
           }
	});
});

$(function() {
	$("#Shdate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
//            ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
	});
});
$(function() {
	$("#Dlvdate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='edate']").datepicker("option", "minDate", selectedDate );
           }
	});
});

$(function() {
	$("#eDlvdate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
            	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
            	   $("input[name='edate']").datepicker("option", "minDate", selectedDate );
               }
//            ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
	});
});
  
$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

function deleteValue(){
	var url = "/ship/deleteCond";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	var valueArr = new Array();
    var list = $("input[name='RowCheck']");
    
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
//         alert(list[i].value);
        }
    }
    if (valueArr.length == 0){
    	alert("선택된 항목이 없습니다.");
    }
    else{
		var chk = confirm("삭제하시겠습니까?");		
		if(chk == true ){
		$.ajax({
		    url : url,                    // 전송 URL
		    type : 'GET',                // GET or POST 방식
		    traditional : true,
		    data : {
		    	"shipId" : valueArr        // 보내고자 하는 data 변수 설정
		    },
            success: function(jdata){
                if(jdata = 1) {
                    alert("삭제되었습니다");
                    location.replace("shipList")
                }
                else{
                    alert("삭제 실패");
                }
            }
		});
		
		
		}else {
			alert("취소되었습니다");			
		}
	}
}

function cmpltValue(){
	var url = "/ship/updateCond";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	var valueArr = new Array();
    var list = $("input[name='RowCheck']");
//     console.log(list);
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
//         alert(list[i].value);
        }
    }
    if (valueArr.length == 0){
    	alert("선택된 항목이 없습니다.");
    }
    else{
		var chk = confirm("완료처리하시겠습니까?");		
		if(chk == true ){
		$.ajax({
		    url : url,                    // 전송 URL
		    type : 'GET',                // GET or POST 방식
		    traditional : true,
		    data : {
		    	"shipId" : valueArr        // 보내고자 하는 data 변수 설정
		    },
            success: function(jdata){
                if(jdata = 1) {
                    alert("완료처리 되었습니다");
                    location.replace("shipList")
                }
                else{
                    alert("수정 실패");
                }
            }
		});
		
		
		}else {
			alert("취소했습니다");			
		}
	}
}

function prtTable() {
    const table = document.getElementById("shipList").outerHTML;
    const printWindow = window.open('', 'PrintWindow', 'height=400,width=600');
    printWindow.document.write('<html><head><title>' + document.title + '</title>');
    printWindow.document.write('</head><body>');
    printWindow.document.write(table);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
  }

</script>
      
<!-- 스크립트 끝. -->

<div class="content_body"> <!-- 지우면안됨 -->
<article>
	<!-- 내용시작 -->
		
	<h1>출하현황</h1>
<div class="search_bar">
	<form id="search">
		<div id="btn">
			<button type="submit" id="submit">조회</button>			
		</div>
				<br>
			<table id="search">
				<tr>
				<td>출하업체</td>
				<td><input type="text" name="clntNm" id="clntNm" onclick="openclntlist()">
					<input type="hidden" name="clntId" id="clntId" value="">
					<input type="hidden" name="clntCd" id="clntCd" value=""></td>
				
				<td>납품예정일</td>
				<td><input type="text" id="Dlvdate" class="form-control" name="Dlvdate" placeholder="날짜를 선택해주세요" readonly>	</td>

				<td>품번</td>
				<td><input type="text" name="itemNum" id="itemNum"  onclick="openitemList()">
					<input type="hidden" name= "itemNm" id="itemNm"  onclick="openitemList()">	
					<input type="hidden" name="invntUnit" id="invntUnit" value="" >
					<input type="hidden" name="shipQty" id="shipQty" value="" ></td>
				</tr>
				
				<tr>
				<td>담당자</td>
				<td><input type="text" name="userNm" id="userNm" onclick="openuserList()">
					<input type="hidden" name="userId" id="userId"value="">
					<input type="hidden" name="userNum" id="userNum" value="">
					<input type="hidden" name="itemId" id="itemId"  onclick="openitemList()"></td>
				
				<td>출하일자</td>
				<td><input type="text" id="sshdate" class="form-control" name="sshdate" placeholder="날짜를 선택해주세요" readonly></td>
				<td>출하완료여부</td>
				<td><select name="shipCond" id="shipCond" > <!-- 조회함, N Y값을 들고와야함 -->
					<option value="">완료여부</option>
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
				</tr>
				
			</table>
		</form>
	</div>
<br>
<br>
	
	
	
		
	<h2>목록</h2>
	<div id="count">총 ${pageDTO.count } 건</div>
	<table border="1" id="main">
		
		<div id="btn">
			<input type="button" value="출하완료" class="btn btn-outline-info" onclick="cmpltValue();">
			<input type="button" value="출하삭제" class="btn btn-outline-info" onclick="deleteValue();">
			<input type="button" value="출력" class="print-table" onclick="prtTable();">
		</div>
		
		
		<tr id="th">
			<td><input id="allCheck" type="checkbox" name="allCheck"/></td>
			<th>출하번호</th>
			<th>납품예정일</th>
			<th>출하업체</th>
			<th>담당자</th>
			<th>품번</th>
			<th>품명</th>
			<th>출하일자</th>
			<th>출하량</th>
			<th>출하상태</th>
		</tr>
			
			
				<c:forEach var="sdto" items="${shipList}">
					<tr>
					<td><input name="RowCheck" type="checkbox" value="${sdto.shipId}"/>
						<input type="hidden"${sdto.shipId}></td>
					<td>${sdto.shipNum}</td>
					<td>${sdto.Dlvdate}</td>
					<td>${sdto.clntNm}</td>
					<td>${sdto.userNm}</td>
					<td>${sdto.itemNum}</td>
					<td>${sdto.itemNm}</td>
					<td>${sdto.Shdate}</td>
					<td>${sdto.shipQty}</td>
					<c:choose>
					<c:when test="${sdto.shipCond eq 'Y' }">
						<td style="color: blue">${sdto.shipCond}</td>
					</c:when>
					<c:otherwise>
						<td style="color: red">${sdto.shipCond}</td>
					</c:otherwise>
				</c:choose>
				</tr>
				</c:forEach>
				</table>
		<br>
	
		<div class="center">
		<div id="pagination">

		<!-- 1페이지 이전 -->
		<c:if test="${pageDTO.currentPage > 1}">
			<a
				href="${pageContext.request.contextPath }/ship/shipList?itemName=${search.itemName}&shipQty=${search.shipQty}&shipDt=${search.shipDt}
				&clntId=${search.clntId}&shipNum=${search.shipNum}&insertId=${search.insertId}&shipQty=${search.shipQty}&shipCond=${search.shipCond}&pageNum=${pageDTO.currentPage-1}"><</a>
		</c:if>

		<!-- 10페이지 이전 -->
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a
				href="${pageContext.request.contextPath }/ship/shipList?itemName=${search.itemName}&shipQty=${search.shipQty}&shipDt=${search.shipDt}
				&clntId=${search.clntId}&shipNum=${search.shipNum}&insertId=${search.insertId}&shipQty=${search.shipQty}&shipCond=${search.shipCond}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/ship/shipList?itemName=${search.itemName}&shipQty=${search.shipQty}&shipDt=${search.shipDt}
				&clntId=${search.clntId}&shipNum=${search.shipNum}&insertId=${search.insertId}&shipQty=${search.shipQty}&shipCond=${search.shipCond}&pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- 1페이지 다음 -->
		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/shipList?itemName=${search.itemName}&shipQty=${search.shipQty}&shipDt=${search.shipDt}
				&clntId=${search.clntId}&shipNum=${search.shipNum}&insertId=${search.insertId}&shipQty=${search.shipQty}&shipCond=${search.shipCond}&pageNum=${pageDTO.currentPage+1}">></a>
		</c:if>

		<!-- 10페이지 다음 -->
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/ship/shipList?itemName=${search.itemName}&shipQty=${search.shipQty}&shipDt=${search.shipDt}
				&clntId=${search.clntId}&shipNum=${search.shipNum}&insertId=${search.insertId}&shipQty=${search.shipQty}&shipCond=${search.shipCond}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
		</c:if>

		</div>
		</div>
	<br>
	
	
<!-- 내용끝 -->
</article>
</div><!-- 지우면안됨 -->
</body>

<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->



</html>