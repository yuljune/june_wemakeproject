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
    	.content_area{
    		width: 1100px;
    		margin: 0 auto;
    		z-index: 90;
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
		img {
		    display: inline-block;
		    border: 0 none;
		    vertical-align: top;
		}
		.login_wrap .stit {
		    font-size: 13px;
		    color: #666;
		    line-height: 22px;
		    margin-top: 10px;
		}
		.login_wrap .login_box {
		    width: 100%;
		    background: #f8f8fa;
		    border-top: 1px solid #222;
		    margin-top: 15px;
		}
		div {
		    display: block;
		}
		li {
		    list-style-type: none;
		}
		li {
		    display: list-item;
		    text-align: -webkit-match-parent;
		}
		.login_wrap .login_box fieldset ul li span {
		    padding-left: 10px;
		    background: url(./resources/img/icon_arrow.png) no-repeat left center;
		    font-size: 15px;
		    color: #222;
		    width: 100px;
		    text-align: left;
		}
		a, label, span, strong, button{
			display: inline-block;
		}
		.login_wrap .login_box fieldset ul li .inputTxt01 {
		    line-height: 53px;
		    height: 53px;
		    width: 340px;
		    padding: 0 10px;
		    border: 1px solid #e0e0e0;
		    background-color: #fbfbfb;
		    color: #666;
		    font-size: 14px;
		}
		.login_wrap .login_box fieldset a.loginBtn {
		    width: 132px;
		    height: 116px;
		    background: #4152ac;
		    color: #fff;
		    line-height: 116px;
		    font-size: 16px;
		    font-weight: 900;
		    vertical-align: top;
		    margin-left: 3px;
		    text-decoration: none;
		}
		.login_wrap .login_box fieldset {
		    overflow: hidden;
		    margin: 0 auto;
		    margin-top: 50px;
		}
		.login_wrap .login_box fieldset .btn_wrap .join {
		    display: inline-block;
		    margin-top: 35px;
		    padding-left: 25px;
		    background: url(./resources/img/icon_id.png) no-repeat left 6px;
		    font-size: 14px;
		    line-height: 22px;
		    color: #666;
		    text-align: left;
		    zoom: 1;
		}
		.login_wrap .login_box fieldset .btn_wrap {
		    height: 105px;
		    border-top: 1px solid #e0e0e0;
		    border-bottom: 1px solid #e0e0e0;
		    background: #fff;
		    margin-top: 40px;
		    text-align: center;
		}
		.login_wrap .login_box fieldset .btn_wrap .joinBtn {
		    width: 90px;
		    height: 33px;
		    line-height: 33px;
		    font-size: 11px;
		    color: #fff !important;
		    text-align: center;
		    background-color: #b4b4b4;
		    border-radius: 2px;
		    vertical-align: middle;
		    text-decoration: none;
		}
		.login_wrap .login_box fieldset .btn_wrap .lostId {
		    display: inline-block;
		    margin-left: 50px;
		    margin-top: 35px;
		    padding-left: 25px;
		    background: url(./resources/img/icon_lost.png) no-repeat left 6px;
		    font-size: 14px;
		    line-height: 22px;
		    color: #666;
		    text-align: left;
		    zoom: 1;
		}
		legend {
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 0;
		    height: 0;
		    overflow: hidden;
		    visibility: hidden;
		    font-size: 0;
		    line-height: 0;
		    padding: 0;
		}
		legend {
		    display: block;
		    -webkit-padding-start: 2px;
		    -webkit-padding-end: 2px;
		    border-width: initial;
		    border-style: none;
		    border-color: initial;
		    border-image: initial;
		}
		.login_wrap .login_box fieldset a.loginBtn {
		    width: 132px;
		    height: 116px;
		    background: #4152ac;
		    color: #fff;
		    line-height: 116px;
		    font-size: 16px;
		    font-weight: 900;
		    vertical-align: top;
		    margin-left: 3px;
		    text-decoration: none;
		}
    </style>
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    <div id="contents_area">
    	<h3>로그인</h3>
    	<div class="login_wrap">
    	<p class="tit">
    		<img src="./resources/img/login_tit.png" alt="Login">
      	</p>
      	<p class="stit">We Make Project 홈페이지를 방문해 주셔서 감사합니다. 아이디와 비밀번호를 입력해 주세요.</p>
    	<div class="login_box">
	    <form action="login" method="post" id="login">
	   		<fieldset>
	   			<legend>로그인</legend>
	   			<ul>
	   				<li>
	   					<label for="memberId">
	   						<span>아이디</span>
	   					</label>
	   					<input id="idText" class="inputTxt01" type="text" name="user_id" style="margin-bottom:6px;">
	   				</li>
	   				<li>
	   					<label for="memberPwd">
	   						<span>비밀번호</span>
	   					</label>
	   					<input id="passwordText" class="inputTxt01" type="password" name="user_pw"/>
	   				</li>
	   			</ul>
	   			<a onclick="login()" class="loginBtn">로그인</a>
	   			<div class="btn_wrap">
	   				<p class="join">
	   					"회원가입화면으로 이동합니다. "
	   					<a href="joinForm" class="joinBtn">회원가입</a>
	   				</p>
	   				<p class="lostId">
	   					"아이디와 비밀번호를 잊으셨나요? "
	   					<a href="membershipFind" class="joinBtn">ID/PW 찾기</a>
	   				</p>
				</div>    	
	    	</fieldset>
	    </form>
	    </div>
	    </div>
	    </div>
    </body>
    <script>
    	function login(){
    		$("#login").submit();
    	}
    
	    var msg= "${msg}";
	
		if(msg != ""){
			alert(msg);
		}
    </script>
</html>