<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>비밀번호 재설정</title>
    
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
		    margin-top: 28px;
		    text-align: center;
		}
		.login_wrap .login_box {
		    width: 400px;
		    background: #f8f8fa;
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
		    margin-left: -30px;
		}
		.login_wrap .login_box fieldset ul li span {
		    padding-left: 10px;
		    background: url(./resources/img/icon_arrow.png) no-repeat left center;
		    font-size: 15px;
		    color: #222;
		    width: 266px;
		    text-align: left;
		}
		a, label, span, strong, button{
			display: inline-block;
			color:white;
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
		    width: 80px;
		    height: 50px;
		    background: #4152ac;
		    color: #fff;
		    line-height: 116px;
		    font-size: 16px;
		    font-weight: 900;
		    vertical-align: top;
		    margin-left: 269px;
		    text-decoration: none;
		}
		.login_wrap .login_box fieldset {
		    overflow: hidden;
		    margin: 0 auto;
		    margin-top: 34px;
		    margin-left: 25px;
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
		    width: 80px;
		    height: 50px;
		    background: #4152ac;
		    color:white;
		    line-height: 51px;
		    font-size: 16px;
		    font-weight: 900;
		    vertical-align: top;
		    margin-left: 269px;
		    text-decoration: none;
		   	text-align: center;
		}
		
    </style>
    </head>
    <body>
    <div id="contents_area">
    	<div class="login_wrap">
    	<input type="hidden" name="user_id" id="user_id" value="${membershipRePw.user_id }">
      	<p class="stit">비밀번호 재설정을 위해 새로운 비밀번호를 입력해 주세요.</p>
    	<div class="login_box">
	   		<fieldset>
	   			<legend>비밀번호 재설정</legend>
	   			<ul>
	   				<li>
	   					<label for="memberId">
	   						<span>비밀번호</span>
	   					</label>
	   					<input id="user_pw" class="inputTxt01" type="password" name="user_pw" style="margin-bottom:6px;">
	   				</li>
	   				<li>
	   					<label for="memberPwd">
	   						<span>비밀번호 확인</span>
	   					</label>
	   					<input id="pwChk" class="inputTxt01" type="password" name="user_pwChk"/>
	   					<span id="matchMsg"></span>
	   				</li>
	   			</ul>
	   			<a onclick="RePassword()" class="loginBtn">확인</a>    	
	    	</fieldset>
	    </div>
	    </div>
	    </div>
    </body>
    <script>
	  	//비밀번호 확인
		$("#pwChk").keyup(function(){
			if($("#user_pw").val() != $("#pwChk").val()){
				$("#matchMsg").html("두개의 비밀번호가 일치 하지 않습니다.");
				$("#matchMsg").css("color","red");
			}else{
				$("#matchMsg").html("비밀번호 사용이 가능 합니다.");
				$("#matchMsg").css("color","green");
				chkSum ++;
			}
			if($("#user_pw").val() == "" || $("#pwChk").val()== ""){
				$("#matchMsg").html("");
			}
		});
		$("#user_pw").keyup(function(){
			if($("#user_pw").val() != $("#pwChk").val()){
				$("#matchMsg").html("두개의 비밀번호가 일치 하지 않습니다.");
				$("#matchMsg").css("color","red");
			}else{
				$("#matchMsg").html("비밀번호 사용이 가능 합니다.");
				$("#matchMsg").css("color","green");
				chkSum ++;
			}
			if($("#user_pw").val() == "" || $("#pwChk").val()== ""){
				$("#matchMsg").html("");
			}
		});
    	var url;
    	var data;
    	function RePassword(){
    		data = {};
    		data.id = $("#user_id").val();
    		data.pw = $("#user_pw").val();
    		
    		ajaxCall("./membershipController/membershipRP",data);
    	}
    	//ajax 실행
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./membershipController/membershipRP"){
						if(d.success == 1){
							alert("비밀번호가 변경 되었습니다.");
							window.close();
						}else{
							alert("비밀번호 변경 실패.");
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