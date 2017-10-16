<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="icon" href="resources/img/icon.png">
		<title>Insert title here</title>
		<link rel="stylesheet" href="resources/css/detail.css">
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
	    </style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
		<input type="hidden" name="idx" id="idx" value="${idx}"/>
		<input type="hidden" name="tb_idx" id="tb_idx" value="${detail.tb_idx}"/>
		<div class="ldk">
		<span class="dkdk">팀 게시판 글</span>
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
						<th colspan="6" class="viewTlt leeduck">${detail.tb_subject}</th>
					</tr>
					<tr>
						<th class="first leeduck duckki">
							<span class="division taean">첨부파일</span>
						</th>
						<td id="attach">
							
						</td>
						<th class="leeduck">
							<span class="division leeduck taean">등록일</span>
						</th>
						<td class="leeduck">${detail.reg_date}</td>
						<th>
							<span class="division leeduck taean">작성자</span>
						</th>
						<td class="leeduck">${detail.writer}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="cont leeduck" colspan="6">
							${detail.tb_content}
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btnRight mgb45">
				<a class="boardBtn01" id="menu" onclick="location.href='./projectTeamBoardMove?project_idx=${detail.project_idx}'">목록</a>
					<c:if test="${sessionScope.loginId eq detail.writer}">
						<a class="boardBtn01" type="button" onclick="location.href='./teamUpdateForm?idx=${detail.tb_idx}&project_idx=${detail.project_idx }'"/>수정</a>
						<a class="boardBtn01" type="button" onclick="teamDel(${detail.tb_idx})"/>삭제</a>
					</c:if>
			</div>
		</div>
		</div>
		<%-- <table class="board">
			<tr>
				<td>글번호</td>
				<td id="idx">${detail.tb_idx}</td>
				<td>작성자</td>
				<td>${detail.writer}</td>
				<td>작성일</td>
				<td>${detail.reg_date}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="5">
					${detail.tb_subject}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5">
					${detail.tb_content}
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5" id="attach">
				</td>
			</tr>
			<tr>
				<td colspan="6">
					< type="button" onclick="location.href='./projectTeamBoardMove?project_idx=${detail.project_idx}'" value="목록보기"/>
					<c:if test="${sessionScope.loginId eq detail.writer}">
						<a class="dis" type="button" onclick="location.href='./teamUpdateForm?idx=${detail.tb_idx}&project_idx=${detail.project_idx }'"/>수정</a>
						<a class="dis" type="button" onclick="teamDel(${detail.tb_idx})"/>삭제</a>
					</c:if>
				</td>
			</tr>
		</table>	 --%>
		
	</body>
	<script>
	
	console.log("${sessionScope.loginId}");
	console.log("${detail.writer}");
	var fileMap={};
	var url="";
	var data={};	
	
<c:forEach items="${files}" var="list">
	fileMap["${list.new_file}"] = "${list.old_file}";
</c:forEach>
	
	console.log(fileMap);
	
	if(fileMap.length < 1){
		$("#attach").html("첨부된 파일이 없습니다.");
	}else{
		//object 에서 키만 뽑아 내는 과정
		var ext;
		var content="";
		Object.keys(fileMap).forEach(function(item){
			console.log(item);
			ext = item.substring(item.lastIndexOf(".")+1);
			console.log(ext);
			content += "<a href='./teamDownload?file="+item+"'>"
			+"<img width='15px' src='resources/img/default.png'/> "
			+fileMap[item]+"</a>";
			
		});
		$("#attach").append(content);
	}
	
	function teamDel(idx){
		url="./membershipController/teamDel";
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
				if(reqUrl=="./membershipController/teamDel"){
					console.log(d.success)
					if(d.success == 1){
						alert("삭제되었습니다.");
						location.href="./projectTeamBoardMove?project_idx="+${detail.project_idx};
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