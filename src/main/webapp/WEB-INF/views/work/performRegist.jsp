<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">

	//searchResultColNames : 그리드 제목 행
	var searchResultColNames =  ['작업지시번호', '라인', '라인명', '품번', '품명', '지시상태', '지시일자', '지시수량', '수주번호', '업체'];
	
	// searchResultColModel : 그리드 안에 들어가는 데이터
	var searchResultColModel =  [
					  {name:'instrId',  	index:'insertId',   align:'center', width:'10%'},
	                  {name:'lineCd',  		index:'lineCd',  align:'center', width:'10%'},
	                  {name:'lineName',   		index:'lineName',    align:'center',   width:'10%'},
	                  {name:'itemNum',  		index:'itemNum',  align:'center', width:'10%'},
	                  {name:'itemName',	index:'itemName', align:'center', width:'10%'},
	                  {name:'workSts',   	index:'workSts',   align:'center', width:'10%'},
	                  {name:'workDate',   		index:'workDate',   align:'center', width:'10%'},
	                  {name:'workQty',   		index:'workQty',   align:'center', width:'10%'},
	                  {name:'ordNum',  	 	index:'ordNum',   align:'center', width:'10%'},
	                  {name:'ClientName',   		index:'ClientName',   align:'center', width:'10%'}];
	                  
  	//searchResultColNames : 그리드 제목 행
   	var searchResultColNames2 =  ['품번', '품번', '실적일', '양불여부', '실적수량', '불량사유'];
	              	
	// searchResultColModel : 그리드 안에 들어가는 데이터
	var searchResultColModel2 =  [
					  {name:'itemNum',  		index:'itemNum',  align:'center', width:'10%'},
         			  {name:'itemName',	index:'itemName', align:'center', width:'10%'},
         			  {name:'performDate',  	index:'performDate',   align:'center', width:'10%'},
 		              {name:'gbYn',  		index:'gbYn',  align:'center', width:'10%', editable: true},
   	            
   	                 
   	                  {name:'performQty',   	index:'performQty',   align:'center', width:'10%', editable: true},
   	                  {name:'dbReason',   		index:'dbReason',   align:'center', width:'10%', editable: true}

	                  
	                ]; // name = dto변수명 index = 그리드에서 사용할 이름? , 옵션은 검색해서 사용
	$(function() { 
//		document.ready 와 같은 기능
//		DOM(Document Object Model)이 완전히 불러와지면 실행되는 Event
//		페이지가 생길때 function안에 내용을 실행
	  searchData();
	 
		
	  $("#mainGrid").dblclick(function(){
		
	
//  		 	$("#subGrid").html('');

 		 	var selectedRowId =  $("#mainGrid").getGridParam('selrow');	
			var row = $("#mainGrid").getRowData(selectedRowId);
			var name  =  row.instrId;

			
			function searchData2() { //그리드에 뿌려줄 데이터 조회용

				  $("#subGrid").jqGrid({
				    url : "/PerformRg", // url주소
				    datatype : "json", // 데이터타입
				    postData : {"instrId" : name},	// 작업지시번호를 넘겨주고 작업지시번호에 해당되는 데이터만 들고옴
				    mtype : "get", // get,post방식
				    colNames: searchResultColNames2, //위에 설정한 그리드 제목 행 틀
				    colModel: searchResultColModel2, //위에 설정한 그리드 안에 들어가는 데이터 틀
				    rowNum : 10, // 줄 개수 (보여줄 데이터 개수) 
				    pager: "#pager2", // 페이징할 div id
				    height: 50,
				    width: 1019,
				    jsonReader : {repeatitems:false},
				    cellEdit: true,
				    multiselect:true

				  }); // $("#subGrid").jqGrid
				  
			}
			
			searchData2();			


	});	//$("#mainGrid").dblclick(function()
			
	});//fuction()
	
	function addNewRow() {
		   // 입력 폼을 포함하는 새 행을 만듭니다.
	    var newRowId = "newRow_" + ($.jgrid.guid++); // 새 행의 ID를 생성합니다.
   		var $newRow = $("<tr>", { id: newRowId }); // 새 tr 요소를 만듭니다.

	   // 각 셀에 입력 폼을 추가합니다.
   		$newRow.append($("<td>").html("<input type='text' name='itemNum'>"));
   		$newRow.append($("<td>").html("<input type='text' name='itemName'>"));
   		$newRow.append($("<td>").html("<input type='text' name='performDate'>"));
   		$newRow.append($("<td>").html("<input type='text' name='gbYn'>"));
   		$newRow.append($("<td>").html("<input type='text' name='performQty'>"));
   		$newRow.append($("<td>").html("<input type='text' name='dbReason'>"));
   		
   		
		   var newRowData = {
			"itemNum" :"","itemName" :"","performDate" :"","gbYn" :"","performQty" :"","dbReason" :""
		   };
		 
		   // 새 행을 그리드에 추가합니다.
		   $("#subGrid").jqGrid('addRowData', 'newRowId', newRowData);
		 
		   // 추가된 새 행을 편집할 수 있도록 에디트 모드로 전환합니다.
		   $("#subGrid").jqGrid('editRow', 'newRowId', true);
		   
		   
		}
	

	
	function searchData() { //그리드에 뿌려줄 데이터 조회용

		  $("#mainGrid").jqGrid({ // "#mainGrid" == <table id="mainGrid">
		    url : "/InstruList", // url주소
		    datatype : "json", // 데이터타입
// 		    postData : "",	// 넘겨줄데이터->넘겨줄게 없어서 ""공백. 검색어를 넣어준다.
		    mtype : "get", // get,post방식
		    colNames: searchResultColNames, //위에 설정한 그리드 제목 행 틀
		    colModel: searchResultColModel, //위에 설정한 그리드 안에 들어가는 데이터 틀
		    rowNum : 10, // 줄 개수 (보여줄 데이터 개수) 
		    pager: "#pager", // 페이징할 div id
		    height: 50,
		    width: 1019,
		    jsonReader : {repeatitems:false}

		  }); // 옵션은 검색해서 사용.
	}
	
	
	

	
	
	function save() {
		
		   alert("저장되었습니다.");
		   // 새 행의 각 셀에서 데이터를 가져옵니다.
		   location.href="/pefSave"
		   
		}
	




	

</script>
<!-- 스크립트 끝. -->


<div class="content_body"> <!-- 지우면안됨 -->
	<!-- 내용시작 -->

	<h2>실적등록</h2>
	
	<br><br><br>
	
	<!-- 그리드를 생성할 테이블 -->
	<table id="mainGrid"></table> <!-- 지우면 안됨 -->
	
	<!-- 그리드 페이징을 생성할 div -->
	<div id="pager"></div> <!-- 지우면 안됨 -->
	
</div>
<div class="content_body">
	<h2>생산실적</h2>
	
	<br><br><br>
	<button id="add" onclick="addNewRow()">추가</button>
	<button>삭제</button>
	<button id="cancel">취소</button>
	<form action="/pefSave">
	

	<input type="submit" value="저장">
	
	<table id="subGrid"></table> 
	</form>
	<div id="pager2"></div>










	<!-- 내용끝 -->
</div><!-- 지우면안됨 -->
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
