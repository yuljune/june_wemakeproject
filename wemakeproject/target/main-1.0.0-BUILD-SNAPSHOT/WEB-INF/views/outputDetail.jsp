<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="icon" href="resources/img/icon.png">
		<title>Insert title here</title>
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
	    <style type="text/css">
	    	.viewPage{
	    		margin: auto;
	    		font-weight: bold;
	    	}
	    	.dkdk{
			    	font-size: 30px;
				    font-family: sans-serif;
				    font-weight: bold;
				    color: steelblue;
				    float: left;
				    margin-bottom: 50px;
			}
			.ldk{
				width: 80%;
				margin: auto;
				margin-top: 100px;
			}
			.viewTlt{
				border-left-style: none;
			}
			.bbsViewA > thead > tr > th span.division {
			    padding-left: 15px;
			    margin-right: 15px;
			    background: url(./resources/img/icon_view_arrow.png) left center no-repeat;
			    color: #222;
			}
			.leeduck{
				border-left-style: hidden;
   				border-right-style: hidden;
			}
			.duckki{
				border-top-style: 1px solid gray;
			}
			.taean{
				width:100px;
			}
			img{
				width: 60%;
				
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		<div class="ldk">
		<span class="dkdk">결과물 게시판 글</span>
		<div class="viewPage">
			<table class="bbsViewA" summary="팀게시판 글 상세보기">
				<caption>게시물</caption>
				<colgroup>
					<col width="13%">
					<col width="37%">
					<col width="9%">
					<col width="16%">
					<col width="9%">
					<col width="16%">
				</colgroup>
				<thead>
					<tr>
						<th colspan="6" class="viewTlt leeduck">${detail.subject}</th>
					</tr>
					<tr>
						<th>
							<span class="division leeduck taean">작성자</span>
						</th>
						<td class="leeduck">
							${detail.user_id}
						</td>
						<th>
							<span class="division leeduck taean">조회수</span>
						</th>
						<td class="leeduck">
							${detail.hit}
						</td>
						<th class="leeduck">
							<span class="division leeduck taean">등록일</span>
						</th>
						<td class="leeduck">
							${detail.reg_date}
						</td>	
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="cont leeduck" colspan="6">
							${detail.content}
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btnRight mgb45">
				<a class="boardBtn01" id="menu" onclick="location.href='./outputBoard'">목록</a>
					<c:if test="${sessionScope.loginId eq detail.user_id}">
						<a class="boardBtn01" type="button" onclick="location.href='./outputUpdateForm?idx=${detail.idx}'">수정</a>
						<a class="boardBtn01" type="button" onclick="del(${detail.idx})">삭제</a>
					</c:if>
			</div>
					</div>
		</div>
		
		
		<%-- <table class="board">
			<tr>
				<td>글번호</td>
				<td id="idx">${detail.idx}</td>
				<td>작성자</td>
				<td>${detail.user_id}</td>
				<td>조회수</td>
				<td>${detail.hit}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="5">
					${detail.subject}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5">
					${detail.content}
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<input type="button" onclick="location.href='./outputBoard'" value="목록보기"/>
					<input class="dis" type="button" onclick="location.href='./outputUpdateForm?idx=${detail.idx}'" value="수정하기"/>
					<input class="dis" type="button" onclick="del(${detail.idx})" value="삭제하기"/>
				</td>
			</tr>
		</table> --%>	
		
	</body>
	<script>
	
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
				//글삭제
				if(reqUrl=="./rest/del"){
					console.log(d.success)
					if(d.success == 1){
						alert("삭제되었습니다.");
						location.href="./outputBoard";
					}else{
						alert("삭제에 실패했습니다.");
					}
				}
				},
			error:function(e){
				console.log(e);
			}
		});
	}
	</script>
</html>