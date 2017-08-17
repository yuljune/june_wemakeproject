<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
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
    <style>
    	#contents_area {
		    width: 1100px;
		    margin: 0 auto;
		    z-index: 90;
		}
		div {
		    display: block;
		}
		#contents_area h3 {
		    position: relative;
		    color: #222;
		    font-size: 32px;
		    font-weight: 700;
		    line-height: 36px;
		    margin-top: 50px;
		    margin-bottom: 30px;
		}
		h1, h2, h3, h4, h5, h6 {
		    margin: 0;
		    font-size: 1em;
		    font-weight: normal;
		}
		h1, h2, h3, h4, h5, h6, input, button, textarea {
		    font-size: 0.75em;
		    line-height: 14px;
		    font-family: 'Nanum Gothic', 'NanumGothic', '나눔고딕', '돋움', dotum, sans-serif;
		}
		h3 {
		    display: block;
		    font-size: 1.17em;
		    -webkit-margin-before: 1em;
		    -webkit-margin-after: 1em;
		    -webkit-margin-start: 0px;
		    -webkit-margin-end: 0px;
		    font-weight: bold;
		}
		.project_list_wrap {
		    position: relative;
		    display: inline-block;
		    width: 50%;
		    z-index: 1;
		}
		.mgt65 {
		    margin-top: 65px !important;
		}
		div {
		    display: block;
		}
		body {
		    margin: 0;
		    padding: 0;
		    font-size: 13px;
		    line-height: 14px;
		    color: #535353;
		    font-family: 'Nanum Gothic', 'NanumGothic', '나눔고딕', '돋움', dotum, sans-serif;
		}
		.project_list_wrap > ul {
		    width: 100%;
		}
		dd, dl, ol, ul, form {
		    margin: 0;
		    padding: 0;
		}
		
		ul, menu, dir {
		    display: block;
		    list-style-type: disc;
		    -webkit-margin-before: 1em;
		    -webkit-margin-after: 1em;
		    -webkit-margin-start: 0px;
		    -webkit-margin-end: 0px;
		    -webkit-padding-start: 40px;
		}
		.project_list_wrap > ul > li.odd {
		    margin-right: 46px;
		}
		.project_list_wrap > ul > li {
		    float: left;
		    width: 527px;
		    border-top: 1px solid #222;
		    margin-bottom: 60px;
		}
		li {
		    list-style-type: none;
		}
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		.mgb30 {
		    margin-bottom: 30px !important;
		}
		.mgt30 {
		    margin-top: 30px !important;
		}
		dd, dl, ol, ul, form {
		    margin: 0;
		    padding: 0;
		}
		ol ul, ul ol, ul ul, ol ol {
		    -webkit-margin-before: 0px;
		    -webkit-margin-after: 0px;
		}
		ul ul, ol ul {
		    list-style-type: circle;
		}
		ul, menu, dir {
		    display: block;
		    list-style-type: disc;
		    -webkit-margin-before: 1em;
		    -webkit-margin-after: 1em;
		    -webkit-margin-start: 0px;
		    -webkit-margin-end: 0px;
		    -webkit-padding-start: 40px;
		}
		.project_list_wrap > ul > li > ul > li.tit {
		    font-size: 18px;
		    color: #222;
		    line-height: 24px;
		    font-weight: 700;
		    margin: 0 10px 0 10px;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    white-space: nowrap;
		}
		li {
		    list-style-type: none;
		}
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		.project_list_wrap > ul > li > ul > li.tit > a {
		    color: #222;
		    display: block;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    white-space: nowrap;
		}
		a:visited {
		    color: #535353;
		}
		a:link {
		    color: #535353;
		}
		a {
		    text-decoration: none;
		    cursor: pointer;
		}
		a, label, span, strong, button {
		    display: inline-block;
		}
		a:-webkit-any-link {
		    color: white;
		    cursor: auto;
		    text-decoration: none;
		}
		.project_list_wrap > ul > li > ul > li.cont {
		    font-size: 14px;
		    color: #666;
		    line-height: 20px;
		    margin: 10px 10px 0 10px;
		}
		li {
		    list-style-type: none;
		}
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		.project_list_wrap > ul > li > ul > li.date {
		    font-size: 14px;
		    color: #666;
		    line-height: 20px;
		    margin: 7px 10px 0 10px;
		}
		li {
		    list-style-type: none;
		}
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		.project_list_wrap > ul > li > div {
		    overflow: hidden;
		}
		div {
		    display: block;
		}
		.project_list_wrap > ul > li > div > p.ing_icon02 {
		    float: left;
		    background-color: #8c54b3;
		    width: 91px;
		    height: 48px;
		    text-align: center;
		}
		p {
		    margin: 0;
		}
		p {
		    display: block;
		    -webkit-margin-before: 1em;
		    -webkit-margin-after: 1em;
		    -webkit-margin-start: 0px;
		    -webkit-margin-end: 0px;
		}
		.project_list_wrap > ul > li > div > p.ing_icon02 > span {
		    color: #fff;
		    font-size: 12px;
		    height: 16px;
		    background: url(./resources/img/icon_ing02.png) no-repeat left 0px;
		    padding-left: 20px;
		    margin-top: 17px;
		}
		a, label, span, strong, button {
		    display: inline-block;
		}
		.project_list_wrap > ul > li > div > p.cate {
		    float: left;
		    background-color: #eaeaea;
		    width: 169px;
		    height: 48px;
		}
		p {
		    margin: 0;
		}
		p {
		    display: block;
		    -webkit-margin-before: 1em;
		    -webkit-margin-after: 1em;
		    -webkit-margin-start: 0px;
		    -webkit-margin-end: 0px;
		}
		.project_list_wrap > ul > li > div > p.type {
		    float: left;
		    background-color: #f3f3f3;
		    width: 257px;
		    height: 48px;
		    padding-left: 10px;
		}
		p {
		    margin: 0;
		}
		p {
		    display: block;
		    -webkit-margin-before: 1em;
		    -webkit-margin-after: 1em;
		    -webkit-margin-start: 0px;
		    -webkit-margin-end: 0px;
		}
		.project_list_wrap > ul > li > div > p.ing_icon01 {
		    float: left;
		    background-color: #4152ac;
		    width: 91px;
		    height: 48px;
		    text-align: center;
		}
		p {
		    margin: 0;
		}
		p {
		    display: block;
		    -webkit-margin-before: 1em;
		    -webkit-margin-after: 1em;
		    -webkit-margin-start: 0px;
		    -webkit-margin-end: 0px;
		}
		.project_list_wrap > ul > li > div > p.ing_icon01 > span {
		    color: #fff;
		    font-size: 12px;
		    height: 16px;
		    background: url(./resources/img/icon_ing01.png) no-repeat left 0px;
		    padding-left: 20px;
		    margin-top: 17px;
		}
		a, label, span, strong, button {
		    display: inline-block;
		}
		.project_list_wrap > ul > li > div > p.ing_icon03 {
		    float: left;
		    background-color: #1c8cd3;
		    width: 91px;
		    height: 48px;
		    text-align: center;
		}
		p {
		    margin: 0;
		}
		p {
		    display: block;
		    -webkit-margin-before: 1em;
		    -webkit-margin-after: 1em;
		    -webkit-margin-start: 0px;
		    -webkit-margin-end: 0px;
		}
		.project_list_wrap > ul > li > div > p.ing_icon03 > span {
		    color: #fff;
		    font-size: 12px;
		    height: 16px;
		    background: url(./resources/img/icon_ing03.png) no-repeat left 0px;
		    padding-left: 20px;
		    margin-top: 17px;
		}
		a, label, span, strong, button {
		    display: inline-block;
		}
		.ldk{
			margin-left: 30px;
			background: url(./resources/img/icon_identity_on.png) no-repeat left 0px;
		}
		.ldk2{
			margin-left: 30px;
		}
		a:hover {
		    color: white;
		    text-decoration: none;
		}	
    </style>
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    <div id="contents_area">
        <h3>멘토링 프로젝트</h3>
        <div class="project_list_wrap mgt65">
        	<input type="hidden" name="user_id" id="user_id" value="${sessionScope.loginId }"/>
        	<c:forEach items="${mentoProject}" var="mentoProject">
        		<ul class="dkdk">
	    		<li class="odd">
	    			<ul class="mgt30 mgb30">
	    				<li class="tit">
		        	<a href="projectdetail?idx=${mentoProject.project_idx }">${mentoProject.subject}</a>
			    				</li>
			    				<li class="cont">시작일   ${mentoProject.begin_date}</li>
			    				<li class="date">종료일   ${mentoProject.end_date}</li>
			    			</ul>
			    	<div>
			    		<c:if test="${mentoProject.condition == '진행중'}">
			    			<p class="ing_icon02">
			    				<span> ${mentoProject.condition}</span>
			    			</p>
			    			<p class="ing_icon02 ldk">
	    						<span><a href="projectTeamBoardMove?project_idx=${mentoProject.project_idx }">팀게시판</a></span>
	    					</p>
			    		</c:if>
			    		<c:if test="${mentoProject.condition == '모집중'}">
			    			<p class="ing_icon01">
			    				<span> ${mentoProject.condition}</span>
			    			</p>
			    		</c:if>
			    		<p class="ing_icon02 ldk2">
			    			<span><a onclick="mentoDelete()">멘토링 취소</a></span>
			    		</p>
			    	</div>
			    	</li>
			    	</ul>
	    	</c:forEach>
        </div>
    </div>	
    </body>
    <script>
    	function mentoDelete(){
    		if(confirm("멘토링 참여를 취소 하시겠습니까?") == true){
    			location.href="mentoDelete?user_id=${sessionScope.loginId}";		
    		}else{
    			return;
    		}
    	}	
    
    </script>
</html>