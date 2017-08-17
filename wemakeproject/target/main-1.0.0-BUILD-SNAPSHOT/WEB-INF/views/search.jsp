<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
    <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <script src="resources/twbsPagination.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
	    <title>Insert title here</title>
	    <link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/search.css">
		<link rel="stylesheet" href="resources/css/common.css">
    
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    <input type="hidden" id="category" name="category" value="question"/>
    	<div class="containerBox">
    	<h3>지식 Q&A</h3>
    		<div class="outterBox">
    			
    			<div class="searchBar">
	    			<form action="fSearch" method="post">
			    		<input type="text" id="keyword" name="keyword" value="${keyword }"/>
			    		<input type="hidden" id="category" name="category" value="question"/>
			    		<input type="submit" value="검색" onclick="fSearch()"/>
			    	</form>
		    	</div>
    		
    			<select id="pagePerNum">
					<option value="10">10개</option>
					<option value="15">15개</option>
					<option value="20">20개</option>
					<option value="25">25개</option>
				</select>
				
    			<div class="innerBox">
    			
    				<div class="contentBox">
    					<hr/>
    					<table class="board">
							<thead>
								<tr>
									<th class="notsub">추천</th>
									<th class="notsub">답변</th>
									<th>제목</th>
									<th class="notsub">작성자</th>
									<th class="notsub">작성일</th>
								</tr>
							</thead>
							<tbody id="list">
								<!-- 리스트가 출력될 영역 -->
							</tbody>
							<tr>
								<td colspan="5">
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
	
		keywordListCall(showPage);
		
		$("#pagePerNum").change(function(){
			keywordListCall(showPage);
		});
		function keywordListCall(page){
 			url = "./rest/keywordListCall"
 			data = {};
 			data.page = page;
 			data.pagePerNum = $("#pagePerNum").val();
 			data.category = $("#category").val();
 			data.keyword = $("#keyword").val();
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
 					if(reqUrl=="./rest/keywordListCall"){
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
 								keywordListCall(page);
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
 				content+="<tr><td colspan='5'><td></tr>";
				content+="<tr>";
				content+="<td>"+list[i].hit+"<br/>투표</td>";
				content+="<td>"+list[i].comment_count+"<br/>답변</td>";
				content+="<td class='subject'><a href='./QnADetail?idx="+list[i].idx+"'>"
				+list[i].subject+"</a></td>";
				content+="<td>"+list[i].reg_date+"</td>";
				content+="<td>"+list[i].user_id+"</td>";
				content+="</tr>";
				content+="<tr class='underline'><td colspan='5'><td></tr>";
 				/* content+="<tr>";
 				content+="<td>"+list[i].hit+"</td>";
 				content+="<td>"+list[i].comment_count+"</td>";
 				content+="<td>";
 				content+="<a href='./QnADetail?idx="+list[i].idx+"'>"
 						+list[i].subject+"</a> </td>";
 				content+="<td>"+list[i].user_id+"</td>";
 				content+="<td>"+list[i].reg_date+"</td>";
 				content+="</tr>"; */
 			}						
 			$("#list").empty();
 			$("#list").append(content);			
 		}
			
    </script>
</html>