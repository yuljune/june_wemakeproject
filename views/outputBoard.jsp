<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="resources/twbsPagination.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="resources/css/common.css">
		<link rel="stylesheet" href="resources/css/detail.css?var=1">
		<link rel="stylesheet" type="text/css" href="./resources/css/default.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/layout.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/member.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/modal_popup.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/select.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/sub.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/business.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/mypage.css">
	    <link rel="stylesheet" type="text/css" href="./resources/css/project.css">
		<title>결과물 게시판</title>
		<style>
			.date,.hit{
                color: #929292;
            }
            .writer{
                color: #F7703E;
            }
            .link{
            	display:block;
            	width:100%;
            	height:100%;
            	text-decoration: none;
            }
            #page{
            	font-size: 40px;
            	text-align: center;
            	font-family: 'NanumBarunGothic', 'Nanum Gothic', '돋움', Dotum, sans-serif;
            	font-weight: 700;
            	color: #BDC6B7;
            }
            #write{
            	font-size: 18px;
            	float: right;
            	margin-right: 30px;
            	padding: 3px;
            	margin-bottom:-30px;
            	font-family: 'NanumBarunGothic', 'Nanum Gothic', '돋움', Dotum, sans-serif;
            }
            #count{
            	font-size: 15px;
            	margin-left: 15px;
            	font-family: 'NanumBarunGothic', 'Nanum Gothic', '돋움', Dotum, sans-serif;
            }
            #pageperNum{
            	font-size: 15px;
            	font-family: 'NanumBarunGothic', 'Nanum Gothic', '돋움', Dotum, sans-serif;
            }
		</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<p id="page">Output Project</p>
	<br/><br/><br/><br/>
	
	<!-- <span id="count">보여줄 게시물 수:</span>

	<select id="pagePerNum">
		<option value="6">6개</option>
		<option value="12">12개</option>
		<option value="18">18개</option>
		<option value="24">24개</option>
	</select> -->
	<c:if test="${!empty sessionScope.loginId}">
	<a id="write" class="boardBtn01" onclick="location.href='outputWriteForm?user_id=${sessionScope.loginId}'">글쓰기</a>
	</c:if>
	<br/><br/>
	
	<!-- <table>
		<thead>
			<tr id="outputHead">
				<th>NO</th>
				<th>메인 이미지</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="list">
			리스트가 출력될 영역
		</tbody>
	</table> -->
	
	<div id="list">
			<!-- 리스트가 출력될 영역 -->
	</div>
	
	<table>
		<tr>
			<td colspan="6">
			<div class="container taeanan">
			    <nav aria-label="Page navigation" style="text-align:center">
			        <ul class="pagination" id="pagination"></ul>
			    </nav>
			</div>
			</td>
		</tr>
	
	</table>	

	</body>
	<script>
	var showPage = 1;
	var url;
	var data;
	
	var msg = "${msg}";
	if(msg !=""){
		alert(msg);
	}
	
	
	outputListCall(showPage);
	
	$("#pagePerNum").change(function(){
		outputListCall(showPage);
	});
	
	function outputListCall(page){
		url="./output/outputListCall"
		data={};
		data.page = page;
		data.pagePerNum = 6;
		ajaxCall(url,data);
	}
	
	/*
	function del(idx){
		url="./output/del";
		data={};
		data.idx = idx;
		ajaxCall(url,data);
	}
	*/
	
	/*
	function mainFileUp(idx){
		url="./output/mainFileUp";
		data={};
		data.idx = idx;
		ajaxCall(url,data);
		
	}
	*/
	
	function ajaxCall(reqUrl, reqData){
		console.log(reqUrl, reqData);
		$.ajax({
			url:reqUrl,
			type:"post",
			data:reqData,
			dataType:"json",
			success:function(d){				
				if(reqUrl=="./output/outputListCall"){
					console.log("총 보여줄 페이지 : "+d.range);
					showPage = d.currPage;
					listPrint(d.list);
					$('#pagination').twbsPagination({
						startPage: d.currPage,	//시작 페이지
						totalPages: d.range,	//총 페이지 갯수
						visiblePages: 6,	//보여줄 페이지 수
						onPageClick: function (event, page) {
							console.log(event);
							console.log(page);
							outputListCall(page);
						}
					});
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	//var path = D:/lecture/Spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/RealProject/resources/upload/; 
	
	var fileMap={};
	<c:forEach items="${files}" var="list">
		fileMap["${list.new_file}"];
	</c:forEach>
	
	console.log(fileMap);
	
	//리스트 그리기
	function listPrint(list){			
		var content="";					
		for(var i=0; i<list.length; i++){
			
	
			content+="<div style='position:relative; float:left; padding:10px; width:33%;"
					+"height:390px; margin:20 2px;'>";
			content+="<a class='link' href='./outputDetail?idx="+list[i].idx+"'>";
			content+="<span>NO."+list[i].idx+"</span><br/>";
			content+="<img src='./resources/upload/"+list[i].new_file+"' width=390px height=280px/><br/><br/>";
			content+="<span class='title'>title | "+list[i].subject+"</span><br/>";
			content+="<span class='writer'>writer | "+list[i].user_id+"</span><br/>";
			content+="<sapn class'date'>date | "+list[i].reg_date+"</span><br/>";
			content+="<span class='hit'>hit | "+list[i].hit+"</span>";
			content+="</a>";
			content+="</div>";
			
			
			/*
			content+="<tr>";
			content+="<td>"+list[i].idx+"</td>";
			content+="<td>";
			content+="<img src='./resources/upload/"+list[i].new_file+"' width=200px/>";
			//content+="<img src = '<c:url value='upload/"+list[i].new_file+"'/>'/>"
			console.log(list[i].new_file);
			content+="</td>";
			content+="<td>";
			
			//if(list[i].fileName !=null){
			//	content +="<img width='15px' src='resources/img/default.png'/>";
			//}
			
			content+="<a href='./outputDetail?idx="+list[i].idx+"'>"
					+list[i].subject+"</a></td>";
			content+="<td>"+list[i].user_id+"</td>";
			content+="<td>"+list[i].reg_date+"</td>";
			content+="<td>"+list[i].hit+"</td>";
			content+="</tr>";
			*/
		}					
		$("#list").empty();
		$("#list").append(content);			
	}
	</script>
</html>