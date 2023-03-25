<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h2>
품번 조회
</h2>
<form>
<table>
<tr><td>품번</td><td><input type="text" name="itemNum"></td><td>품명</td><td><input type="text" name="itemName"></td><td><input type="submit" value="조회"></td></tr>
</table>
</form>
<table>
<tr><td>품번</td><td>품명</td></tr>
<c:forEach var="itemList" items="${itemList }">
<tr onclick="selectItem('${itemList.itemNum }','${itemList.itemName }')"><td>${itemList.itemNum }</td><td>${itemList.itemName }</td></tr>

    <script type="text/javascript">

        function selectItem(a,b){ // 부모창으로 값 넘기기

          opener.document.getElementById("pcd").value = a 
          opener.document.getElementById("pnm").value = b
          window.close();

        }

   </script>

</c:forEach>
</table>
</body>
</html>