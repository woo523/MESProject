<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EquipModify</title>
<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon-16x16.png">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>

<style type="text/css">
body{
	font-family: 'NanumSquare', sans-serif;
}
div h2{
	text-align: center;
	margin-left : 40px;
	font-weight: 900;
}

div #ebutton{
	text-align: center;
}

div table{
	margin: 0px auto;

	font-size:12pt;
}


div input, select, button{
	font-size: 12pt;
	font-family: 'NanumSquare', sans-serif;
}

.star{
	color : red;
}

.div{
	padding : 10px;
	width: 350px;
	margin: 0px auto;
}

.div td{
	padding : 6px;
}

#form{
	border:1px solid;
	padding : 15px;
}
.form-control {
		width: 150px;
		background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
		background-repeat: no-repeat;
		background-position: 98%;
		border: 1px solid;

	}
</style>

<script type="text/javascript">

$(document).ready(function() {
	var useyn = "${equipDTO.useYn}";
	console.log(useyn);
	$("#"+useyn).prop("checked", true);
	
	var equpType = "${equipDTO.equpType}";
	console.log(equpType);
	$("#equpType").val(equpType).prop("selected", true);
	
	var equpStat = "${equipDTO.equpStat}";
	console.log(equpStat);
	$("#equpStat").val(equpStat).prop("selected", true);
	
});

function check(){
	if($('.equpCode').val() == "") {
		alert("설비코드를 입력하세요.");
		$('.clntCode').focus();
	
		return false;
	}
	if($('.equpName').val() == "") {
		alert("설비명을 입력하세요.");
		$('.equpName').focus();
		
		return false;
	}
	
	if(confirm("수정하시겠습니까?")) {
		return true;
	} else {
		return false;
	}
}

function equipCode(obj){
	var obj = $(obj).val();
	console.log(obj);
	if(obj == "조립") {
		$('input[name=equpCode]').attr('value',"EASL00");
	}
	
	if(obj == "멸균") {
		$('input[name=equpCode]').attr('value',"ESTR00");
	}
	
	if(obj == "포장") {
		$('input[name=equpCode]').attr('value',"ESPM00");
	}
	
};

$(function() {
	$("#poDate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
			 ,showOtherMonths: true //빈 공간에 현재 월의 앞뒤 월의 날짜를 표시
	           ,showMonthAfterYear:true // 월- 년 순서가 아닌 년도 - 월 순서
	           ,changeYear: true //option값 년 선택 가능
	           ,changeMonth: true //option값  월 선택 가능
	           ,buttonText: "선택" //버튼 호버 텍스트              
	           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
	           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시여부
	           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
	           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='endDate']").datepicker("option", "minDate", selectedDate );
           }
	});
});
</script>
</head>
<body>

<jsp:include page="../inc/header2.jsp" />
<div class="div">
<br>
<h2> 설비 수정 </h2>
<form action="${pageContext.request.contextPath }/mdm/equipupdatePro" method="post" onsubmit="return check()" id="form">
<input type="hidden" name="equpId" value="${equipDTO.equpId}">
<table>
	<tr><td>설비코드 <span class="star">*</span></td> <td><input type="text" name="equpCode" id="equpCode" maxlength="6" class="equpCode" value="${equipDTO.equpCode}"></td></tr>
	<tr><td>설비명 <span class="star">*</span></td>  <td><input type="text" name="equpName" class="equpName" value="${equipDTO.equpName}"></td></tr>
	<tr><td>설비유형</td> <td><select name="equpType" id="equpType" class="equpType" onchange="equipCode(this);">
						<option value="조립">조립</option>
						<option value="멸균">멸균</option>
						<option value="포장">포장</option>
					</select></td></tr>
	<tr><td>구매처</td> <td><input type="text" name="poNum" value="${equipDTO.poNum}"></td></tr>
	<tr><td>구매일자</td> <td><input type="text" id="poDate" class="form-control" name="poDate" placeholder="날짜를 선택해주세요" value="${equipDTO.poDate}" readonly /></td></tr>
	<tr><td>구매금액</td> <td><input type="text" name="poAmount" value="${equipDTO.poAmount}"></td></tr>
	<tr><td>사용여부</td> <td><input type="radio" name="useYn" id="Y" value="Y" checked>Y
							<input type="radio" name="useYn" id="N" value="N">N</td></tr>
	<tr><td>설비상태</td> <td><select name="equpStat" id="equpStat" class="equpStat">
						<option value="가동">가동</option>
						<option value="대기">대기</option>
						<option value="고장">고장</option>
						</select></td></tr>
</table>
<div id="ebutton">
	<input type="submit" value="수정" id="modify" class="modify">
	<button type="reset">초기화</button>

</div>
</form>
</div>
</body>

</html>