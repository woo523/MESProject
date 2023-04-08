<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp" %>
<style type="text/css">
table {

	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 1125px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	
}

th {
	text-align: center;
	background: #b9b9b9;
	font-weight: 700;
}


td, th {
	padding: 1em .5em;
	
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}
h2{
	text-align: center;
}

#con:hover{
	background-color : #e1e1e1;
}

#btn{
	width:1125px;
	text-align: right;
}


</style>
<script type="text/javascript">




function fnGetdata() {
 var obj = $("[name=menuCd]");
 var chkArray = new Array(); // 배열 선언

 $('input:checkbox[name=menuCd]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
     chkArray.push(this.value);
 });
 $('#menuCdValue').val(chkArray);
 
 var menuCd = $('#menuCdValue').val();
 var userId = ${memberDTO.userId};

 location.href="${pageContext.request.contextPath }/auth/update?menuCd="+menuCd+"&userId="+userId;


}



</script>
</head>
<body>
<div class="content_body">
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="${pageContext.request.contextPath }/login/login"></c:redirect>
</c:if>

<h1>권한 관리 [ ${memberDTO.name }님 ]</h1> <br><br>



<br>
<form action="${pageContext.request.contextPath }/auth/update?userId=${memberDTO.userId}" method="get">
<div id="btn"><input type="submit" value="권한 적용"></div>
<br>
<table border="1" id="main">
	
	<tr id="th"><th>상위메뉴</th>
					<th>하위메뉴</th>
					<th>권한</th>
							</tr>
	
<c:forEach items="${menulist }" var="dto"> 
					<tr id="con">
						<td>
						<c:if test="${dto.upperMenuCd eq 1 }">
						시스템관리						
						</c:if>
						<c:if test="${dto.upperMenuCd eq 2 }">
						기준정보 관리					
						</c:if>
						<c:if test="${dto.upperMenuCd eq 3 }">
						영업 관리				
						</c:if>
						<c:if test="${dto.upperMenuCd eq 4 }">
						생산 관리					
						</c:if>
						<c:if test="${dto.upperMenuCd eq 5 }">
						자재 관리					
						</c:if>
						</td>
						<td>${dto.menuNm }</td>

						<td><input type="checkbox" name="menuCd" id="${dto.menuCd}" value="${dto.menuCd}"></td>


					</tr>
				</c:forEach> 
				<input type="hidden" name="userId" value="${memberDTO.userId}">
    </table>
    </form>
    
<c:forEach items="${authlist }" var="adto"> 
<script type="text/javascript">
	var menu = "${adto.menuCd}";
	$("#"+menu).prop("checked", true);
</script>					
</c:forEach>
<br>
<br>



</div>

</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp" %>
</html>