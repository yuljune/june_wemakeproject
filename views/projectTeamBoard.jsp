<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="resources/js/twbsPagination.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	    <style>
	    	.listView{
	    		width: 80%;
	    		margin:auto;
	    		margin-top: 70px;
	    	}
	    	.bbsListA{
	    		margin:auto;
	    		height: 50%;
	    	}
	    	th {
			    text-align: center;
			    border: 1px solid black;
			    border-left-style: none;
			    border-right-style: none;
			    font-size: 17px;
			    font-family: sans-serif;
			    font-weight: bold;
			}
			td{
			    padding: 0;
			    text-align: center;
			    border: 1px solid gray;
			    border-left-style: none;
			    border-right-style: none;
			    font-size: 15px;
			    font-family: sans-serif;
			}
			.ldk{
				height: 80px;
			}
			.dkdk{
				font-size: 30px;
				font-family: sans-serif;
				font-weight: bold;
				color: steelblue;
			}
			.boardBtn15{
				width:100px;
			}
			.container{
				position: relative;
			}
			.movedk{
				display: inline-block;
			    margin: auto;
			    float: right;
			    margin-bottom: 10px;
			}
			a{
				font-weight: lighter;
			}
			.tltdk{
				    font-family: sans-serif;
   					font-weight: 600;
			}
	    </style>
	</head>
	<body>	
	<jsp:include page="header.jsp"/>
	<!-- <select id="pagePerNum">
		<option value="5">5개</option>
		<option value="10">10개</option>
		<option value="15">15개</option>
		<option value="20">20개</option>
	</select> -->	
	<input type="hidden" name="project_idx" id="project_idx" value="${project_idx}"/>
	
	<div class="listView">
		<table class="bbsListA" summary="팀 게시판">
			<span class="dkdk">팀 게시판 목록</span>
			<div class="movedk">
			<a class="boardBtn15" onclick="location.href='teamWriteForm?user_id=${sessionScope.loginId}&project_idx=${project_idx}'">글쓰기</a>
            <a class="boardBtn15" onclick="popup();">팀 채팅방</a>
			</div>
			<colgroup>
				<col width="8%">
				<col width="47%">
				<col width="10%">
				<col width="12%">
			</colgroup>
			<thead>
				<tr class="ldk">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="list">
				<!-- 리스트가 출력될 영역 -->
			</tbody>
			
			<tr>
			<td colspan="4">
			<div class="container">
			    <nav aria-label="Page navigation" style="text-align:center">
			        <ul class="pagination" id="pagination"></ul>
			        
			    </nav>
			</div>
			</td>
		</tr>
		</table>
	</div>
	</body>
	<script>
	var showPage = 1;
	var url;
	var data;
	var msg = "${msg}";
	if(msg !=""){
		alert(msg);
	}
        
    //채팅방 팝업
	function popup(){
		window.open("webForm?project_idx="+${project_idx}+"","chat","width=400,height=300");
	}
	
	listCall(showPage);
	
	$("#pagePerNum").change(function(){
		listCall(showPage);
	});

	function listCall(page){
		url="./membershipController/listCall"
		data={};
		data.idx = $("#project_idx").val();
		data.page = page;
		data.pagePerNum = 10;
		ajaxCall(url,data);
	}
	
	function del(idx){
		url="./membershipController/del";
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
				if(reqUrl=="./membershipController/listCall"){
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
							listCall(page);
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
			content+="<input type='hidden' value='"+list[i].project_idx+"'/>";
			content+="<td>"+list[i].tb_idx+"</td>";
			content+="<td>";
			content+="<a class='tltdk' href='./teamDetail?idx="+list[i].tb_idx+"'>"
					+list[i].tb_subject+"</a></td>";
			content+="<td>"+list[i].writer+"</td>";
			content+="<td>"+list[i].reg_date+"</td>";
			content+="</tr>";
		}						
		$("#list").empty();
		$("#list").append(content);			
	}
	</script>
</html>