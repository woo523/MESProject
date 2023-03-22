<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
    
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

//searchResultColNames : 그리드 제목 행
var searchResultColNames = ['출하번호','출하일자','등록자','등록일','변경자','변경일','품번','품명','단위','바코드','수주번호','수주량','출하량'];

// searchResultColModel : 그리드 안에 들어가는 데이터
var searchResultColModel = [
			{name:'shipNum',  	index:'shipNum',  	align:'center', width:'10%'},
			{name:'shipDt',  	index:'shipDt',  	align:'left', width:'10%'},
			{name:'insertId',  	index:'insertId',  	align:'center', width:'10%'},
			{name:'insertDt',  	index:'insertDt',  	align:'center', width:'10%'},
			{name:'updateId',  	index:'updateId',  	align:'center', width:'10%'},
			{name:'updateDt',  	index:'updateDt',  	align:'center', width:'10%'},
			{name:'itemNum',  	index:'itemNum',  	align:'center', width:'10%'},
			{name:'itemNm',  	index:'itemNm',  	align:'center', width:'10%'},
			{name:'invntUnit',  	index:'invntUnit',  	align:'center', width:'10%'},
			{name:'barcord',  	index:'barcord',  	align:'center', width:'10%'},
			{name:'seqNum',  	index:'seqNum',  	align:'center', width:'10%'},
			{name:'ordQty',  	index:'ordQty',  	align:'center', width:'10%'},
			{name:'shipQty',  	index:'shipQty',  	align:'center', width:'10%'}
];

$(function() { 
	
  searchData();
  
});	


function searchData() { //그리드에 뿌려줄 데이터 조회용

	  $("#mainGrid").jqGrid({ // "#mainGrid" == <table id="mainGrid">
	    url : "/ship/shipList", // url주소
	    datatype : "JSON", // 데이터타입
	    postData : "",	// 넘겨줄데이터->넘겨줄게 없어서 ""공백. 검색어를 넣어준다.
	    mtype : "POST", // get,post방식
	    colNames: searchResultColNames, //위에 설정한 그리드 제목 행 틀
	    colModel: searchResultColModel, //위에 설정한 그리드 안에 들어가는 데이터 틀
	    rowNum : 10, // 줄 개수 (보여줄 데이터 개수) 
	    pager: "#pager", // 페이징할 div id
	    height: 261,
	    width: 1019
	  }); // 옵션은 검색해서 사용.
}

</script>
<!-- 스크립트 끝. -->


<div class="content_body"> <!-- 지우면안됨 -->
	<!-- 내용시작 -->

	<h2>샘플메뉴</h2>
	
	<br><br><br>
	
	<!-- 그리드를 생성할 테이블 -->
	<table id="mainGrid"></table> <!-- 지우면 안됨 -->
	
	<!-- 그리드 페이징을 생성할 div -->
	<div id="pager"></div> <!-- 지우면 안됨 -->



	<!-- 내용끝 -->
</div><!-- 지우면안됨 -->



<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->

