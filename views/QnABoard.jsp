<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
    <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <title>지식 Q&A 게시판</title>
	    <link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/QnABoard.css">
		<link rel="stylesheet" href="resources/css/common.css">
	    
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    	<div class="container">
    	<h3>지식 Q&A</h3>
    		<div class="outter">
    		
    			<div class="searchBar">
	    			<form action="fSearch" method="post">
			    		<input type="text" id="keyword" name="keyword" value=""/>
			    		<input type="hidden" id="category" name="category" value="question"/>
			    		<input type="submit" value="검색" onclick="fSearch()"/>
			    	</form>
		    	</div>
		    	
		    	<input type="button" value="질문하기" onclick="location.href='questionForm'"/>
    			<div class="inner">
			    	<div class="qnaList">
			    	<hr/>
			    		<table id="list">
			  
						</table>
			    	</div>			    	
    			</div>    			
    		</div>    		
    	</div> 	
    </body>
    <script>
 		var url;
 		var data = {};
 		
 		var msg = "${msg}";
 		if(msg != ""){
 			alert(msg);
 		}
 		
 		listCall();
 		
 	/* 	function fSearch(){
 			url = "./rest/fSearch"
 			data = {};
 			data.category = $("#cagegory").val();
 			data.keyword = $("#keyword").val();
 			ajaxCall(url,data);
 		} */
 		
 		function listCall(){
 			url = "./rest/QnAListCall"
 			data = {};
 			data.category = $("#category").val();
 			ajaxCall(url,data);
 		}
 		
 		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				data:reqData,
				dataType:'json',
				success:function(d){
					console.log(d.list);
					listDraw(d.list);
				},
				error:function(e){
					
				}
			});
		} 
 		
 		function listDraw(list){
			$("#list").empty();
			var content="";
			var hr = "";
			
			for(var i=0; i<list.length; i++){
				content+="<tr><td colspan='4'><td></tr>";
				content+="<tr>";
				content+="<td>"+list[i].hit+"<br/>투표</td>";
				content+="<td>"+list[i].comment_count+"<br/>답변</td>";
				content+="<td class='subject'><a href='./QnADetail?idx="+list[i].idx+"'>"
				+list[i].subject+"</a></td>";
				content+="<td>"+list[i].reg_date+"</td>";
				content+="<td>"+list[i].user_id+"</td>";
				content+="</tr>";
				content+="<tr class='underline'><td colspan='4'><td></tr>";
				
			}
			$("#list").append(content);
			
 		}
 		
 		
    </script>
</html>