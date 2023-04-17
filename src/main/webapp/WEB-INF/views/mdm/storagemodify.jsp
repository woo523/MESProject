<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.6.3.js"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">">
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
<meta charset="UTF-8">
<title>ItemInsert</title>
<script type="text/javascript">
$(document).ready(function(){
// 	$('#modify').click(function(){
// 		alert("수정되었습니다.");
// 		window.close();
// 	});	
	
	
	var useyn = "${storageDTO.useYn}";
	console.log(useyn);
	
	$("#"+useyn).prop("checked", true);
	
	var select = "${storageDTO.storType}";
	console.log(select);
	
	$("#storType").val(select).prop("selected",true);
});

function effecheck() {
	
	if($('.storCode').val() == "") {
		alert("창고코드를 입력하세요.");
		$('.clntCode').focus();
	
		return false;
	}
	if($('.storName').val() == "") {
		alert("창고명을 입력하세요.");
		$('.storName').focus();
		
		return false;
	}
	
	if(confirm("수정하시겠습니까?")) {
		return true;
	} else {
		return false;
	}
}

</script>
</head>
<body>

<jsp:include page="../inc/header2.jsp" />
<div class="div">
<br>
<h2> 창고수정 </h2>
<form action="${pageContext.request.contextPath }/mdm/storageupdatePro" method="post" onsubmit="return effecheck()" id="form">
<input type="hidden" name="storId" value="${storageDTO.storId}">
<table>
	<tr><td>창고코드 <span class="star">*</span></td>  <td><input type="text" name="storCode" class="storCode" value="${storageDTO.storCode}"></td></tr>
	<tr><td>창고명 <span class="star">*</span></td>  <td><input type="text" name="storName" class="storName" value="${storageDTO.storName}">
						<input type="hidden" name="industry" value="${storageDTO.itemCount}"></td></tr>
	<tr><td>창고유형</td> <td><select name="storType" id="storType">
						<option value="자재">자재</option>
						<option value="제품">제품</option>
						<option value="불량">불량</option>
					</select></td></tr>
	<tr><td>사용여부</td> <td><input type="radio" name="useYn" id="Y" value="Y" checked>Y
							<input type="radio" name="useYn" id="N" value="N">N</td>
							</tr>
<%-- 	<tr><td>수량</td> <td><input type="text" name="industry" value="${storageDTO.itemCount}" readonly></td></tr> --%>
	
</table>
<div id="cbutton">
	<input type="submit" value="수정" id="modify" class="modify">
	<button type="reset">초기화</button>

</div>
</form>
</div>
</body>
</html>