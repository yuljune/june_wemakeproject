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
	<style>
		
		#search{float:left; width:645px; height:45px; padding-left:10px; line-height:50px; border:5px solid #4152ac; color:#4152ac; font-size:14px;}
		table,td{
			border : 1px solid black;
		}
		.boardBtn02 {overflow:hidden; text-align:center; font-size:14px; color:#fff !important; text-decoration:none; width:209px; height:44px; line-height:44px; background:#318ec3; margin-top:15px;}
		#contents_area {width:1100px; margin:0 auto; z-index:90;}
		#contents_area h3 {position:relative; color:#222; font-size:32px; font-weight:700; line-height:36px; margin-top:10px; margin-bottom:20px;}
		.project-list .project-unit {
		    padding-left: 28px !important;
		    padding-right: 25px !important;
		    padding-bottom: 27px !important;
		    position: relative;
		    min-height: 120px;
		    padding-top: 27px;
		    margin: 0 0 5px;
		    background-color: #fff;
    		border-radius: 3px;
		}
		section{
			display:block;
		}
		.project_list_wrap {position:relative; display:inline-block; width:100%; z-index:1; } /*20160727수정*/
		.project_list_wrap > ul {width:100%;}
		.project_list_wrap > ul > li {float:left; width:527px; border-top:1px solid #222; margin-bottom:40px;}
		.project_list_wrap > ul > li.odd {margin-right:46px;}
		.project_list_wrap > ul > li.search_none {width:100%; color:#666; font-size:14px; text-align:center; background:#f3f3f3; padding:30px 0; border-top:0;} /*20160728추가*/
		.project_list_wrap > ul > li > ul > li.tit {font-size:18px; color:#222; line-height:24px; font-weight:700; margin:35px 10px 0 10px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;}
		.project_list_wrap > ul > li > ul > li.tit > a {color:#222; display:block; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;}
		.project_list_wrap > ul > li > ul > li.cont {font-size:14px; color:#666; line-height:20px; margin:10px 10px 0 10px;}
		.project_list_wrap > ul > li > ul > li.date {font-size:14px; color:#666; line-height:20px; margin:7px 10px 15px 10px;}/*진행중 위*/
		.project_list_wrap > ul > li > div {overflow:hidden;}
		.project_list_wrap > ul > li > div > p.ing_icon01 {float:left; background-color:#4152ac; width:91px; height:48px; text-align:center;} /*개설신청*/
		.project_list_wrap > ul > li > div > p.ing_icon01 > span {color:#fff; font-size:12px; height:16px;  background:url(resources/img/icon_ing01.png) no-repeat left 0px; padding-left:20px; margin-top:17px;}
		.project_list_wrap > ul > li > div > p.ing_icon02 {float:left; background-color:#8c54b3; width:91px; height:48px; text-align:center;} /*진행중*/
		.project_list_wrap > ul > li > div > p.ing_icon02 > span {color:#fff; font-size:12px; height:16px; background:url(resources/img/icon_ing02.png) no-repeat left 0px; padding-left:20px; margin-top:17px;}
		.project_list_wrap > ul > li > div > p.ing_icon03 {float:left; background-color:#1c8cd3; width:91px; height:48px; text-align:center;} /*공동작업*/
		.project_list_wrap > ul > li > div > p.ing_icon03 > span {color:#fff; font-size:12px; height:16px; background:url(resources/img/icon_ing03.png) no-repeat left 0px; padding-left:20px; margin-top:17px;}
		.project_list_wrap > ul > li > div > p.ing_icon04 {float:left; background-color:#5b5d67; width:91px; height:48px; text-align:center;} /*마감*/
		.project_list_wrap > ul > li > div > p.ing_icon04 > span {color:#fff; font-size:12px; height:16px; background:url(resources/img/icon_ing04.png) no-repeat left -1px; padding-left:20px; margin-top:17px;}
		.project_list_wrap > ul > li > div > p.ing_icon05 {float:left; background-color:#9fa0a6; width:91px; height:48px; text-align:center;} /*완료 20160824수정*/
		.project_list_wrap > ul > li > div > p.ing_icon05 > span {color:#fff; font-size:12px; height:16px; background:url(../images/sub/icon_ing06.png) no-repeat left -1px; padding-left:20px; margin-top:17px;}
		.project_list_wrap > ul > li > div > p.cate {float:left; background-color:#eaeaea; width:169px; height:48px;}
		.project_list_wrap > ul > li > div > p.cate > span {color:#222; font-size:13px; margin:17px 0 0 15px;}
		.project_list_wrap > ul > li > div > p.type {float:left; background-color:#f3f3f3; width:280px; height:48px; padding-left:10px;display: block;}
		.project_list_wrap > ul > li > div > p.type > span {padding:7px; border:1px solid #e8e8e8; color:#222; font-size:12px; background-color:#fff; margin:10px 1px 0 1px;}
		.project_list_wrap > ul > li > div > p.skills {float:left; background-color:white; width:280px; height:48px; padding-left:10px; display: block; margin-bottom:15px; margin-top:-10px;}
		.project_list_wrap > ul > li > div > p.skills > span {padding:7px; border:1px solid #e8e8e8; color:#222; font-size:12px; background-color:#fff; margin:10px 1px 0 1px;}
		.mgt65 {
			margin-top:20px !important;
		}
	</style>
	</head>
	<body>
		<jsp:include page="header.jsp" /><br/>
		<div id="contents_area">
		<h3>프로젝트 목록</h3>
		<c:if test="${empty sessionScope.loginId}">
		
			<div style="text-align: center; font-size: 14pt; font-weight: 600;">
			<a onclick="location.href='./projectmain'">전체</a> <a onclick="location.href='./projectmozip'">모집중</a> <a onclick="location.href='./projectrunning'">진행중</a> <a href="#">완료</a></div>
			
			<br/>
		</c:if>
		<c:if test="${!empty sessionScope.loginId}">
		<form id="skillsearch" action="./skillsearch" method="post">
			<div style="text-align: center; font-size: 14pt; font-weight: 600;">
			<a onclick="location.href='./projectmain'">전체</a> <a onclick="location.href='./projectmozip'">모집중</a> <a onclick="location.href='./projectrunning'">진행중</a> <a href="#">완료</a> <a style="color:#424242;" onclick="location.href='./skillsearch'">내분야</a></div>
			<br/>
		</form>
		</c:if>
		
		<form id="projectsearch" action="./projectsearch" method="post">
		<div id="select_container02" style="margin-left:190px;">
		<select id="select" name="select" style="float:left; background-color: #5464b9; color: white; height:45px;">
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="subject+content">제목+내용</option>
		</select>
		<input type="text" placeholder="검색어를 입력하세요." id="search" name="search"><a><img src="resources/img/btn_search.gif" width=50 onclick="searchsubmit()"></a>
		</div>
		</form>
		
		<br/>
		<c:if test="${!empty sessionScope.loginId }">
		<div style="text-align:right; margin-right: 40px;"><a class="boardBtn02" onclick="location.href='projectwriteForm'"><span>신규 프로젝트 등록</span></a></div>
		<br/>
		</c:if>
		
		
		<div id="list" style="width:1100px;" class="project_list_wrap mgt65">
			
		</div>
		
		
		
		<div class="container">
		    <nav aria-label="Page navigation" style="text-align:center">
		        <ul class="pagination" id="pagination"></ul>
		    </nav>
		</div>
					<!-- <div id="paging"></div> -->
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
	//시작하자마자 리스트 불러오기.
	searchCall(showPage);
	
	
	function searchCall(page){
		url="./project/searchCall";
		data={};
		data.page = page;
		data.pagePerNum = 8;
		data.select = "${select}";
		data.search = "${search}";
		ajaxCall(url,data);
	}
	/*
	function runningCall(page){
		url="./project/runningCall";
		data={};
		data.page = page;
		data.pagePerNum = 8;
		data.condition = "진행중";
		ajaxCall(url,data);
	}
	*/
	function del(idx){
		url="./project/del";
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
				console.log(d);
				
				if(reqUrl=="./project/searchCall"){
					showPage = d.currPage;
					console.log(d.list);
					moziplistPrint(d.list);
					//pagingPrint(d.currPage, d.range);
					
					$('#pagination').twbsPagination({
						startPage: d.currPage,	//시작 페이지
						totalPages: d.range,	//총 페이지 갯수
						visiblePages: 10,	//가로로 보여줄 페이징처리 갯수
						onPageClick: function (event, page) {
							console.log(event);
							console.log(page);
							searchCall(page);
						}
					});
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	/*
	function listPrint(list){			
		var content="";					
		for(var i=0; i<list.length; i++){
			content+="<div>";
			content+="<h4><a href='./projectdetail?idx="+list[i].project_idx+"'>"+list[i].subject+"</a></h4>";
			content+="<span>등록자 : "+list[i].user_id+ "</span><span> 등록일 : "+list[i].reg_date+"</span><br/>";
			content+="<span>"+list[i].summary+"</span>";
			content+="</div>";
			content+="<div>";
			content+="<span>"+list[i].kind+" |</span><span> 요구기술 : "+list[i].skills+"</span>";
			content+="</div>";
			content+="<tr><td>"+list[i].condition+"</td><td><b>지원자수["+list[i].applicant+"]</b></td></tr>";
			
		}						
		$("#list").empty();
		$("#list").append(content);			
	}
	*/
	//리스트 그리기
	
	
	function moziplistPrint(list){
		
		var content="";
		var count = 0;
		for(var i=0; i<list.length; i++){
			if(count==0){
				var summary = "";
				content+="<ul>";
				content+="<li class='odd'>";
				content+="<ul class='mog30 mgb30'>";
				content+="<li class='tit'>";
				content+="<a href='./projectdetail?idx="+list[i].project_idx+"'>"+list[i].subject+"</a>";
				content+="</li>";
				content+="<li class='cont'>"+list[i].assign+" / "+list[i].user_name+" ["+list[i].user_type+"]</li>";
				summary = list[i].summary.substring(0,170);
				if(list[i].summary.length>170){
					summary += "...";
				}
				if(list[i].condition=="모집중"){
					content+="<li class='date'>공고기간 : "+list[i].begin_date+" ~ "+list[i].end_date+"<b> 지원자 수 : ["+list[i].applicant+"]</b></li>";
					content+="<li class='date'>개요 / "+list[i].kind+"</br><div class='summary'>"+summary+"</div></li>";
					content+="</ul>";
					//content+="<div><p class='kind'><span>개발 : "+list[i].kind+"</span></p></div>";
					content+="<div><p class='skills'><span>요구기술 : "+list[i].skills+"</span></p></div>";
					content+="<div><p class='ing_icon01'><span>"+list[i].condition+"</span></p><p class='type'>구성 :<span>"+list[i].hope+"</span></p>";
					content+="</div>";
					content+="</li>";
					content+="</ul>";
				}
				if(list[i].condition=="진행중"){
					content+="<li class='date'>수행기간 : "+list[i].take_start+" ~ "+list[i].take_end+"</li>";
					content+="<li class='date'>개요 / "+list[i].kind+"</br><div class='summary'>"+summary+"</div></li>";
					content+="</ul>"
					//content+="<div><p class='kind'><span>개발 : "+list[i].kind+"</span></p></div>";
					content+="<div><p class='skills'><span>요구기술 : "+list[i].skills+"</span></p></div>";
					content+="<div><p class='ing_icon02'><span>"+list[i].condition+"</span></p><p class='type'>구성 :<span>"+list[i].hope+"</span></p>";
					content+="</div>";
					content+="</li>";
					content+="</ul>";
				}
				if(list[i].condition=="완료"){
					content+="<li class='date'>수행기간 : "+list[i].take_start+" ~ "+list[i].take_end+"</li>";
					content+="<li class='date'>개요 / "+list[i].kind+"</br><div class='summary'>"+summary+"</div></li>";
					content+="</ul>";
					//content+="<div><p class='kind'><span>개발 : "+list[i].kind+"</span></p></div>";
					content+="<div><p class='skills'><span>요구기술 : "+list[i].skills+"</span></p></div>";
					content+="<div><p class='ing_icon03'><span>"+list[i].condition+"</span></p><p class='type'>구성 :<span>"+list[i].hope+"</span></p>";
					content+="</div>";
					content+="</li>";
					content+="</ul>";
				}
				count=1;
			}else{
				content+="<ul>";
				content+="<li>";
				content+="<ul class='mog30 mgb30'>";
				content+="<li class='tit'>";
				content+="<a href='./projectdetail?idx="+list[i].project_idx+"'>"+list[i].subject+"</a>";
				content+="</li>";
				content+="<li class='cont'>"+list[i].assign+" / "+list[i].user_name+" ["+list[i].user_type+"]</li>";
				summary = list[i].summary.substring(0,170);
				if(list[i].summary.length>170){
					summary+="...";
				}
				if(list[i].condition=="모집중"){
					content+="<li class='date'>공고기간 : "+list[i].begin_date+" ~ "+list[i].end_date+"<b> 지원자 수 : ["+list[i].applicant+"]</b></li>";
					content+="<li class='date'>개요 / "+list[i].kind+"</br><div class='summary'>"+summary+"</div></li>";
					content+="</ul>";
					//content+="<div><p class='kind'><span>개발 : "+list[i].kind+"</span></p></div>";
					content+="<div><p class='skills'><span>요구기술 : "+list[i].skills+"</span></p></div>";
					content+="<div><p class='ing_icon01'><span>"+list[i].condition+"</span></p><p class='type'>구성 :<span>"+list[i].hope+"</span></p>";
					content+="</div>";
					content+="</li>";
					content+="</ul>";
				}
				if(list[i].condition=="진행중"){
					content+="<li class='date'>수행기간 : "+list[i].take_start+" ~ "+list[i].take_end+"</li>";
					content+="<li class='date'>개요 / "+list[i].kind+"</br><div class='summary'>"+summary+"</div></li>";
					content+="</ul>";
					//content+="<div><p class='kind'><span>개발 : "+list[i].kind+"</span></p></div>";
					content+="<div><p class='skills'><span>요구기술 : "+list[i].skills+"</span></p></div>";
					content+="<div><p class='ing_icon02'><span>"+list[i].condition+"</span></p><p class='type'>구성 :<span>"+list[i].hope+"</span></p>";
					content+="</div>";
					content+="</li>";
					content+="</ul>";
				}
				if(list[i].condition=="완료"){
					content+="<li class='date'>수행기간 : "+list[i].take_start+" ~ "+list[i].take_end+"</li>";
					content+="<li class='date'>개요 / "+list[i].kind+"</br><div class='summary'>"+summary+"</div></li>";
					content+="</ul>";
					//content+="<div><p class='kind'><span>개발 : "+list[i].kind+"</span></p></div>";
					content+="<div><p class='skills'><span>요구기술 : "+list[i].skills+"</span></p></div>";
					content+="<div><p class='ing_icon03'><span>"+list[i].condition+"</span></p><p class='type'>구성 :<span>"+list[i].hope+"</span></p>";
					content+="</div>";
					content+="</li>";
					content+="</ul>";
				}
				count=0;
			}
			
		}
			/*
			content+="<tr>";
			content+="<td class='subject'>";
			content+="<a href='./projectdetail?idx="+list[i].project_idx+"'>"+list[i].subject+"</a>";
			//content+='<a href=""></a>';
			content+="</td>";
			content+="</tr>";
			content+="<tr><td>등록자 : "+list[i].user_name+"<span style='margin-left:100px;'>등록일 : "+list[i].reg_date+"</span></td></tr>";
			content+="<tr><td>"+list[i].summary+"</td></tr>";
			content+="<tr><td>"+list[i].kind+"<span style='margin-left:100px;'>요구기술 : "+list[i].skills+"<span></td>";
			if(list[i].condition=="모집중"){
				content+="<tr><td>상태 : "+list[i].condition+" 구성| "+list[i].hope+" 및 "+list[i].people+"명</td></tr>";
				content+="<tr><td>공고기간 : "+list[i].begin_date+"~"+list[i].end_date+"<b> 지원자 수 : ["+list[i].applicant+"]</b></td></tr>";
			}
			if(list[i].condition=="진행중"){
				content+="<tr><td>상태 : "+list[i].condition+" "+list[i].take_start+"~"+list[i].take_end+"</td></tr>";
			}
			if(list[i].condition=="완료"){
				content+="<tr><td>상태 : "+list[i].condition+"</td></tr>";			
			}
			
		}
		if(list.length==0){
			content+="<tr>";
			content+="<td style='text-align:center;'>등록된 글이 없습니다.</td>";
			content+="</tr>";
		}*/
		if(list.length==0){
			/* content+="<table>";
			content+="<tr>";
			content+="<td style='text-align:center;'>등록된 글이 없습니다.</td>";
			content+="</tr>";
			content+="</table>"; */
			content+="<div style='width:100%; font-size:14px; text-align:center; height:30px;' >해당 조건의 등록된 글이 없습니다.</div>";
		}
		$("#list").empty();
		$("#list").append(content);		
	}
	
	function searchsubmit(){
		$("#projectsearch").submit();
	}
	
	
	//content+="<td><a href='#' onclick='del("+list[i].bbsno+")'>삭제</a></td>";
	</script>
</html>