<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
    <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <script src="resources/js/twbsPagination.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
	    <title>공지사항</title>
	    <link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/noticeBoard.css">
		<link rel="stylesheet" href="resources/css/common.css">
	    
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    	<input type="hidden" id="cagegory" value="notice"/>
    	<div class="containerBox">
    	<h3>공지사항</h3>
    			<input type="button" id="all" value="전체보기" onclick="location.href='noticeBoard' "/>
    			<input type="button" id="notice" value="공지사항" onclick="location.href='jNoticeBoard' "/>
    			<input type="button" id="exhibit" value="공모전" onclick="location.href='exhibitBoard' "/><br/>
    			<br/>
    		<div class="outterBox">

		    	
    			<div class="innerBox">
    			
			    	<div class="noticeList">
			    	<hr/>
			    	<c:if test="${sessionScope.loginId eq 'admin' }">
			    		<input type="button" value="공지사항 쓰기" onclick="location.href='noticeForm'"/><br/><br/>
			    	</c:if>
			    	
		    			<table class="board">
							<thead>
								<tr>
									<th class="notsub">번호</th>
									<th class="notsub">구분</th>
									<th class="subtd">제목</th>
									<th class="notsub">작성자</th>
									<th style="width:100px; ">작성일</th>
									<th class="notsub">조회</th>
								</tr>
							</thead>
							<tbody id="list">
								<!-- 리스트가 출력될 영역 -->
							</tbody>
							<tr>
								<td colspan="6">
								<div class="container">
								    <nav aria-label="Page navigation" style="text-align:center">
								        <ul class="pagination" id="pagination"></ul>
								    </nav>
								</div>
					
								</td>
							</tr>
						</table>
			    	</div>			    	
    			</div>    			
    		</div>    		
    	</div> 	
    </body>
    <script>
  		var showPage = 1;
 		var url;
 		var data = {};
 		
 		var msg = "${msg}";
 		if(msg != ""){
 			alert(msg);
 		}
 		
 		var category = "";
 		
 		showExhibit();
 		
 		//공지사항만 보기
		function showNotice(){
 			category = "공지사항";
 			conditionCall(showPage);
 		}
 		//공모전만 보기
		function showExhibit(){
			category = "공모전";
			conditionCall(showPage);
		}
 		
		$("#pagePerNum").change(function(){
			listCall(showPage);
		});
 		
 		function listCall(page){
 			url = "./rest/NoticeListCall";
 			data = {};
 			data.page = page;
 			data.pagePerNum = 10;
 			ajaxCall(url,data);
 		}
 		function conditionCall(page){
 			url = "./rest/conditionCall";
 			data = {};
 			data.page = page;
 			data.pagePerNum = 10;
 			data.category = category;
 			ajaxCall(url,data);
 		}
 		
 		
 		function del(idx){
 			url="./rest/del";
 			data={};
 			data.idx = idx;
 			ajaxCall(url,data);
 		}
 		
 		function ajaxCall(reqUrl, reqData){
 			console.log(reqUrl, reqData);
 			$.ajax({
 				url:reqUrl,
 				type:"post",
 				data:reqData,
 				dataType:"json",
 				success:function(d){				
 					if(reqUrl=="./rest/NoticeListCall"){
 						console.log("총 보여줄 페이지 : "+d.range);
 						showPage = d.currPage;
 						listPrint(d.list);

 						$('#pagination').twbsPagination({
 							startPage: d.currPage,	//시작 페이지
 							totalPages: d.range,	//총 페이지 갯수
 							visiblePages: 5,	//보여줄 페이지 수
 							onPageClick: function (event, page) {
 								//console.log(event);
 								//console.log(page);
 								listCall(page);
 							}
 						});
 					}
 					
 					if(reqUrl == "./rest/del"){
 						console.log(d.success);
 						if(d.success==1){
 							alert("삭제 되었습니다.");
 							listCall(showPage);
 						}else{
 							alert("삭제에 실패 하였습니다.");
 						}
 					}
 					
 					if(reqUrl=="./rest/conditionCall"){
 						console.log("총 보여줄 페이지 : "+d.range);
 						showPage = d.currPage;
 						listPrint(d.list);

 						$('#pagination').twbsPagination({
 							startPage: d.currPage,	//시작 페이지
 							totalPages: d.range,	//총 페이지 갯수
 							visiblePages: 5,	//보여줄 페이지 수
 							onPageClick: function (event, page) {
 								console.log(event);
 								console.log(page);
 								conditionCall(page);
 							}
 						});
 					}
 				},
 				error:function(e){
 					console.log(e);
 				}
 			});
 		}
 		
 		//리스트 그리기
 		function listPrint(list){			
 			var content="";					
 			for(var i=0; i<list.length; i++){
 				content+="<tr>";
 				content+="<td>"+list[i].idx+"</td>";
 				content+="<td>"+list[i].category+"</td>";
 				content+="<td>";
 				content+="<a href='./noticeDetail?idx="+list[i].idx+"'>"
 						+list[i].subject+"</a> </td>";
 				content+="<td>"+list[i].user_id+"</td>";
 				content+="<td>"+list[i].reg_date+"</td>";
 				content+="<td>"+list[i].hit+"</td>";	
 				content+="</tr>";
 			}						
 			$("#list").empty();
 			$("#list").append(content);			
 		}
 		
 		
    </script>
</html>