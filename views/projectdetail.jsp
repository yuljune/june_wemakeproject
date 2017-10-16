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
		.file{text-decoration:none; color:gray;}
		.file:hover{color:gray;}
		
		#contents_area {width:1100px; margin:0 auto; z-index:90;}
		#contents_area h3 {position:relative; color:#222; font-size:32px; font-weight:700; line-height:36px; margin-top:10px; margin-bottom:30px;}
	    .bbsWriteA {width:100%;  border-bottom:1px solid #222; border-top:1px solid #222; border-collapse:collapse; border-spacing:0; table-layout:fixed;}
		
		.bbsViewB {width:100%; border-top:1px solid #222; border-bottom:1px solid #222; border-collapse:collapse;border-spacing:0;table-layout:fixed;}
		.bbsViewB > thead > tr > th {padding:25px 10px 23px;color:#666;text-align:left;vertical-align:middle; border-top:1px solid #222; background:#fff; font-size:14px; line-height:24px;}
		.bbsViewB > thead > tr > th.viewTlt {font-size:25px;color:#222; font-weight:700; text-align:center; line-height:32px; padding:30px 50px 30px; background-color:#f8f8fa;}
		.bbsViewB > tbody > tr > th {padding:20px 0 20px 40px; font-weight:400; color:#222; font-size:14px; text-align:left; vertical-align:middle; border-top:1px solid #e4e4e4; background:#fff;}
		.bbsViewB > tbody > tr > th  span.division {padding-left:10px; margin-right:15px; line-height:18px; color:#222;}
		.bbsViewB > tbody > tr > td {height:25px; padding:20px 25px 20px 25px; color:#666; font-size:14px; line-height:24px; border-top:1px solid #e4e4e4; vertical-align:middle;}
		.bbsViewB > tbody > tr:first-child > td, .bbsViewB > tbody > tr:first-child > th {border-top:1px solid #222;} 
		.bbsViewB > tbody > tr > td.pad0 {padding:0}
		.bbsViewB > tbody > tr > th.pad0 {padding:25px 0 23px 0;}
		.bbsViewB > tbody > tr > td > a {color:#666;}
		
		.bbsViewB > tbody > tr > td > span.colorL {color:#999;}
		.bbsViewB > tbody > tr > th.borderT {border-top:1px solid #222;}
		.bbsViewB > tbody > tr > td.borderT {border-top:1px solid #222;}
		.bbsViewB > tbody > tr > td.cont {color:#222;}
		.bbsViewB > tbody > tr > td.cont p.cont_img img {max-width:100%;}
		.bbsViewB > tbody > tr > td > ul > li {padding-left:20px;}
		
		.bbsViewB_in {width:100%; border-collapse:collapse;border-spacing:0;table-layout:fixed;}
		.bbsViewB_in > thead > tr > th {padding:25px 10px 23px;color:#666;text-align:left;vertical-align:middle; border-top:1px solid #222; background:#fff; font-size:14px; line-height:24px;}
		.bbsViewB_in > thead > tr > th.viewTlt {font-size:22px;color:#222; font-weight:700; text-align:center; line-height:32px; padding:30px 50px 30px; background-color:#f8f8fa;}
		.bbsViewB_in > tbody > tr > th {padding:0 0 0 25px; font-weight:400; color:#222; font-size:14px; text-align:left; vertical-align:middle; border-top:1px solid #e4e4e4; border-left:1px solid #e4e4e4; background:#fff;}
		.bbsViewB_in > tbody > tr > th > span.division {padding-left:10px; margin-right:15px; line-height:18px; color:#222;}
		.bbsViewB_in > tbody > tr > td {height:25px; padding:20px 25px 20px 25px; color:#666; font-size:14px; line-height:24px; border-top:1px solid #e4e4e4; border-left:1px solid #e4e4e4;}
		.bbsViewB_in > tbody > tr > td.bdnone {border:0;}
		.bbsViewB_in > tbody > tr:first-child > th, .bbsViewB_in > tbody > tr:first-child > td {border-top:0;}
		.bbsViewB_in > tbody > tr > td > a {color:#666;}
		
		
		
		
		.btnRight {margin-top:20px; text-align:right; position:relative;}
		
		.boardBtn01 {overflow:hidden; text-align:center; font-size:15px; color:#fff !important; text-decoration:none; width:113px; height:49px; line-height:49px; background:#bbb;  margin:0 3px;} 
		.boardBtn01:hover {background-color:#bbb;text-decoration:none;}
		.boardBtn05 {overflow:hidden; text-align:center; font-size:14px; color:#fff !important; text-decoration:none; width:113px; height:49px; line-height:49px; background:#4152ac; margin:0 9px;}
		.boardBtn05:hover {color:#fff !important; text-decoration:none; background:#4152ac url(../images/board/icon_btn_arrow_on.png) no-repeat 90% center;}
		
		.boardBtn08 {overflow:hidden; text-align:left; font-size:14px; color:#fff !important; text-decoration:none; width:151px; height:49px; line-height:49px; background:#4152ac; margin:0 3px;}
		.boardBtn08 span {margin-left:25px; padding-left:30px; background:url(resources/img/icon_partner_on.png) no-repeat left 15px;}
		
		.delapply {overflow:hidden; text-align:left; font-size:14px; color:#fff !important; text-decoration:none; width:151px; height:49px; line-height:49px; background:#FE9A2E; margin:0 3px;}
		.delapply span {margin-left:25px; padding-left:30px; background:url(resources/img/icon_partner_on.png) no-repeat left 15px;}
		
		.boardIcon02 {display:inline-block; height:32px; width:100px; line-height:30px; border-radius:16px; text-align:center;  background-color:#4152ac; zoom:1; .display:inline; margin:2px 5px 2px 0;} /*프로젝트현황 내용보기 신청중 아이콘 20160912수정*/
		.boardIcon02 span {padding-left:20px; margin-left:-1px; background:url(resources/img/icon_partner_on.png) no-repeat left -2px center; color:#fff; font-size:12px;}
		
		.boardIcon03 {display:inline-block; height:32px; width:100px; line-height:30px; border-radius:16px; text-align:center;  background-color:#8c54b3; zoom:1; .display:inline; margin:2px 5px 2px 0;} /*프로젝트현황 내용보기 진행중 아이콘 20160912수정*/
		.boardIcon03 span {padding-left:20px; margin-left:-1px; background:url(resources/img/icon_statue02.png) no-repeat left center; color:#fff; font-size:12px;}
		
		.h4{
			margin-top:45px !important;
		}
		
		.list_box {position:relative; width:1100px; margin-bottom:60px;}
		.list_box > h4 {color:#222; font-size:22px; font-weight:700; line-height:26px; padding-top:25px;}
		.list_box .bdTab {width:100%; overflow:hidden;}
		.list_box .bdTab > li {display:inline-block; width:274px; float:left;}
		.list_box .bdTab > li > p {margin:0; width:274px; padding:0;}
		.list_box .bdTab > li > p > a {width:273px; height:62px; background-color:#e4e5ea; text-align:center; text-decoration:none; border-left:1px solid #cbccd4; border-top:1px solid #cbccd4; border-bottom:1px solid #cbccd4;}
		.list_box .bdTab > li > p > a.last {border-right:1px solid #cbccd4;}
		.list_box .bdTab > li.current > p > a, .list_box .bdTab > li.on > p > a {background-color:#4152ac; border-top:1px solid #4152ac; border-bottom:1px solid #4152ac;}
		.list_box .bdTab > li.current > p > a > span, .list_box .bdTab > li.on > p > a > span {color:#fff;}
		.list_box .bdTab > li > p > a.focus {background-color:#4152ac; border-top:1px solid #4152ac; border-bottom:1px solid #4152ac;}
		.list_box .bdTab > li > p > a.focus > span {color:#fff;}
		.list_box .bdTab > li > p > a > span {font-size:16px; color:#666; line-height:62px; font-weight:normal;}
		.list_box > .bdCont {display:block; margin-top:50px;  width:100%;} /*20160826수정*/
		/*bbsListA border bottom = 신청목록 맨 밑 바닥 선*/
		.bbsListA {width:100%;  border-top:1px solid #222;  border-bottom:1px solid #222; border-collapse:collapse; border-spacing:0; table-layout:fixed;}
		.bbsListA thead tr th {padding:25px 0 23px;font-weight:bold;color: #222;font-size:14px;text-align:center;vertical-align:middle;border-bottom:1px solid #222;background:#fff;}
		.bbsListA tbody tr td {padding:20px 5px 17px; color:#666; font-size:14px; line-height:18px; vertical-align:middle; border-top:1px solid #dcdcdc; text-align:center;}
		.bbsListA tbody tr td a {color:#666;}
		.bbsListA > tbody > tr:first-child > td{border-top:1px solid #222;} /*20160923수정*/
		.bbsListA tbody tr td img {vertical-align:bottom;}
		.bbsListA tbody tr td.tlt {text-align:center; }
		.bbsListA tbody tr td.tlt > a {display:inline-block; line-height:22px; color:#222; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; max-width:450px; }
		.bbsListA tbody tr td.tlt > a.important {color:#4152ac; background:url(../images/board/icon_important.png) no-repeat left center; padding-left:22px;}
		.bbsListA tbody tr td.tlt > a:HOVER {color : #2E64FE;}
		.bbsListA tbody tr td.tlt span.icon_reply { padding-right:5px; float:left;}
		.bbsListA tbody tr td.tlt span.dat {font-weight:700; color:#da5b1c;}
		.bbsListA tbody tr td.tlt span.dat > a {text-decoration:none;color:#ca4949; line-height:22px; margin-left:5px;}
		.bbsListA tbody tr td.tlt span.complete {color:#4152ac; font-size:14px; font-weight:700; margin-left:5px; padding-left:15px; background:url(../images/project/icon_star.png) no-repeat left 2px;}
		.bbsListA tbody tr td.tlt2 {text-align:left; padding-left:20px;} /*20160829추가 공모대전list*/
		.bbsListA tbody tr td.tlt2 > a {display:inline; float:left; line-height:22px; color:#222; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;} /*20160829추가*/
		.bbsListA tbody tr td.tlt2 > a.important {color:#4152ac; background:url(../images/board/icon_important.png) no-repeat left center; padding-left:22px;} /*20160829추가*/
		.bbsListA tbody tr td.division {text-align:center;color:#006dba;font-weight:bold; float:left;}
		.bbsListA tbody tr td.recruitDate {font-size:11px;}
		.bbsListA tbody tr td.tlt .reply {color:#cf226b;}
		.bbsListA tbody tr td .inputTxt01 {line-height: 37px; height: 37px; padding: 0 5px; border: 1px solid #e0e0e0; background-color: #fbfbfb; color:#666; font-size:14px;} /*20160830추가*/
		.bbsListA tbody tr td .select02 {width:150px; height:39px; margin-right:20px; font-size:13px; line-height:22px;  border:1px solid #e0e0e0; padding:0.7em .5em; font-family: inherit;  -webkit-appearance: none; -moz-appearance: none;  appearance: none; background:#fbfbfb url(../images/board/icon_select_arrow.png) no-repeat right 10px center;} /*20160830추가*/
		.bbsListA tbody tr td .select02::-ms-expand {display: none;}
		
		
		
	</style>
	</head>
	<body>
		<jsp:include page="header.jsp" /><!-- 헤더부분 --><br/><br/>
		<div id="contents_area">
		<form name="detailForm" id="detailForm" method="post" action="noticeView.do">
			<!-- '<td><a onclick="into('+list[i].project_idx+',\''+list[i].user_id+'\',\''+list[i].user_type+'\',\''+list[i].user_name+'\');">수락</a> <a onclick="del('+list[i].project_idx+',\''+list[i].user_id+'\');">철회</a></td>'; -->
			<h3>프로젝트 내용</h3>
			<div class="list_box">
				<div class="btnRight mgb15">
					<span style="margin-left:800px;"><a class="boardBtn01" onclick="location.href='./projectmain'">목록</a></span>
					<c:if test="${!empty sessionScope.loginId }">
					<c:if test="${empty teamapply}">
					<c:if test="${empty teamuserid }">
					<c:if test="${detail.condition eq '모집중'}">
					<a class="boardBtn08" onclick="applyinto(${detail.project_idx})"><span>참가신청</span></a>
					</c:if>
					</c:if>
					</c:if>
					</c:if>
					<c:if test="${!empty teamapply}">
					<a class="delapply" onclick="applyout(${detail.project_idx},'${sessionScope.loginId}')"><span>신청취소</span></a>
					</c:if>		
				</div>
				<br/>
				<table class="bbsViewB" summary="게시물 읽기">
					<colgroup>
						<col width="22%" />
						<col width="78%" />
					</colgroup>
					<thead>
						<tr>
							<th colspan="2" class="viewTlt">${detail.subject }</th>
						</tr>															
					</thead>
					<tbody>
						<tr>
							<th scope="row"><span class="division">등록자</span></th>
							<td>${detail.user_name} <span class="boardIcon01">[${detail.user_type}]</span></td>
						</tr>
						<tr>
							<th scope="row"><span class="division">소속명</span></th>
							<td>${detail.assign}</td>
						</tr>
						<tr>
							<th scope="row"><span class="division">공고기간<br/>(파트너신청 기간)</span></th>
							<td>${detail.begin_date } ~ ${detail.end_date }</td>
						</tr>
						<tr>
							<th scope="row"><span class="division">프로젝트 기간</span></th>
							<td>${detail.take_start } ~ ${detail.take_end }</td>
						</tr>
						<tr>
							<th scope="row"><span class="division">기술분야</span></th>
							<td>${detail.skills }</td>
						</tr>
						<tr>
							<th scope="row"><span class="division">주제영역</span></th>
							<td>${detail.kind }</td>
						</tr>
						<tr>
							<th scope="row" class="borderT"><span class="division">프로젝트개요<br/>(프로젝트 소개)</span></th>
							<td class="borderT">${detail.summary }</td>
						</tr>
						<tr>
							<th scope="row"><span class="division">내용</span></th>
							<td>${detail.content }</td>
						</tr>
						
						
						<tr>
							<th scope="row"><span class="division">첨부파일</span></th>
							<td>
							<span id="attach"></span>
							</td>
						</tr>
						<c:if test="${detail.condition eq '모집중'}">
						<tr>
							<th scope="row"><span class="division">구성</span></th>
							<td>${detail.hope}  <span style="margin-left:3px;">| 희망인원 : ${detail.people}명</span></td>
						</tr>
						<tr>
							<th scope="row"><span class="division">상태</span></th>
							<td>
									<p class="boardIcon02"><span>모집중</span></p> 
							</td>
						</c:if>
						
						<c:if test="${detail.condition eq '진행중'}">
						<%-- <tr>
							<th scope="row"><span class="division">팀원</span></th>
							<td><c:forEach items="${teamuser}" var="teamuser">${teamuser} </c:forEach></td>
						</tr> --%>
						<tr>
							<th scope="row"><span class="division">상태</span></th>
							<td>
									<p class="boardIcon03"><span>진행중</span></p> 
							</td>
						</tr>
						
						</c:if>
					</tbody>
				</table>
				<div class="btnRight mgb15">								
					<span style="margin-left:400px;"><a href="#" class="boardBtn01" onclick="location.href='./projectmain'">목록</a></span>
					<c:if test="${sessionScope.loginId eq detail.user_id }">
					<a href="#" class="boardBtn01" onclick="location.href='./projectmodify?idx=${detail.project_idx}'"><span>수정</span></a>
					</c:if>
					<c:if test="${sessionScope.loginId eq detail.user_id }">
					<a href="#" class="boardBtn01" onclick="deletecheck();"><span>삭제</span></a>
					</c:if>
					<c:if test="${!empty sessionScope.loginId }">
					<c:if test="${empty teamapply}">
					<c:if test="${empty teamuserid }">
					<c:if test="${detail.condition eq '모집중'}">
					<a  class="boardBtn08" onclick="applyinto(${detail.project_idx})"><span>참가신청</span></a>
					</c:if>
					</c:if>
					</c:if>
					</c:if>
					<c:if test="${!empty teamapply}">
					<a class="delapply" onclick="applyout(${detail.project_idx},'${sessionScope.loginId}')"><span>신청취소</span></a>
					</c:if>
				</div>
				<c:if test="${detail.condition ne '완료'}">
				<h4 class="h4">프로젝트 팀원</h4>
				<div style="margin: 0; padding: 0;">
					<table class="bbsListA mgt20">
					<colgroup>
					<col width="33%">
					<col width="33%">
					<col >
					</colgroup>
						<thead>
							<tr>
								<th>팀원</th>
								<th>타입</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody id="divteamList">
							
						</tbody>
					</table>
				</div>
				</c:if>
				<c:if test="${detail.condition eq '모집중'}">
				<h4 class="h4">프로젝트 신청내역</h4>
				<div style="margin: 0; padding: 0;">
					<table class="bbsListA mgt20">
					<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					</colgroup>
						<thead>
							<tr>
								<th>신청자</th>
								<th>타입</th>
								<th>소속</th>
								<th>신청일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody id="divApplyList">
							
						</tbody>
					</table>
					<div class="container">
				    <nav aria-label="Page navigation" style="text-align:center">
				        <ul class="pagination" id="pagination"></ul>
				    </nav>
					</div>
				</div>
				</c:if>
				
				<h4 class="h4">댓글</h4>
				<c:if test="${!empty sessionScope.loginId }">
				
				<div style="margin: 0; padding: 0;">
					<table class="bbsListA mgt20">
						<colgroup>
						<col width="14%">
						<col>
						<col width="14%">
						</colgroup>
						<tr>
							<td class="user">${sessioninfo.user_name}</td>
							<td><textarea id="replecontent" rows="3" cols="100%"></textarea></td>
							<td><a id="repleinsert">댓글달기</a></td>
						</tr>
					
					</table>
				
				</div>
				</c:if>
				<div style="margin: 0; padding: 0;">
				
					<table class="bbsListA mgt20">
						<colgroup>
						<col width="12%">
						<col>
						<col width="16%">
						<col width="17%">
						</colgroup>
						<thead>
							<tr>
								<th>이름</th>
								<th>내용</th>
								<th>등록일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody id="divrepleList">
							
						</tbody>
						
					</table>
					<div class="container">
				    <nav aria-label="Page navigation" style="text-align:center">
				        <ul class="replepagination" id="replepagination"></ul>
				    </nav>
					</div>
				</div>
			</div>
			</form>
			
			
			
			
		</div>
	</body>
	<script>
		var msg="${msg}";
		var url;
		var data;
		var showPage = 1;
		
		var writer = "${detail.user_id}";
		var seeing = "${sessionScope.loginId}";
		console.log("글쓴이="+writer);
		console.log("세션="+seeing);
	
		var idx ="${detail.project_idx}";
		var teamuser = "${teamuserid}";
		var teamapply = "${teamapply}";
		console.log("팀에속한 현세션:"+teamuser);
		console.log("신청내역에속한세션:"+teamapply);
		
		
		
		if(msg!=""){
			alert(msg);
		}
		
		var fileMap = {};
		<c:forEach items="${files}" var="list">
			fileMap["${list.new_file}"] = "${list.old_file}";
		</c:forEach>
		
		if(fileMap.length < 1){
			//$("#attach").html("첨부된 파일이 없습니다.");
		}else{
			//오브젝트에서 키만 뽑아 내는 과정
			var ext;
			var content="";
			Object.keys(fileMap).forEach(function(item){
				console.log(item);
				ext = item.substring(item.lastIndexOf(".")+1);
				console.log(ext);
					content += "	<a href='./projectdownload?file="+item+"' class='file'>"
					+"<img width='15px' src='resources/img/default.png'/> "
					+fileMap[item]+"</a>";
					//fileMap에 있는 이키에 대한 값 가져오기
			});
			$("#attach").append(content);
		}
		
		//프로젝트 삭제 클릭시 예 아니요
		function deletecheck(){
			if(confirm("프로젝트를 삭제하시겠습니까?")){
				location.href="./projectdelete?idx="+${detail.project_idx};
				
			}else{
				return;
			}
		}
		
		
		
		listCall(showPage);
		repleCall(showPage);
		teamCall();
		
		
		
		function listCall(page){
			url="./project/applyCall";
			data={};
			data.page = page; //현재페이지
			data.pagePerNum = 5; //몇개씩
			data.idx = idx;
			ajaxCall(url,data);
		}
		
		function repleCall(page){
			url="./project/repleCall";
			data={};
			data.page = page;
			data.pagePerNum = 5;
			data.idx = idx;
			sendAjax(url,data);
		}
		
		function teamCall(){
			url="./project/teamCall";
			data={};
			data.idx = idx;
			ajaxCall(url,data);
		}
		
		
		function listPrint(list){
			var content="";
			for(var i=0; i<list.length; i++){
				content+="<tr>";
				content+="<td class='tlt'>"+list[i].user_name+"</td>";
				content+="<td class='tlt'>"+list[i].user_type+"</td>";
				content+="<td class='tlt'>"+list[i].assign+"</td>";
				content+="<td class='tlt'>"+list[i].reg_date+"</td>";
				//content+="<td><a onclick='into("+list[i].project_idx+")'>수락</a> <a onclick='del("+list[i].project_idx+","+list[i].user_id+")'>철회</a></td>";
				if(writer == seeing){
				content+='<td class="tlt"><a onclick="into('+list[i].project_idx+',\''+list[i].user_id+'\',\''+list[i].user_name+'\',\''+list[i].user_type+'\');">수락</a> <a onclick="del('+list[i].project_idx+',\''+list[i].user_id+'\');">철회</a></td>';
				}else{
					content+='<td class="tlt">-</td>';	
				}
			}
			//신청내역을 불러왔는데 댓글이 안달려있을때
			if(list.length==0){
				content+="<tr>";
				/*
				if(seeing =="" || seeing ==null){
					content+="<td class='tlt' colspan='5' style='text-align:center;'>신청내역이 없습니다.</td>";
				}else if(writer==seeing){
					content+="<td class='tlt' colspan='5' style='text-align:center;'>신청내역이 없습니다.</td>";	
				}else if(seeing != null){
					content+="<td class='tlt' colspan='5' style='text-align:center;'>신청내역이 없습니다.</td>";
				}else{
					content+="<td class='tlt' colspan='5' style='text-align:center;'>신청내역이 없습니다...</td>";
				}
				*/
				content+="<td class='tlt' colspan='5' style='text-align:center;'>신청내역이 없습니다.</td>";
				content+="</tr>";
			}
			$("#divApplyList").empty();
			$("#divApplyList").append(content);			
		}
		
		function replePrint(list){
			var content="";
			for(var i=0; i<list.length; i++){
				content+="<tr>";
				content+="<td class='tlt'>"+list[i].user_name+"</td>";
				if(seeing == list[i].user_id){
				//content+='<td class="tlt"><input type="text" style="width:100%; height:32px; font-size:15px; text-align:center;" id=" '+list[i].p_comment_idx+' " value=" '+list[i].content+' "></td>';
				content+='<td class="tlt"><input type="text" style="width:90%; height:32px; font-size:15px; text-align:center;" id="'+list[i].p_comment_idx+'" value="'+list[i].content+'"></td>';
				content+="<td class='tlt'>"+list[i].reg_date+"</td>";
				content+='<td class="tlt"><a onclick="repleupdate('+list[i].p_comment_idx+');">수정하기</a> <a onclick="repledel('+list[i].p_comment_idx+');">삭제</a></td>';
				}else{
					content+="<td class='tlt' >"+list[i].content+"</td>";
					content+="<td class='tlt'>"+list[i].reg_date+"</td>";
					content+='<td class="tlt">-</td>';	
				}
			}
			
			if(list.length==0){
				content+="<tr>";
				content+="<td class='tlt' colspan='4' style='text-align:center;'>댓글이 없습니다.</td>";
				content+="</tr>";
			}
			$("#divrepleList").empty();
			$("#divrepleList").append(content);
		}
		
		function teamlist(list){
			var content="";
			for(var i=0; i<list.length; i++){
				if(seeing != null){
					if(seeing == writer){
						if(writer== list[i].user_id){
							content+="<tr>";
							content+="<td class='tlt'>"+list[i].user_name+"</td>";
							content+="<td class='tlt'>"+list[i].user_type+"</td>";	
							content+='<td class="tlt">팀장</td>';
							content+="</tr>";
						}else{
							content+="<tr>";
							content+="<td class='tlt'>"+list[i].user_name+"</td>";
							content+="<td class='tlt'>"+list[i].user_type+"</td>";	
							content+='<td class="tlt"><a onclick="teamdel('+list[i].project_idx+',\''+list[i].user_id+'\',\''+list[i].user_name+'\');">철회</a></td>';
							content+="</tr>";
						}
					}else{
						if(writer== list[i].user_id){
							content+="<tr>";
							content+="<td class='tlt'>"+list[i].user_name+"</td>";
							content+="<td class='tlt'>"+list[i].user_type+"</td>";	
							content+='<td class="tlt">팀장</td>';
							content+="</tr>";
						}else if(seeing == list[i].user_id){
							content+="<tr>";
							content+="<td class='tlt'>"+list[i].user_name+"</td>";
							content+="<td class='tlt'>"+list[i].user_type+"</td>";	
							content+='<td class="tlt"><a onclick="teamdel('+list[i].project_idx+',\''+list[i].user_id+'\',\''+list[i].user_name+'\');">철회</a></td>';
							content+="</tr>";
						}else{
							content+="<tr>";
							content+="<td class='tlt'>"+list[i].user_name+"</td>";
							content+="<td class='tlt'>"+list[i].user_type+"</td>";	
							content+='<td class="tlt">-</td>';
							content+="</tr>";
						}
					}
				}
				if("${sessionScope.loginId}" == null){
					if(writer== list[i].user_id){
						content+="<tr>";
						content+="<td class='tlt'>"+list[i].user_name+"</td>";
						content+="<td class='tlt'>"+list[i].user_type+"</td>";	
						content+='<td class="tlt">팀장</td>';
						content+="</tr>";
					}else{
						content+="<tr>";
						content+="<td class='tlt'>"+list[i].user_name+"</td>";
						content+="<td class='tlt'>"+list[i].user_type+"</td>";	
						content+='<td class="tlt">-</td>';
						content+="</tr>";
					}
				}
				
				
			if(list.length==0){
				content+="<tr>";
				content+="<td class='tlt' colspan='3' style='text-align:center;'>준비중입니다.</td>";
				content+="</tr>";
			}
			$("#divteamList").empty();
			$("#divteamList").append(content);
		}
		}
		
		function applyinto(idx){
			data={};
			data.project_idx = idx;
			data.user_id = "${sessionScope.loginId}";
			url="./project/applyinto";
			ajaxCall(url,data);
		}
		function applyout(idx,id){
			data={};
			data.project_idx = idx;
			data.user_id = id;
			url="./project/applyout";
			ajaxCall(url,data);
		}
		
		function into(pidx,id,name,type){
			url="./project/applyyes";
			data={};
			data.project_idx = pidx;
			data.user_id = id;
			data.user_name = name;
			data.user_type = type;
			ajaxCall(url,data);
		}
		
		function del(pidx,id){
			url="./project/applyno";
			data={};
			data.project_idx = pidx;
			data.user_id = id;
			ajaxCall(url,data);
		}
		
		function teamdel(pidx,id,name){
			if(confirm(name+" 팀원을 철회하시겠습니까?")){
				url="./project/teamdel";
				data={};
				data.pidx = pidx;
				data.user_id = id;
				ajaxCall(url,data);
			}else{
				return;
			}
		}
		
		function repleupdate(cidx){
			url="./project/repleupdate";
			data={};
			data.idx = "${detail.project_idx}";
			data.cidx = cidx;
			data.content = $('#'+cidx).val(); 
			data.page = 1; //현재페이지
			data.pagePerNum = 5; //몇개씩
			sendAjax(url,data);
		}
		function repledel(cidx){
			url="./project/repledel";
			data={};
			data.idx = "${detail.project_idx}";
			data.cidx = cidx;
			data.page = 1; //현재페이지
			data.pagePerNum = 5; //몇개씩
			sendAjax(url,data);
		}
		//댓글 등록하기
		$("#repleinsert").click(function(){
			url="./project/repleinsert";
			data={};
			data.idx = "${detail.project_idx}"; //$("#idx").html();
			data.user_id = "${sessionScope.loginId}";
			data.user_name = "${sessioninfo.user_name}";
			data.content = $("#replecontent").val();
			data.page = 1; //현재페이지
			data.pagePerNum = 5; //몇개씩
			console.log(data);
			sendAjax(url,data);
		});
		
		function ajaxCall(reqUrl, reqData){
			console.log(reqUrl, reqData);
			$.ajax({
				url:reqUrl,
				type:"get",
				data:reqData,
				dataType:"json",
				success:function(d){
					console.log(d);
					if(reqUrl=="./project/applyCall"){
						//양호
						showPage = d.currPage;
						listPrint(d.applylist);
						//pagingPrint(d.currPage, d.range);
						
						$('#pagination').twbsPagination({
							startPage: d.currPage,	//시작 페이지
							totalPages: d.range,	//총 페이지 갯수
							visiblePages: 5,	//가로로 보여줄 페이징처리 갯수
							onPageClick: function (event, page) {
								console.log(event);
								console.log(page);
								listCall(page);
							}
						});
					}
					if(reqUrl=="./project/applyyes"){
						alert("팀원으로 수락하였습니다.");
						teamCall();
						listCall(1);
						
					}
					if(reqUrl=="./project/teamdel"){
						alert("팀원을 철회하셨습니다.");
						teamCall();
						listCall(1);
					}
					if(reqUrl=="./project/applyno"){
						listCall(showPage);
					}
					if(reqUrl=="./project/applyinto"){
						alert("파트너신청을 하였습니다.");
						location.href="./projectdetail?idx="+"${detail.project_idx}";
					}
					if(reqUrl=="./project/applyout"){
						alert("파트너신청을 취소하였습니다.");
						location.href="./projectdetail?idx="+"${detail.project_idx}";
					}
					if(reqUrl=="./project/teamCall"){
						teamlist(d.teamlist);
					}
				},
				error:function(e){
					alert("아작스 결과값 에러");
					//location.href="./projectdetail?idx="+"${detail.project_idx}";
					console.log(e);
				}
			});
		}
		
		function sendAjax(reqUrl, reqData){
			console.log(reqUrl, reqData);
			$.ajax({
				url:reqUrl,
				type:"post",
				data:reqData,
				dataType:"json",
				success:function(d){
					console.log(d);
					if(reqUrl=="./project/repleinsert"){
						console.log("성공번호="+d.success);
						if(d.success==1){
							$("#replecontent").val("");
							//showPage = d.currPage;
							//replePrint(d.replelist);
							//pagingPrint(d.currPage, d.range);
							location.href="./projectdetail?idx="+"${detail.project_idx}";
							
						}else{
							alert("댓글등록에 문제가 있었습니다.");
						}
					}	
					if(reqUrl=="./project/repleCall"){
						
						showPage = d.currPage;
						replePrint(d.replelist);
						//pagingPrint(d.currPage, d.range);
						
						$('#replepagination').twbsPagination({
							startPage: d.currPage,	//시작 페이지
							totalPages: d.range,	//총 페이지 갯수
							visiblePages: 5,	//가로로 보여줄 페이징처리 갯수
							onPageClick: function (event, page) {
								console.log("페이징이벤트"+event);
								console.log("페이징페이지"+page);
								repleCall(page);
							}
						});
					}
					if(reqUrl=="./project/repleupdate"){
						alert("댓글을 수정하였습니다.");
						location.href="./projectdetail?idx="+"${detail.project_idx}";
						
						
					}
					if(reqUrl=="./project/repledel"){
						if(d.success == 1){
							alert("댓글을 삭제하였습니다.");
							location.href="./projectdetail?idx="+"${detail.project_idx}";
						}else{
							alert("댓글삭제에 실패 했습니다.");
						}
					}
				},
				error:function(e){
					alert("문제가 있으니 확인후 다시 해주세요.");
					console.log(e);
				}
			});
		}
		
	</script>
</html>