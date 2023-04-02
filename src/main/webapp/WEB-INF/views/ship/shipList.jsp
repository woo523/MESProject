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
				<th>주문번호</th>
				<th>제품명</th>
				<th>수량</th>
				<th>출하일</th>
				<th>출하지</th>
				<th>송장번호</th>
				<th>주문자 정보</th>
				<th>출하상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="shipDTO" items="${shipList}">
					<tr>
					<td>${orderDTO.ordNum}</td>
					<td>${shipDTO.itemName}</td>
					<td>${shipDTO.shipQty}</td>
					<td>${shipDTO.shipDt}</td>
					<td>${orderDTO.clntId}</td>
					<td>${shipDTO.shipNum}</td>
					<td>${shipDTO.insertId}</td>
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