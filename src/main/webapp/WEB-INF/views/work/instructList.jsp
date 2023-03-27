<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>instructList</title>
	
	<link href="/resources/css/instruct/instrList.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
<article>
	<h2>작업지시</h2>
	<form id="instrSearch" onsubmit="return formCheck()">
		<div class="selectButtons">
			<button type="submit" id="submit">조회</button>
			<button type="button" onclick="insertBtn()">추가</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>라인</td>
				<td><select name="lineName">
						<option value="" selected>전체</option>
						<option value="1">라인 1</option>
						<option value="2">라인 2</option>
						<option value="3">라인 3</option>
					</select></td>
				<td>지시일자</td>
				<!-- 시작시 기본 날짜 설정은 value를 이용 -->
				<td><input type="text" id="sDate" class="form-control" name="startDate" placeholder="날짜를 선택해주세요" readonly />
		   			<input type="text" id="eDate" class="form-control" name="endDate" readonly /></td>
				<td>품번</td>
				<td><input type="text" name="itemNum" placeholder="품번코드">
					<input type="text" placeholder="품명" readonly></td>
			</tr>
			<tr>
				<td>지시상태</td>
				<td colspan="8">
					<input type="checkbox" name="workSts1" value="지시" class="sCheck">지시
					<input type="checkbox" name="workSts2" value="시작" class="sCheck">시작
					<input type="checkbox" name="workSts3" value="마감" class="sCheck">마감
				</td>
			</tr>
		</table>
	

		<h2>목록</h2>
		
		<div class="listButtons">
			<c:choose>
				<c:when test="${empty instrList}">
					<span>총 ${instrTotal}건</span>
				</c:when>
				<c:otherwise>
					<span>총 ${instrSearchCount}건</span>
				</c:otherwise>
			</c:choose>
			<span>총 ${instrTotal}건</span>
			<button type="button">수정</button>
			<button type="button">삭제</button>
			<button type="button">취소</button>
			<button type="button">저장</button>
		</div>
		
		<table border="1" class="instrList">
			<tr>
				<th rowspan="2">작업지시번호</th>
				<th rowspan="2">업체</th>
				<th rowspan="2">수주번호</th>
				<th rowspan="2">지시일자</th>
				<th rowspan="2">지시상태</th>
				<th colspan="3">품목정보</th>
				<th colspan="3">공정정보</th>
				<th rowspan="2">지시수량</th>
				<th rowspan="2">등록일</th>
				<th rowspan="2">등록자</th>
			</tr>
			<tr>
				<th>품번</th>
				<th>품명</th>
				<th>단위</th>
				<th>라인</th>
				<th>라인명</th>
				<th>공정</th>
			</tr>
			<c:choose>
				<c:when test="${empty instrList}">
					<tr><td colspan="14"></td></tr>
					<tr>
						<td colspan="14">해당 데이터가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="instrDTO" items="${instrList}" varStatus="status">
						<tr>
							<td>${instrDTO.workNum}</td>
							<td>업체명</td>
							<td>수주번호</td>
							<td>${instrDTO.workDate}</td>
							<td>${instrDTO.workSts}</td>
							<td>${instrDTO.itemDTO.itemNum}</td>
							<td>${instrDTO.itemDTO.itemName}</td>
							<td>${instrDTO.itemDTO.invntUnit}</td>
							<td>${instrDTO.lineDTO.lineCode}</td>
							<td>${instrDTO.lineDTO.lineName}</td>
							<td>${instrDTO.lineDTO.proCode}</td>
							<td>${instrDTO.workQty}</td>
							<td><tf:FormatDateTime value="${instrDTO.insertDate}" pattern="yyyy-MM-dd" /></td>
							<td>${instrDTO.insertId}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
</article>
	
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

<script>

	$(function() {
		$("#sDate").datepicker({
			 dateFormat: 'yy-mm-dd' //달력 날짜 형태
	           ,showOtherMonths: true //빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
	           ,showMonthAfterYear:true // 월- 년 순서가 아닌 년도 - 월 순서
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
	        	   $("input[name='endDate']").datepicker("option", "minDate", selectedDate );
	           }
		});
	});
	
	$(function() {
		$("#eDate").datepicker({
			 dateFormat: 'yy-mm-dd' //달력 날짜 형태
	           ,showOtherMonths: true //빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
	           ,showMonthAfterYear:true // 월- 년 순서가 아닌 년도 - 월 순서
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
      
    function formCheck() {
    	// submit 버튼을 누르면 onsubmit에 의해 formCheck() 함수 호출
    	
    }
      
	function insertBtn() {
		alert("btn");
	}
      
</script>
</html>