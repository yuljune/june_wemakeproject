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
    	.mypage_wrap .mypage_right {
		    float: left;
		    position: relative;
		    width: 850px;
		    margin-left: 51px;
		    margin-bottom: 50px;
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
		#contents_area h3 {
		    position: relative;
		    color: #222;
		    font-size: 32px;
		    font-weight: 700;
		    line-height: 36px;
		    margin-top: 50px;
		    margin-bottom: 30px;
		}
		.mypage_wrap .mypage_right > h3 {
		    font-size: 32px;
		    font-weight: 700;
		    color: #222;
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
		.mypage_wrap .mypage_right > .profile_wrap {
		    width: 800px;
		    height:455px;
		    min-height: 276px;
		    background-color: #fbfbfb;
		    border: 1px solid #e0e0e0;
		    margin-left: 100px;
		}
		div {
		    display: block;
		}
		.mypage_wrap .mypage_right > .profile_wrap > .name {
		    float: left;
		    font-size: 26px;
		    line-height: 32px;
		    color: #222;
		    font-weight: 700;
		    margin-top: 45px;
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
		.mypage_wrap .mypage_right > .profile_wrap > .cont_box > li.first {
		    width: 198px;
		    margin-right: 20px;
		}
		.mypage_wrap .mypage_right > .profile_wrap > .cont_box > li {
		    float: left;
		    font-size: 14px;
		    color: #222;
		    padding-left: 10px;
		    background: url(./resources/img/icon_dot.gif) no-repeat left center;
		    margin-bottom: 15px;
		}
		li {
		    list-style-type: none;
		}
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		.mypage_wrap .mypage_right > .profile_wrap > .cont_box > li.second {
		    width: 155px;
		    margin-right: 20px;
		}
		.mypage_wrap .mypage_right > .profile_wrap > .cont_box > li {
		    float: left;
		    font-size: 14px;
		    color: #222;
		    padding-left: 10px;
		    background: url(./resources/img/icon_dot.gif) no-repeat left center;
		    margin-bottom: 15px;
		}
		li {
		    list-style-type: none;
		}
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
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
		    color: -webkit-link;
		    cursor: auto;
		    text-decoration: underline;
		}
		.mypage_wrap .mypage_right > .profile_wrap > .btn_wrap > .mypage_btn01 {
		    width: 274px;
		    height: 44px;
		    line-height: 44px;
		    background: #4957a0 url(./resources/img/icon_arrow01.png) no-repeat 245px center;
		}
		.mypage_wrap .mypage_right > .profile_wrap > .btn_wrap > .mypage_btn02 {
		    width: 274px;
		    height: 44px;
		    line-height: 44px;
		    background: #bbb url(./resources/img/icon_arrow01.png) no-repeat 245px center;
		}
		.mypage_wrap .mypage_right > .profile_wrap > .btn_wrap > .mypage_btn02 > span {
		    color: #fff;
		    padding-left: 20px;
		    background: url(./resources/img/icon_identity_on.png) no-repeat left center;
		    margin-left: 20px;
		}
		a, label, span, strong, button {
		    display: inline-block;
		}
		.mypage_wrap .mypage_right > .profile_wrap > .btn_wrap > .mypage_btn01 > span {
		    color: #fff;
		    padding-left: 20px;
		    background: url(./resources/img/icon_modify.png) no-repeat left center;
		    margin-left: 20px;
		}
		a, label, span, strong, button {
		    display: inline-block;
		}
		.name{
			margin-top: 50px;
		}
		.mypage_btn01{
			margin-bottom: 10px;
			margin-right: 10px;
		}
		.namebox{
			font-size:30px;
			margin-top: 20px;
			margin-left:250px;
			margin-bottom: 20px;
		}
		.cont_box{
			margin-left:250px;
		}
		.btn_wrap{
			margin-left:250px;
		}
    </style>
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    <div id="contents_area">
    <div class="mypage_wrap">
    <div class="mypage_right">
        <h3>마이페이지 메인</h3>
        <div class="profile_wrap">
        <div class="namebox">
        <p class="name">${myPage.user_name} (${myPage.user_id })</p>
        </div>
        <ul class="cont_box">
        	<li class="first">신분 : ${myPage.user_type}</li>
        	<li class="second">소속 : ${myPage.assign}</li>
        </ul>
        <div class="btn_wrap">
        	<a onclick="location.href='membershipUpdate?user_id=${sessionScope.loginId}'" class="mypage_btn01"><span>개인정보수정</span></a>
        	<a onclick="location.href='membershipProject?user_id=${sessionScope.loginId}'" class="mypage_btn01"><span>나의 프로젝트</span></a><br>
        	<a onclick="location.href='membershipQna?user_id=${sessionScope.loginId}'" class="mypage_btn01"><span>나의 QnA</span></a>
        	<c:if test="${myPage.user_type eq '멘토'}">
        		<a onclick="location.href='mentoProject?user_id=${sessionScope.loginId}'" class="mypage_btn01"><span>멘토링 프로젝트</span></a><br>
        	</c:if>
        	<a onclick="location.href='membershipDrop'" class="mypage_btn02 mg15"><span>회원탈퇴</span></a>
        </div>
        </div>
        </div>
        </div>
        </div>
    </body>
    <script>

    </script>
</html>