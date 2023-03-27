<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <header> -->
	<jsp:include page="../inc/header.jsp" />
<!-- </header> -->

<div class="content_body">
<article>
	<h2>자재재고현황</h2>
	<form id="materSearch">
		<div class="selectButtons">
			<button type="submit" id="submit">조회</button>
		</div>
		
		<table class="searchBox">
			<tr>
				<td>자재유형</td>
				<td><select name="materType">
						<option value="" selected>전체</option>
						<option value="1">자재 1</option>
						<option value="2">자재 2</option>
						<option value="3">자재 3</option>
					</select></td>
			<tr>
				<td>품번</td>
					<td><input type="text" name="pcd" id="pcd" class="form-control" placeholder="품번코드" onclick="openilist()"></td>
					<td><input type="text" name="pnm" id="pnm" class="form-control" placeholder="품번명" readonly></td>
			</tr>
	</table>
</form>
</article>
</div>
</body>
</html>