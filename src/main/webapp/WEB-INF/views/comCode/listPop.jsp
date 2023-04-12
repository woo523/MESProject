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


<link href="/resources/css/tablelist.css"  rel="stylesheet" type="text/css">
<link href="/resources/css/common.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
function delComCd(cdGrp,cd) {
	if(confirm("정말 삭제하시겠습니까?")){
		$("#deleteForm #cdGrp").val(cdGrp); // ("#deleteForm #id" : deleteForm이라는 이름의 form의 id값만 가져온다 / val(memId) == function delMember(memId) 
		$("#deleteForm #cd").val(cd);
		$("#deleteForm").submit(); // deleteForm을 전송한다.
	}
}
</script>
<!-- 스크립트 끝. -->
</head>
<body>
	<div class="container">
	<!-- 내용시작 -->
		
		
		<div class="content_body">	
			<h1>공통코드 - ${parentCdDTO.cdNm } 조회</h1> <br><br>
			
			<table>
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
					<th>코드</th>
					<th>코드명</th>
					<th>정렬순서</th>
					<th>사용여부</th>
					<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${fn:length(comCodeList) eq 0}">
						<tr>
							<td colspan="5">결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${comCodeList }" var="dto" varStatus="i" > 
					<!-- 반복문. items=컨트롤러.model에서 넣어준 값(리스트가 받아올 배열이름) / var=for문 내부에서 사용할 변수 / varStatus = 상태용 변수 -->
						<tr>
							<td>${dto.cd }</td>
							<td><a href="/comCode/editPop?cdGrp=${dto.cdGrp }&cd=${dto.cd}">${dto.cdNm }</a></td>
<%-- 							<td><a href="/comCode/editPop?cd=${dto.cd }">${dto.cdNm }</a></td> --%>
							<td>${dto.sortNum }</td>
							<td>${dto.useYn }</td>
							<td><button type="button" class="sm_btn" onclick="delComCd('${dto.cdGrp }','${dto.cd }');">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody> 	
			</table>
			<br><br>
			
			<div class="fr">
			<button type="button" class="btn" onclick="location.href='/comCode/createPop?cdGrp=${parentCdDTO.cd }'">등록</button>
			</div>
			<div class="clear"></div>
			
	
			<form name="deleteForm" id="deleteForm" action="/comCode/delete"  method="POST">
			 	<input type="hidden" id="cdGrp" name="cdGrp" value="">
			 	<input type="hidden" id="cd" name="cd" value="">
			 	<input type="hidden" id="mode" name="mode" value="POP">
			</form>
		</div>
	
	
	<!-- 내용끝 -->
	</div>
</body>
</html>