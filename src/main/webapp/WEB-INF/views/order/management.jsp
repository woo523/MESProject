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
#pagination{
      width: 1125px;  
text-align: center;
}

#pcd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position: right;
}

#pnm {
	background-color: #EAEAEA;
}

#ccd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position: right;
}

#cnm {
	background-color: #EAEAEA;
}
</style>

</head>

<body>
<script type="text/javascript">
  $(function() {
    $( ".datepicker" ).datepicker();
  });
  $(function() {
	    $( ".datepicker1" ).datepicker1();
	  });
function openilist1(){
    window.open("${pageContext.request.contextPath }/order/itemList","popup", "width=600, height=600,left=100, top=100");
}
function openilist2(){
    window.open("${pageContext.request.contextPath }/order/userList","popup", "width=600, height=600,left=100, top=100");
}
function openilist3(){
    window.open("${pageContext.request.contextPath }/order/clntList","popup", "width=600, height=600,left=100, top=100");
}


$(function() {
	$("#sODate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
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
        	   $("input[name='eOdate']").datepicker("option", "minDate", selectedDate );
           }
	});
});

$(function() {
	$("#eODate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
	});
});

</script>

<div class="content_body">
<article>
	<h2>수주관리</h2>
	<form id="orderSearch">
		<div class="selectButtons">
			<button type="submit">조회</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>업체</td>
				<td><input type="text" id="clntCd" onclick="openilist3()"></td>
				<td>수주일자</td>
				<td><input type="text" id="sDate" class="form-control" name="sOdate" placeholder="날짜를 선택해주세요" readonly></td>
				<td><input type="text" id="eDate" class="form-control" name="eOdate" readonly></td>
				<td>담당자</td>
				<td><input type="text" id="user" onclick="openilist2()"></td>
				<td>납품예정일</td>
				<td><input type= "text" class="datepicker" name = "date" id="sDdate"/></td>
				<td><input type= "text" class="datepicker" name = "date" id="eDdate"/></td>
			</tr>
		</table>
</form>

	<h2>수주품목상세</h2>
	<form id="orderSearch">
		<div class="selectButtons">
			<button type="button">취소</button>
			<button type="button">삭제</button>
			<button type="submit">저장</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>업체코드</td>
				<td><input type="text" id="clntCd" onclick="openilist3()"></td>
				<td>수주일자</td>
				<td><input type="text" id="sDate" class="form-control" name="sOdate" placeholder="날짜를 선택해주세요" readonly></td>
				<td><input type="text" id="eDate" class="form-control" name="eOdate" readonly></td>
				<td>담당자</td>
				<td><input type="text" id="user" onclick="openilist2()"></td>
				<td>납품예정일</td>
				<td><input type= "text" class="datepicker1" name = "date" id="sDdate"/></td>
				<td><input type= "text" class="datepicker1" name = "date" id="eDdate"/></td>
				<td>고객수주번호</td>
				<td><input type="text" id="csmtrOrdNum"></td>
			</tr>
		</table>
</form>

	<h2>수주정보</h2>
	<form id="orderSearch">
		<div class="selectButtons">
			<button type="button">취소</button>
			<button type="button">삭제</button>
			<button type="submit">저장</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>품번</td>
				<td><input type="text" id="itemNum" onclick="openilist1()"></td>
				<td>품명</td>
				<td><input type="text" id="itemName" onclick="openilist1()"></td>
				<td>단위</td>
				<td><input type="text" id="ea"></td>
				<td>수량</td>
				<td><input type="text" id="increase"></td>
			</tr>
		</table>
	
		<h2>목록</h2>
		
		<div class="listButtons">
			<button type="button">취소</button>
			<button type="button">삭제</button>
			<button type="button">저장</button>
		</div>
		
		<table border="1" class="orderList">
			<tr>
				<th>수주업체코드</th>
				<th>수주업체</th>
				<th>수주일자</th>
				<th>납품예정일</th>
				<th>담당자코드</th>
				<th>담당자</th>
				<th>고객수주번호</th>
			</tr>
			<c:choose>
				<c:when test="${empty orderList}">
					<tr><td colspan="6"></td></tr>
					<tr>
						<td colspan="6">해당 주문 정보가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="orderDTO" items="${orderList}">
						<tr>
							<td>${orderDTO.clntCd}</td>
							<td>${orderDTO.clntNm}</td>
							<td>${orderDTO.orderDt}</td>
							<td>${orderDTO.dlvryDt}</td>
							<td>${orderDTO.id}</td>
							<td>${orderDTO.name}</td>
							<td>${orderDTO.csmtrOrdNum}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
</article>
	
</div>
    <div id="pagination">
    <!-- 1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/order/management?line=${search.line}&sOdate=${search.sOdate}&eOdate=${search.eOdate }&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/order/management?line=${search.line}&sOdate=${search.sOdate}&eOdate=${search.eOdate }&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a id="num" href="${pageContext.request.contextPath }/order/management?line=${search.line}&sOdate=${search.sOdate}&eOdate=${search.eOdate }&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음 -->	
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/order/management?line=${search.line}&sOdate=${search.sOdate}&oeOdate=${search.eOdate }&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/order/management?line=${search.line}&sOdate=${search.sOdate}&eOdate=${search.eOdate }&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	</div>
<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

</html>