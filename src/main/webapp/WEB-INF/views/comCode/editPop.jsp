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

	$(document).ready(function() {
	
	
	});

	function edit() {
	$('#editForm').submit();
	}
	
</script>





	<div class="container">
	<!-- 내용시작 -->
		
		
		<div class="content_body">	
			<h1>‖ 공통코드 - ${parentCdDTO.cdNm } 수정 ‖</h1> <br><br>
			
			<form action="/comCode/update" id="editForm" method="post">
			<input type="hidden" name="updateId" id="updateId" value="${sessionScope.id }">
			<input type="hidden" name="cdGrp" id="cdGrp" value="${dto.cdGrp }">
			<input type="hidden" name="mode" id="mode" value="POP">
				<table>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<th>코드</th>
						<td><input type="text" name="cd" id="cd" value="${dto.cd }" readonly></td>
					</tr>
					<tr>
						<th>코드명</th>
						<td><input type="text" name="cdNm" id="cdNm" value="${dto.cdNm }" ></td>
					</tr>
					<tr>
						<th>정렬순서</th>
						<td><input type="text" name="sortNum" id="sortNum" value="${dto.sortNum }" ></td>
					</tr>
					<tr>
						<th>사용여부</th>
						<td>
							<input type="radio" name="useYn" value="Y" <c:if test="${dto.useYn eq 'Y'}">checked</c:if>>사용 
						<input type="radio" name="useYn" value="N"<c:if test="${dto.useYn eq 'N'}">checked</c:if>>미사용
						</td>
					</tr>
					</tbody>
				</table><br><br>
				
				<div class="fr">
					<button type="button" class="btn" onclick="edit();">등록</button>
					<button type="reset" class="btn">취소</button>
				</div>
				<div class="clear"></div>
		 		
			</form>
			
			
		</div>
	
	
	<!-- 내용끝 -->
	</div>
</body>
</html>