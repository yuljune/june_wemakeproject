<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/js/twbsPagination.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	
	<title>Insert title here</title>
	<style>
		body {
			margin:0;
			padding:0;
			font-size:13px;
			line-height:14px;
			color:#535353;
			font-family: 'Nanum Gothic', 'NanumGothic', '나눔고딕', '돋움', dotum, sans-serif;
		}
		a,button{
			cursor: pointer;
		}
		
		h1,h2,h3,h4,h5,h6,input,textarea {
			font-size:0.75em;
			line-height:14px;
			font-family: 'Nanum Gothic', 'NanumGothic', '나눔고딕', '돋움', dotum, sans-serif;
		}
		
		header,footer,section,article,aside,nav,hgroup,details,menu,figure,figcaption
		{display:block;}
		
		img {
			display:inline-block;
			border:0 none;
			vertical-align:top;
		}
		
		a, label, span, strong, button { 
			display:inline-block; /*a의 글씨가 뚝뚝 떨어지지 않고 모여 뭉쳐있게 만들기*/
		}
		h1, h2, h3, h4, h5, h6 {
			margin:0;
			font-size:1em;
			font-weight:normal;
		}
		
		p {margin:0;}
		hr {display:none;}
		
		dd, dl, ol, ul, form {
			margin:0;
			padding:0;
		}
		
		li {
			list-style-type:none;
		}
		
		input, select,textarea {
			font-size:12px;
			line-height:14px;
			padding:0;
			margin:0;
			vertical-align:middle;
		}
		label, button {
			cursor:pointer;
		}
		
		
		html, body {width:100%; height:100%; min-width:1100px;}
		#headerWrap {position:relative; width:100%; display:block; height:98px; background-color:#fff; .z-index:100;}
		#header {position:relative;	width:1100px; height:98px; margin:0 auto; .z-index:110;}
		
		#header_main {position:relative;	width:1120px; height:98px; margin:0 auto; .z-index:110;}
		#header_main h1 {position:absolute; top:30px; left:43px; z-index:99999;}
		#header_main .top_menu {position:absolute; top:19px; right:87px; z-index:99999; text-align:center; width:202px;}
		#header_main .top_menu ul {display:inline-block; zoom:1; .display:inline;}
		#header_main .top_menu ul li {float:left; padding:0 9px 0 8px; background:url(../images/common/top_menu_line.gif) no-repeat left center;}
		#header_main .top_menu ul li.none {background:none;}
		#header_main .top_menu ul li a {font-size:12px; color:#555; line-height:1em; text-decoration:none;}
		#header_main .search {position:absolute; top:45px; right:87px; width:202px; z-index:99999;}
		#header_main .search .inputsch {float:left; width:140px; height:32px; padding-left:20px; line-height:30px; border:0; background:url(../images/common/top_search_bg.png) no-repeat;}
		#header_main .search .btnSearch {float:left;}
		#header_main .btn_wrap {position:absolute; top:0; left:50%; margin-left:546px; width:54px; height:98px; right:0; z-index:99999; }
		#header_main .btn_wrap .popup_btn {position:relative; display:inline-block; float:left; width:54px; height:49px; background:url(../images/main/popup_off.gif) no-repeat;} /*20160831수정*/
		#header_main .btn_wrap .popup_btn a {text-indent:-99999px; width:54px; height:49px; overflow:hidden;}
		#header_main .btn_wrap .popup_btn.open {position:relative; display:inline-block; width:54px; height:49px; background:url(../images/main/popup_on.gif) no-repeat; cursor:pointer;}/*20160831수정*/
		#header_main .btn_wrap .popup_btn2 {position:relative; display:inline-block; float:left; width:54px; height:49px; background:url(../images/main/popup_on.gif) no-repeat;}/*20160831수정*/
		#header_main .btn_wrap .popup_btn2 a {text-indent:-99999px; width:54px; height:49px; overflow:hidden;}
		#header_main .btn_wrap .popup_btn2.open {position:relative; display:inline-block; width:54px; height:49px; background:url(../images/main/popup_off.gif) no-repeat; cursor:pointer;}/*20160831수정*/
		#header_main .btn_wrap .total_btn {position:relative; width:54px; height:49px; margin:0;}
		#header_main .btn_wrap .total_btn img {position:relative; float:left; width:54px;}
		
		
		/* gnb */
		#gnb_main{position:absolute; width:100%; height:98px; overflow:hidden; top:0; left:0; z-index:100;}
		#gnb_main > ul{position:absolute; display:inline-block; padding:0; left:50%; margin-left:-285px; }
		#gnb_main > ul > li{float:left; padding:50px 80px 30px 0;} /*메뉴바의 글자 간격*/
		#gnb_main > ul > li > a{display:block; font-size:18px; font-weight:700; line-height:1em; color:#222; text-decoration:none;}
		#gnb_main > ul > li > a:hover {text-decoration:none;}
		#gnb_main > ul > li > ul.snum01{position:absolute; top:98px; width:224px; height:265px; padding:0; border-left:1px solid #e2e2e2; margin-left:-45px;}
		#gnb_main > ul > li > ul.snum02{position:absolute; top:98px; width:224px; height:265px; padding:0; border-left:1px solid #e2e2e2; margin-left:46px;}
		#gnb_main > ul > li > ul.snum03{position:absolute; top:98px; width:224px; height:265px; padding:0; border-left:1px solid #e2e2e2; margin-left:119px;}
		#gnb_main > ul > li > ul.snum04{position:absolute; top:98px; width:224px; height:265px; padding:0; border-left:1px solid #e2e2e2; margin-left:193px;}
		#gnb_main > ul > li > ul > li.tit > a {margin:29px 0 10px 25px; color:#4152ac; font-size:16px; font-weight:700; text-decoration:none;}
		#gnb_main > ul > li > ul > li.smenu > a {margin:0 0 0 25px; color:#222; font-size:14px; text-decoration:none;}
		#gnb_main > ul > li > ul > li.smenu > a:hover {text-decoration:underline;}
		#gnb_main > ul > li > ul > li.ssmenu > a {margin:0 0 0 35px; padding-left:10px; color:#222; font-size:14px; text-decoration:none; background:url(../images/common/gnb_icon_arrow.png) no-repeat left center;}
		#gnb_main > ul > li > ul > li.ssmenu > a:hover {text-decoration:underline;}
		#gnb_main > ul > li > ul > li > a{display:block;line-height:30px}
		#gnb_main > .etc {position:absolute; top:98px; width:221px; height:265px; left:50%; margin-left:-550px;}
		#gnb_main > .etc > .slogan {margin:35px 0 0 11px;}
		#gnb_main > .etc > .btn01 {margin:46px 0 0 2px;}
		#gnb_main > .etc > .btn02 {margin:5px 0 0 2px;}
	</style>
	</head>
	<body>
	<input type="hidden" value="${sessionScope.loginId}" name="user_id" id="user_id"/>
		<header id="headerWrap">
		<div id="header_main">
			<h1><a href="mainMove?user_id=${sessionScope.loginId}" style="z-index: 2"><img class="mainlogo" src="resources/img/wevicetoo.png" style="margin-top: -24px; width: 142px;"  alt="로고" /></a></h1>
			<nav class="top_menu">
				<c:if test="${sessionScope.loginId == null}">
					<ul>
						<li><a href="loginForm">로그인</a><span style="margin-left: 2px; margin-right: -32px;">|</span></li>
	                	<li><a href="joinForm">회원가입</a><span style="margin-left: 2px; margin-right: -20px;">|</span></li>
						<li><a href="">가이드</a></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.loginId != null}">
					<ul>
						<li><a href="logout">로그아웃</a><span style="margin-left: 2px; margin-right: -32px;">|</span></li>
	                	<li><a href="myPage?user_id=${sessionScope.loginId}">마이페이지</a><span style="margin-left: 2px; margin-right: -20px;">|</span></li>
						<li><a href="">가이드</a></li>
					</ul>
				</c:if>
			</nav>
			
			
		</div>
		<nav id="gnb_main" style="background:url(resources/img/gnb_bg.png) no-repeat center 98px;">
			<div class="etc">
				<br/><br/><br/>
				<span style="font-size: 14px;">
				대한민국 인재를 키우는 힘
				<br/><br/>위메프
				</span>
				<!-- <p class="slogan"><img src="resources/img/Global.jpg" width=180 height=100/></p> -->
				
			</div>
			<ul>
				<li style=""><a href="#">소개</a>
					<ul class="snum01">
						<li class="tit"><a href="#">소개</a></li>
						<li class="smenu"><a href="#">소개글</a></li>
						<li class="smenu"><a href="#">개요</a></li>
						<li class="smenu"><a href="#">연혁</a></li>
						<li class="smenu"><a href="#"></a></li>
						
					</ul>
				</li>
				<li><a href="projectmain">프로젝트</a>
					<ul class="snum02">
						<li class="tit"><a href="projectmain">프로젝트</a></li>
						<li class="smenu"><a href="projectmain">프로젝트 목록</a></li>
						<li class="smenu"><a href="outputBoard">프로젝트 결과물</a></li>
					</ul>
				</li>
				<li><a href="QnABoard">커뮤니티</a>
					<ul class="snum03">
						<li class="tit"><a href="#">커뮤니티</a></li>
						<li class="smenu"><a href="QnABoard">지식QnA</a></li>
					</ul>
				</li>
				<li><a href="noticeBoard">공지사항</a>
					<ul class="snum04">
						<li class="tit"><a href="noticeBoard">공지사항</a></li>
						<li class="smenu"><a href="noticeBoard">공지사항</a></li>						
						<li class="smenu"><a href="exhibitBoard">공모소식</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header>
	<!-- 세션 있을시  -->
	<!-- 세션 없을시 나누기 -->
	
	</body>
	<script>
	// GNB
	var $gnb = $('#gnb_main');
	var $gnbLi = $gnb.find('> ul > li');

	$gnbLi.hover(function(){
		$gnbLi.removeClass('current');
		$(this).addClass('current');
		$gnb.stop().animate({height:"380px"},{duration:300,easing:'easeOutCubic'});
		$('#gnb_main .etc').hover(function(){
			$gnb.stop().animate({height:"380px"},{duration:300,easing:'easeOutCubic'});
		}, function(){
			$gnb.stop().animate({height:"98px"},{duration:300,easing:'easeOutCubic'});
		});
	}, function(){
		$gnbLi.removeClass('current');
		$gnb.stop().animate({height:"98px"},{duration:300,easing:'easeOutCubic'});
		
	});
	$gnbLi.on("focusin",function(){	
		$gnb.stop().animate({height:"380px"},{duration:300,easing:'easeOutCubic'});	
	});
	$gnbLi.on("focusout",function(){		
		$gnb.stop().animate({height:"98px"},{duration:300,easing:'easeOutCubic'});	
	});
	$('#gnb_main .etc').on("focusin",function(){
		$gnb.stop().animate({height:"380px"},{duration:300,easing:'easeOutCubic'});			
	});
		
	
	</script>
</html>