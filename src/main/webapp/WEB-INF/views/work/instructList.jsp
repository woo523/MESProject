<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<div class="selectButtons">
		<button type="button">조회</button>
		<button type="button">추가</button>
	</div>
	
	<table class="searchBox">
		<tr>
			<td>라인</td>
			<td><select>
					<option value="1" selected>전체</option>
					<option value="2">라인 1</option>
					<option value="3">라인 2</option>
					<option value="4">라인 3</option>
				</select></td>
			<td>지시일자</td>
			<!-- 시작시 기본 날짜 설정은 value를 이용 -->
			<td><input type="text" id="startDatePicker" class="form-control" value="" placeholder="날짜를 선택해주세요" />
	   			<input type="text" id="endDatePicker" class="form-control" value="" /></td>
			<td>품번</td>
			<td><input type="text" placeholder="품번코드">
				<input type="text" placeholder="품번명" readonly></td>
		</tr>
		<tr>
			<td>지시상태</td>
			<td colspan="8">
				<input type="checkbox" value="order1">지시
				<input type="checkbox" value="order2">시작
				<input type="checkbox" value="order3">마감
			</td>
		</tr>
	</table>
</article>
	
<article>
	<h2>목록</h2>
	
	<div class="listButtons">
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
		<c:forEach var="instrDTO" items="${instrList}" varStatus="status">
				<tr>
					<td>${instrDTO.workNum}</td>
					<td>${instrDTO.workNum}</td>
					<td>${instrDTO.workNum}</td>
					<td>${instrDTO.workDate}</td>
					<td>${instrDTO.workSts}</td>
					<td>${instrDTO.itemDTO.itemNum}</td>
					<td>${instrDTO.itemDTO.itemName}</td>
					<td>${instrDTO.itemDTO.invntUnit}</td>
					<td>${instrDTO.lineDTO.lineCode}</td>
					<td>${instrDTO.lineDTO.lineName}</td>
					<td>${instrDTO.lineDTO.proCode}</td>
					<td>${instrDTO.workQty}</td>
					<td>${instrDTO.insertDate}</td>
					<td>${instrDTO.insertId}</td>
				</tr>
		</c:forEach>
	</table>
</article>
	
</div>

<!-- <footer> -->
	<jsp:include page="../inc/footer.jsp" />
<!-- </footer> -->

</body>

<script>
   $('#startDatePicker')
      .datepicker({
         format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
         startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
         endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
         autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
         calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
         clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
         immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
         multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
         multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
         templates: {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;',
         }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
         showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
         todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
         toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인 경우 그대로 유지 true인 경우 날짜 삭제
         weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
         language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
      })
      .on('changeDate', function (e) {
         /* 이벤트의 종류 */
         //show : datePicker가 보이는 순간 호출
         //hide : datePicker가 숨겨지는 순간 호출
         //clearDate: clear 버튼 누르면 호출
         //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
         //changeMonth : 월이 변경되면 호출
         //changeYear : 년이 변경되는 호출
         //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간

         console.log(e);
         // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
      });
      
   $('#endDatePicker')
      .datepicker({
         format: 'yyyy-mm-dd',
         startDate: '-10d',
         endDate: '+10d',
         autoclose: true,
         calendarWeeks: false,
         clearBtn: false,
         immediateUpdates: false,
         multidate: false,
         templates: {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;',
         },
         showWeekDays: true,
         todayHighlight: true,
         toggleActive: true, 
         weekStart: 0,
         language: 'ko',
      })
      .on('changeDate', function (e) {
         /* 이벤트의 종류 */
         //show : datePicker가 보이는 순간 호출
         //hide : datePicker가 숨겨지는 순간 호출
         //clearDate: clear 버튼 누르면 호출
         //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
         //changeMonth : 월이 변경되면 호출
         //changeYear : 년이 변경되는 호출
         //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간

         console.log(e);
      });
</script>
</html>