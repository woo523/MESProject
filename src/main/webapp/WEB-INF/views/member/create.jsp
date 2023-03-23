<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<link href="/resources/css/table.css"  rel="stylesheet" type="text/css">
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

	function check(){
		if($('#id').val()==""){
			alert("아이디 입력하세요");
			$('#id').focus();
			return false;
		}
		$.ajax({
			url:'/login/idCheck',
			data:{id:$('#id').val()},
			type:"post",
			success:function(result){
				alert(result);
				alert(result.trim)
				if(result.trim()=="Y"){
					alert("이미 존재하는 아이디입니다.");
				}else{
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	};

 	


	   $(document).ready(function(){
	      $('#join').submit(function(){
	         
	    	 if(!valChk($("#mem_id"), "아이디")) return false;
	         if(!idChk($('#id').val())){
	            alert("아이디는 숫자4자로 입력하세요");
	            $('#id').focus();
	            return false;
	         }
	          if($('#pass').val()==""){
	                  alert("비밀번호는 6자이하로 입력해주세요");
	               $('#pass').focus();
	               return false;
	               }
	          if($('#name').val()==""){
	                  alert("이름을 입력하세요");
	               $('#name').focus();
	               return false;
	               }
	               
	               if($('#email').val()==""){
	                  alert("이메일을 입력하세요");
	               $('#email').focus();
	               return false;
	               }
	      });
	   });

	   function valChk(obj,alias) {
	 		if ($(obj).val() == "") {
	 			alert(alias+'을(를) 입력하세요.');
	 			$(obj).focus();
	 			return false;
	 		}else{
	 			return true;
	 		}
	 	}
 	
 	//아이디 체크
 	function idChk(val) {
 		var regExp = /^[0-4]*$/
 		return regExp.test(val); // 형식에 맞는 경우 true 리턴
 	}
 	
//  	//이메일 체크
//  	function emailChk(val) {
//  		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
//  		return regExp.test(val); // 형식에 맞는 경우 true 리턴
//  	}
 	
//  	//전화번호 체크
//  	function tellChk(val) {
//  		var regExp = /^\d{2,3}-?\d{3,4}-?\d{4}$/;
//  		return regExp.test(val); // 형식에 맞는 경우 true 리턴
//  	}
 	
//  	//휴대폰 체크
//  	function phoneChk(val) {
//  		var regExp = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
//  		return regExp.test(val); // 형식에 맞는 경우 true 리턴
//  	}
 	
 	
//  	//휴대폰번호 - 자동완성
//  	function autoHyphen(target) {
//  		target.value = target.value
// 		   .replace(/[^0-9]/g, '')
// 		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
 		
//  	}
 	
	



		
</script>
<!-- 스크립트 끝. -->

<div class="content_body">
	<!-- 내용시작 -->
<!-- 세션값 없으면 로그인화면으로 돌아가게 하는 것. -->
<c:if test="${empty sessionScope.id }">
	<c:redirect url="/login/login"></c:redirect>
</c:if>

	<form action="/member/insert" id="join" onsubmit="return joinChk();" method="post"  >
		<h1>‖ 사용자 등록 ‖</h1>
		<br>
		<br>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id" placeholder="아이디입력" maxlength="4"></td>
				<td><input type="button"  id="checkId" value="중복확인" onclick="check();"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" id="pass" placeholder="비밀번호" maxlength="6"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
				<td>부서</td>
				<td><input type="text" name="departments"  id="departments" placeholder="부서를 입력해주세요"></td>
			</tr>
			<tr>
				<td>직책</td>
				<td><input type="text" name="position" id="position" placeholder="직책을 입력해주세요"></td>
			</tr>
			<tr>
				<td>이메일주소</td>
				<td><input type="text" name="email" id="email" placeholder="예)email@naver.com"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tell" id="tell" placeholder="051-000-0000" maxlength="12"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone"  id="phone" placeholder="010-0000-0000" oninput="autoHyphen(this)" maxlength="13"></td>
			</tr>
			<tr>
				<td>사용여부</td>

				<td>
				<input type="radio" name="useYn" value="Y">사용 
				<input type="radio" name="useYn" value="N">미사용
				</td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
 
	</form>
	<!-- 내용끝 -->
</div>
<!-- 지우면안됨 -->
<!-- 헤더 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->