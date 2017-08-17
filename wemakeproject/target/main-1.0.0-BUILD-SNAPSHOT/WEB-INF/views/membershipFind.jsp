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
.join_wrap {
    width: 100%;
    margin-bottom: 60px;
}
div {
    display: block;
}
.join_wrap > .find_box {
    border-top: 1px solid #222;
    border-bottom: 1px solid #e0e0e0;
    text-align: center;
    background: #f8f8fa;
    padding: 30px;
}
div {
    display: block;
}
.join_wrap > .find_box .info_txt {
    font-size: 14px;
    color: #666;
    line-height: 24px;
    text-align: left;
}
.mgb20 {
    margin-bottom: 20px !important;
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
.findWrite {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
}
.mgt20 {
    margin-top: 20px !important;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: grey;
}
caption {
    padding: 0;
    width: 0;
    height: 0;
    overflow: hidden;
    visibility: hidden;
    font-size: 0;
    line-height: 0;
}
caption {
    display: table-caption;
    text-align: -webkit-center;
}
colgroup {
    display: table-column-group;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.findWrite tbody tr th {
    height: 35px;
    padding: 10px 0 10px 20px;
    font-weight: 400;
    color: #222;
    font-size: 14px;
    text-align: left;
    vertical-align: middle;
    border-bottom: 1px dotted #dcdcdc;
}
th, td {
    padding: 0;
    vertical-align: top;
    text-align: left;
    font-weight: normal;
}
th {
    font-weight: bold;
    text-align: -internal-center;
}
td, th {
    display: table-cell;
    vertical-align: inherit;
}
.findWrite tbody tr th span.division {
    padding-left: 10px;
    margin-right: 15px;
    line-height: 18px;
    background: url(./resources/img/icon_view_arrow.png) left 5px no-repeat;
    color: #222;
}
a, label, span, strong, button {
    display: inline-block;
}
.findWrite tbody tr td {
    height: 35px;
    padding: 10px 0;
    line-height: 22px;
    font-size: 14px;
    color: #666;
    vertical-align: middle;
    border-bottom: 1px dotted #dcdcdc;
}
th, td {
    padding: 0;
    vertical-align: top;
    text-align: left;
    font-weight: normal;
}
td, th {
    display: table-cell;
    vertical-align: inherit;
}
.findWrite tbody tr td {
    height: 35px;
    padding: 10px 0;
    line-height: 22px;
    font-size: 14px;
    color: #666;
    vertical-align: middle;
    border-bottom: 1px dotted #dcdcdc;
}
th, td {
    padding: 0;
    vertical-align: top;
    text-align: left;
    font-weight: normal;
}
.findWrite tbody tr td label {
    margin-right: 20px;
}
label, button {
    cursor: pointer;
}
a, label, span, strong, button {
    display: inline-block;
}
label {
    cursor: default;
}
.findWrite tbody tr td .inputTxt01 {
    line-height: 37px;
    height: 37px;
    padding: 0 5px;
    border: 1px solid #e0e0e0;
    background-color: #fbfbfb;
    color: #666;
    font-size: 14px;
}
input, select, textarea {
    font-size: 12px;
    line-height: 14px;
    padding: 0;
    margin: 0;
    vertical-align: middle;
}
h1, h2, h3, h4, h5, h6, input, button, textarea {
    font-size: 0.75em;
    line-height: 14px;
    font-family: 'Nanum Gothic', 'NanumGothic', '나눔고딕', '돋움', dotum, sans-serif;
}
input:not([type]), input[type="email" i], input[type="number" i], input[type="password" i], input[type="tel" i], input[type="url" i], input[type="text" i] {
    padding: 1px 0px;
}
input {
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    user-select: text;
    cursor: auto;
    padding: 1px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
input, textarea, select, button {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 13.3333px Arial;
}
input, textarea, select, button, meter, progress {
    -webkit-writing-mode: horizontal-tb;
}
.findWrite tbody tr td label {
    margin-right: 20px;
}
.mgr5 {
    margin-right: 5px !important;
}
label, button {
    cursor: pointer;
}
a, label, span, strong, button {
    display: inline-block;
}
label {
    cursor: default;
}
a:visited {
    color: #535353;
}
a:link {
    color: #535353;
}
.boardBtn15 {
    width: 160px;
    height: 39px;
    line-height: 39px;
    font-size: 13px;
    color: #fff !important;
    text-align: center;
    background-color: #b4b4b4;
    border-radius: 2px;
    vertical-align: middle;
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
label{
	margin-bottom: 20px;
}
.ldk{
	width:300px;
	margin-left: 634px;
}
    </style>
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    <div id="contents_area">
    	<h3>아이디 찾기</h3>
    	<div class="join_wrap">
    		<div class="find_box">
    			<p class="info_txt_mgb20">
    				"* 아이디 찾기는 회원가입시 입력한 이름, 이메일, 전화번호를 입력하면 아이디가 출력됩니다."<br><br>
    				"* 문의처 032-2828-1818 / amolrang@fy.omg"
    			</p>
    			<table class="findWrite mgt20" summary="게시물 쓰기">
    				<caption>게시물 쓰기</caption>
    				<colgroup>
    					<col width="15%">
    					<col width="85%">
    				</colgroup>
    				<tbody>
    					<tr>
    						<th scope="row">
    							<span class="division">아이디 찾기</span>
    						</th>
    						<td>
    							<span id="idFind">
    								<label>
    									성명 : 
    									<input type="text" class="inputTxt01" id="user_name" name="user_name" placeholder="가입한 회원의 이름" required="required" style="width:110px;"/>
    								</label>
    								<label>
    									이메일 : 
    									<input type="email" id="email" class="inputTxt01" placeholder="" style="width:110px;"/> @
					                	<input type="text" id="dotcom" class="inputTxt01" style="width:100;"/>
					                	<select id="address" onchange="addMail(this)">
					                		<option id="direct">직접입력</option>
					                		<option id="google" value="google.com">google.com</option>
					                		<option id="naver" value="naver.com">naver.com</option>
					                		<option id="daum" value="daum.net">daum.net</option>
					                		<option id="nate" value="nate.com">nate.com</option>
					                	</select>
    								</label>
    								<label class="mgr5">
    									전화번호 : 
    									<input type="text" class="inputTxt01" name="phone" id="phone" style="width:110px;"/>
    								</label>
    								<label>
    									회원님의 아이디 :  
	    								<input type="text" class="inputTxt01" id="yourId" value="" style="width:200px;"/>
	    							</label>
    							</span>
    							<div class="ldk">
    							<a href="#" class="boardBtn15" onclick="findId()" style="width:100px; margin-left:5px;">아이디 찾기</a>
    							</div>
    						</td>
    					</tr>
    				</tbody>
    			</table>
    		</div>
    	</div>
    </div>
    
    <div id="contents_area">
    	<h3>비밀번호 찾기</h3>
    	<div class="join_wrap">
    		<div class="find_box">
    			<p class="info_txt_mgb20">
    				"* 비밀번호 찾기는 회원가입시 입력한 아이디, 이름, 전화번호를 입력하면 재설정이 가능합니다."<br><br>
    			</p>
    			<table class="findWrite mgt20" summary="게시물 쓰기">
    				<caption>게시물 쓰기</caption>
    				<colgroup>
    					<col width="15%">
    					<col width="85%">
    				</colgroup>
    				<tbody>
    					<tr>
    						<th scope="row">
    							<span class="division">비밀번호 찾기</span>
    						</th>
    						<td>
    							<span id="idFind">
    								<label>
    									아이디 : 
    									<input type="text" class="inputTxt01" id="user_id" name="user_id" placeholder="아이디" required="required" style="width:110px;"/>
    								</label>
    								<label>
    									이름 : 
    									<input type="text" class="inputTxt01" id="user_name2" name="user_name" placeholder="이름" required="required" style="width:110px;"/>
    								</label>
    								<label class="mgr5">
    									전화번호 : 
    									<input type="text" class="inputTxt01" name="phone" id="phone2" placeholder="'-'없이 입력" style="width:110px;"/>
    								</label>
    							</span>
    							<div class="ldk">
    							<a href="#" class="boardBtn15" onclick="findPw()" style="width:100px; margin-left:5px;">비밀번호 재설정</a>
    							</div>
    						</td>
    					</tr>
    				</tbody>
    			</table>
    		</div>
    	</div>
    </div>
    </body>
    <script>
 		// 이메일
    	function addMail(elem){
			console.log(elem.value);
			var addr = elem.value;
			if(addr == "직접입력"){
				$("#dotcom").val("");
			}else{
				$("#dotcom").val(addr);
			}
		}
    	var url;
		var data;
		// 아이디 찾기
		function findId(){
 			data = {};
 			data.name = $("#user_name").val();
 			data.email = $("#email").val()+"@"+$("#dotcom").val();
 			data.phone = $("#phone").val();
 			ajaxCall("./membershipController/findId",data);
		}
		// 비밀번호 재설정
 		function findPw(){
			data={};
			data.id = $("#user_id").val();
			data.name = $("#user_name2").val();
			data.phone = $("#phone2").val();
			ajaxCall("./membershipController/membershipRePass",data);
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
					if(reqUrl=="./membershipController/findId"){
						if(d.use == "Y"){
							$("#yourId").val(d.fId);
							$("#user_name").val("");
							$("#email").val("");
							$("#dotcom").val("");
							$("#phone").val("");
						}else{
							alert("존재하지 않는 회원 입니다.");
						}
					}else if(reqUrl == "./membershipController/membershipRePass"){
						if(d.pwok == "Y"){
							window.open("membershipRePw?user_id="+$("#user_id").val()+"","비밀번호 재설정","width=450, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes, top="+(screen.availHeight/2-100)+",left="+(screen.availWidth/2-100)+"");
							$("#user_id").val("");
							$("#user_name2").val("");
							$("#phone2").val("");
							$("#user_name").val("");
							$("#email").val("");
							$("#dotcom").val("");
							$("#phone").val("");
							$("#yourId").val("");
						}else{
							alert("입력하신 정보를 다시 확인해 주세요.");
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