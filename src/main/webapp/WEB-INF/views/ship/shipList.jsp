<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출하현황</title>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" /><!-- 지우면안됨 -->
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
	
	function addRow() {
		var table = document.getelementByld("shipList").getElementsByTagName('tbody')[0];
		var newRow = table.insertRow(table.length);
		
		var cell1 = newRow.insert(0);
		var cell2 = newRow.insert(1);
		var cell3 = newRow.insert(2);
		var cell4 = newRow.insert(3);
		var cell5 = newRow.insert(4);
		var cell6 = newRow.insert(5);
		var cell7 = newRow.insert(6);
		var cell8 = newRow.insert(7);
		
		cell1.innerHTML = "";
		cell2.innerHTML = "";
		cell3.innerHTML = "";
		cell4.innerHTML = "";
		cell5.innerHTML = "";
		cell6.innerHTML = "";
		cell7.innerHTML = "";
		cell8.innerHTML = "";	
	}

    function editRow(button) {
        const row = button.parentNode.parentNode;
        const cells = row.cells;

        for (let i = 0; i < cells.length - 1; i++) {
          const input = document.createElement("input");
          input.value = cells[i].innerText;
          cells[i].innerText = "";
          cells[i].appendChild(input);
        }

        const saveButton = document.createElement("button");
        saveButton.innerText = "저장";
        saveButton.onclick = function() {
          saveRow(row);
        }

        const cancelButton = document.createElement("button");
        cancelButton.innerText = "취소";
        cancelButton.onclick = function() {
          cancelEdit(row);
        }

        const editCell = row.lastElementChild;
        editCell.innerHTML = "";
        editCell.appendChild(saveButton);
        editCell.appendChild(cancelButton);
      }

      function saveRow(row) {
        const cells = row.cells;

        for (let i = 0; i < cells.length - 1; i++) {
          const input = cells[i].firstChild;
          cells[i].innerText = input.value;
        }

        const editCell = row.lastElementChild;
        editCell.innerHTML = '<button class="edit-row" onclick="editRow(this)">수정</button>';
      }

      function cancelEdit(row) {
        const cells = row.cells;

        for (let i = 0; i < cells.length - 1; i++) {
          cells[i].innerHTML = cells[i].firstChild.value;
        }

        const editCell = row.lastElementChild;
        editCell.innerHTML = '<button class="edit-row" onclick="editRow(this)">수정</button>';
      }
	
      
      function delRow(button) {
          const row = button.parentNode.parentNode;
          row.parentNode.removeChild(row);
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
      
      
      $(function() {
    		$("#sOdate").datepicker({
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
    		$("#eOdate").datepicker({
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
//    	            ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
    		});
    	});
    	$(function() {
    		$("#sDdate").datepicker({
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
    		$("#eDdate").datepicker({
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
//    	            ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
    		});
    	});
    	  
    	$(document).ready(function () {
    		// class = "brown" 클릭했을 때 "클릭"
    		$('.search').click(function () {
    		
    		// 자바스크립트 배열(json) <= DB에서 가져옴
    		var arr = [
    				   {"subject":"제목1","date":"2023-01-01"},
    				   {"subject":"제목2","date":"2023-01-02"},
    				   {"subject":"제목3","date":"2023-01-03"}
    				  ];
    		
    		// 초기화
    		$('table').html('');
    		
    		$.ajax({
    			url:'${pageContext.request.contextPath}/board/listjson', 			// json형태로 들고옴 (페이지에 가서)
    			dataType:'json',			// json형태로 받아옴 (json형태)
    			success:function(arr){ 		// json형태로 만든 arr를 가져옴
    			
    						// 반복해서 출력 .each()
    						// arr 배열을 반복하겠다 반복할때의 기능은 어떻게 할건지?
    						$.each(arr,function(index, item){
    						// 클릭을 하면 0,1,2번 배열을 반복함
//    		 				alert(index);
//    		 				alert(item.subject);
//    		 				alert(item.date);

    						// 변수이기에 +로 연결시켜줘야 함
    						// 기존내용 없애고 그자리에 새로 넣기, 마지막 게 나옴 ,하나에 덮어서 써진다
//    		 				$('table').html('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
    						
    						// 추가하겠다는 함수 다시 사용 (html -> append로 바꾸기)
    						$('table').append('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
    					});
    				}
    			});
    		});
    	});

	
	
</script>
<!-- 스크립트 끝. -->

<div class="content_body"> <!-- 지우면안됨 -->
<article>
	<!-- 내용시작 -->
		
	<h2>출하현황</h2>
	
	<form id="shAdmin">
		<div class="selectButtons">
			<button type="submit" id="submit">조회</button>
			<button type="button" onclick="addRow()">추가</button>
			<button type="button" class="edit-row" onclick="editRow(this)">수정</button>
			<button type="button" class="delete-row" onclick="delRow()">삭제</button>
			<button type="button" class="print-table" onclick="prtTable()">출력</button>
		</div>
		
		<table border="1" class="shipList">
			<thead>
				<tr>
				<th>출하번호</th>
				<th>제품명</th>
				<th>수량</th>
				<th>출하일</th>
				<th>출하지</th>
				<th>송장번호</th>
				<th>주문자 정보</th>
				<th>출하상태</th>
				</tr>
			</thead>
			<c:when test="${empty orderList}">
				<tr>
				<td colspan="8"></td>
				</tr>
				<tr>
				<td colspan="8">해당 주문 정보가 존재하지 않습니다.</td>
				</tr>
		</c:when>
			<tbody>
				<c:forEach var="shipDTO" items="${shipList}">
					<tr>
					<td>${shipDTO.shipNum}</td>
					<td>${shipDTO.itemName}</td>
					<td>${shipDTO.amount}</td>
					<td>${shipDTO.shipDt}</td>
					<td>${shipDTO.clntNm}</td>
					<td>${shipDTO.trackNum}</td>
					<td>${shipDTO.clntId}</td>
					<td>${shipDTO.shipCond}</td>
				</tr>
				</c:forEach>
			</tbody>
	</table>
	
	
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
	
	
	
	
	
	</form>
<!-- 내용끝 -->
</article>
</div><!-- 지우면안됨 -->






<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" /><!-- 지우면안됨 -->

</body>

</html>