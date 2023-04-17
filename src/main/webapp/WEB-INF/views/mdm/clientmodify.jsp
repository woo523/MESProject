<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ClientModify</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">
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

div #cbutton{
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
</style>

<script type="text/javascript">

$(document).ready(function() {
	var useyn = "${clientDTO.useYn}";
	console.log(useyn);
	
	$("#"+useyn).prop("checked", true);
	
	var select = "${clientDTO.clntType}";
	console.log(select);
	$("#clntType").val(select).prop("selected", true);
});

function check(){
	if($('.clntCode').val() == "") {
		alert("거래처코드를 입력하세요.");
		$('.clntCode').focus();
	
		return false;
	}
	
	if($('.clntCode').val().length != 5) {
		alert("거래처코드를 5자로 입력하세요.");
		$('.clntCode').focus();
	
		return false;
	}
	
	if($('.clntName').val() == "") {
		alert("거래처명을 입력하세요.");
		$('.clntName').focus();
		
		return false;
	}
	if($('.manager').val() == "") {
		alert("담당자를 입력하세요.");
		$('.manager').focus();
		
		return false;
	}
	
	if($('.phone').val() == "") {
		alert("연락처를 입력하세요.");
		$('.phone').focus();
		
		return false;
	}
	
	if($("#email").val() != ""){
		if (!emailChk($("#email").val())) {
 			alert('메일주소가 유효하지 않습니다.');
 			$("#email").focus();
 			return false;
 		}
	} 
	
	
	
// 	if(!valChk($("#tell"), "전화번호")) return false;
	if (!tellChk($("#tell").val())) {
			alert('전화번호가 유효하지 않습니다.');
			$("#tell").focus();
			return false;
		}
	
	if(!valChk($("#phone"), "핸드폰번호")) return false;
	if (!phoneChk($("#phone").val())) {
			alert('연락처가 유효하지 않습니다.');
			$("#phone").focus();
			return false;
		}
	
	
	if(confirm("수정하시겠습니까?")) {
		return true;
	} else {
		return false;
	}
}

function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=zipCode]").val(data.zonecode);
           $("[name=address]").val(fullRoadAddr);
           

       }
    }).open();
} //주소api

function valChk(obj, alias) {
	if ($(obj).val() == "") {
		alert(alias + '을(를) 입력하세요.');
		$(obj).focus();
		return false;
	} else {
		return true;
	}
}

// 아이디 체크
function idChk(val) {
	var regExp = /^[0-9]*$/ //0-9까지 입력할거다
	return regExp.test(val); // 형식에 맞는 경우 true 리턴
}

// 이메일 체크
 	function emailChk(val) {
 		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
 		return regExp.test(val); // 형식에 맞는 경우 true 리턴
 	}

// 전화번호 체크
 	function tellChk(val) {
 		var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
 		return regExp.test(val); // 형식에 맞는 경우 true 리턴
 	}

// 휴대폰 체크
 	function phoneChk(val) {
 		var regExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
 		return regExp.test(val); // 형식에 맞는 경우 true 리턴
 	}

 // 전화번호 - 자동완성
 	function autoHyphenTell(target) {
 		target.value = target.value // target == this의 input
 		.replace(/[^0-9]/g, "")
		.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
		.replace("--", "-"); 
 	}
 
// 휴대폰번호 - 자동완성
 	function autoHyphen(target) {
 		target.value = target.value // target == this의 input
		   .replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
 	}
 	

// 거래처구분에 따른 거래처코드 부여
function clientCode(obj){
	var obj = $(obj).val();
	console.log(obj);
	if(obj == "자사") {
		$('input[name=clntCode]').attr('value',"A0000");
	}
	
	if(obj == "고객사") {
		$('input[name=clntCode]').attr('value',"C0000");
	}
	
	if(obj == "협력사") {
		$('input[name=clntCode]').attr('value',"J0000");
	}
	
};
// $(document).ready(function(){
// 	var obj = $('#clntType').val();
// 	if(obj == "자사") {
// 		$('input[name=clntCode]').attr('value',"A0000");
// 	}
	
// 	if(obj == "고객사") {
// 		$('input[name=clntCode]').attr('value',"C0000");
// 	}
	
// 	if(obj == "협력사") {
// 		$('input[name=clntCode]').attr('value',"J0000");
// 	}
//  });
 	

</script>
</head>
<body>

<jsp:include page="../inc/header2.jsp" />
<div class="div">
<br>
<h2> 거래처 수정 </h2>
<form action="${pageContext.request.contextPath }/mdm/clientupdatePro" method="post" onsubmit="return check()" id="form">
<input type="hidden" name="clntId" value="${clientDTO.clntId}">
<table>
	<tr><td>거래처코드 <span class="star">*</span></td>  <td><input type="text" name="clntCode" class="clntCode" id="clntCode" maxlength="5" value="${clientDTO.clntCode}"></td></tr>
	<tr><td>거래처명 <span class="star">*</span></td>  <td><input type="text" name="clntName" class="clntName" value="${clientDTO.clntName}"></td></tr>
	<tr><td>거래처구분</td> <td><select name="clntType" id="clntType" class="clntType" onchange="clientCode(this);">
						<option value="자사">자사</option>
						<option value="고객사">고객사</option>
						<option value="협력사">협력사</option>
					</select></td></tr>
	<tr><td>사업자번호</td> <td><input type="text" name="bsnsNum" value="${clientDTO.bsnsNum}"></td></tr>
	<tr><td>업태</td> <td><input type="text" name="industry" value="${clientDTO.industry}"></td></tr>
	<tr><td>종목</td> <td><input type="text" name="event" value="${clientDTO.event}"></td></tr>
	<tr><td>대표자</td> <td><input type="text" name="daepyo" value="${clientDTO.daepyo}"></td></tr>
	<tr><td>담당자 <span class="star">*</span></td> <td><input type="text" name="manager" class="manager" value="${clientDTO.manager}"></td></tr>
	<tr><td>우편번호</td> <td><input type="text" name="zipCode" value="${clientDTO.zipCode}"></td></tr>
	<tr><td>주소</td> <td><input type="text" name="address" value="${clientDTO.address}"></td></tr>
	<tr><td>상세주소</td> <td><input type="text" name="addrDtl" value="${clientDTO.addrDtl}"></td></tr>
	<tr><td>전화번호 <span class="star">*</span></td> <td><input type="text" name="tell" id="tell"  placeholder="051-000-0000" oninput="autoHyphenTell(this)" maxlength="13" value="${clientDTO.tell}"></td></tr>
	<tr><td>연락처 <span class="star">*</span></td> <td><input type="text" name="phone" class="phone" id="phone" placeholder="010-0000-0000" oninput="autoHyphen(this)" maxlength="13" value="${clientDTO.phone}"></td></tr>
	<tr><td>팩스</td> <td><input type="text" name="fax" value="${clientDTO.fax}"></td></tr>
	<tr><td>이메일</td> <td><input type="text" name="email" id="email" placeholder="예)email@naver.com" value="${clientDTO.email}"></td></tr>
	<tr><td>사용여부</td> <td><input type="radio" name="useYn" id="Y" value="Y" checked>Y
							<input type="radio" name="useYn" id="N" value="N">N</td></tr>
	<tr><td>비고</td> <td><input type="text" name="standard" placeholder="글자수는 최대 25자 입니다" maxlength="25" value="${clientDTO.note}"> </td></tr>

</table>
<div id="cbutton">
	<input type="submit" value="수정" id="modify" class="modify">
	<button type="reset">초기화</button>

</div>
</form>
</div>
</body>

</html>