<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MES주식회사</title>

<!-- 공통CSS-->
<link href="/resources/css/reset.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/style.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/jquery/jquery-ui.min.css" rel="stylesheet" type="text/css"  />
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap/bootstrap-datetimepicker.min.css"  media="screen">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon-32x32.png">

<!-- 공통JS-->
<script type="text/javascript" src="/resources/js/jquery/jquery-3.6.3.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery-ui-1.9.2.custom.js"></script>  
<script type="text/javascript" src="/resources/js/jquery/jquery-migrate-1.4.1.min.js"></script>  
<script type="text/javascript" src="/resources/js/jquery/jquery.cookie.js"></script> 
<script type="text/javascript" src="/resources/js/jquery/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap/bootstrap-datetimepicker.ko.js"></script>


<link href="/resources/css/table.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/common.css"  rel="stylesheet" type="text/css">
</head>
<body>

<script type="text/javascript">

	$(document).ready(function() {});
	function check(){
		if($('#cd').val()==""){
			alert("코드를 입력하세요");
			$('#cd').focus();
			return false;
		}
		$.ajax({
			url:'/comCode/comCheck',
			data:{cd:$('#cd').val() , cdGrp:$('#cdGrp').val()},
			type:"post",
			success:function(result){
				if(result.trim()=="Y"){
					alert("이미 사용중인 코드입니다.");
					$('#checkYn').val("N");
				}else{
					alert("사용가능한 코드입니다.");
					$('#checkYn').val("Y");
					$('#checkId').val($('#cd').val());
				}
			}
		})
	};
	function create() {
	if (!valChk($("#cd"), "코드")) return false;
	if (!valChk($("#cdNm"), "코드명")) return false;
	if (!valChk($("#sortNum"), "정렬순서")) return false;
	
	if ($('#checkYn').val() != "Y") {
		alert("코드 중복검사를 해주세요.");
		$('#cd').focus();
		return false;
	}

	if ($('#cd').val() != $('#checkId').val()) {
		alert("코드 중복검사를 해주세요.");
		$('#id').focus();
		return false;
	}
	$('#createForm').submit();
	
	}
	
	function valChk(obj, alias) {
		if ($(obj).val() == "") {
			alert(alias + '을(를) 입력하세요.');
			$(obj).focus();
			return false;
		} else {
			return true;
		}
	}
</script>





	<div class="container">
	<!-- 내용시작 -->
		
		
		<div class="content_body">	
			<h1>공통코드 - ${parentCdDTO.cdNm } 등록</h1> <br><br>
			
			<form action="/comCode/insert" id="createForm" method="post">
			<input type="hidden" name="insertId" id="insertId" value="${sessionScope.id }">
			<input type="hidden" name="checkYn" id="checkYn" value="N">
			<input type="hidden" name="checkId" id="checkId" value="">
			<input type="hidden" name="cdGrp" id="cdGrp" value="${parentCdDTO.cd }">
			<input type="hidden" name="mode" id="mode" value="POP">
				<table>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<th>코드</th>
						<td><input type="text" name="cd" id="cd" placeholder="코드를 입력하세요">
							<input type="button" class="ml10" id="checkId" value="중복확인" onclick="check();">
						</td>
					</tr>
					<tr>
						<th>코드명</th>
						<td><input type="text" name="cdNm" id="cdNm" placeholder="코드명을 입력하세요" ></td>
					</tr>
					<tr>
						<th>정렬순서</th>
						<td><input type="text" name="sortNum" id="sortNum" placeholder="정렬순서를 입력하세요" ></td>
					</tr>
					<tr>
						<th>사용여부</th>
						<td>
							<input type="radio" name="useYn" value="Y" checked>사용 
							<input type="radio" name="useYn" value="N">미사용
						</td>
					</tr>
					</tbody>
				</table><br><br>
				
				<div class="fr">
					<button type="button" class="btn" onclick="create();">등록</button>
					<button type="reset" class="btn">취소</button>
				</div>
				<div class="clear"></div>
		 		
			</form>
			
			
		</div>
	
	
	<!-- 내용끝 -->
	</div>
</body>
</html>