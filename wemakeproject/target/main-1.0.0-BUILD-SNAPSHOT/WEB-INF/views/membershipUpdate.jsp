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
    	.join_wrap {
		    width: 100%;
		    margin-bottom: 60px;
		}
		#contents_area {
		    width: 1100px;
		    margin: 0 auto;
		    z-index: 90;
		}
		div {
		    display: block;
		}
		.bbsWriteA tbody tr:first-child th, .bbsWriteA tbody tr:first-child td {
		    border-top: 0;
		}
		.bbsWriteA > tbody > tr > th {
		    height: 35px;
		    padding: 10px 0 10px 40px;
		    font-weight: 400;
		    color: #222;
		    font-size: 14px;
		    text-align: center;
		    vertical-align: middle;
		    border-top: 1px solid #e4e4e4;
		    background: #fff;
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
		.bbsWriteA tbody tr td .select02 {
		    width: 150px;
		    height: 39px;
		    margin-right: 20px;
		    font-size: 13px;
		    line-height: 22px;
		    border: 1px solid #e0e0e0;
		    padding: 0.7em .5em;
		    font-family: inherit;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		    background: #fbfbfb url(../images/board/icon_select_arrow.png) no-repeat right 10px center;
		}
		input, select, textarea {
		    font-size: 12px;
		    line-height: 14px;
		    padding: 0;
		    margin: 0;
		    vertical-align: middle;
		}
		select:not(:-internal-list-box) {
		    overflow: visible !important;
		}
		select, select[size="0"], select[size="1"] {
		    border-radius: 0px;
		    border-color: rgb(169, 169, 169);
		}
		select {
		    -webkit-appearance: menulist;
		    box-sizing: border-box;
		    align-items: center;
		    white-space: pre;
		    -webkit-rtl-ordering: logical;
		    color: black;
		    background-color: white;
		    cursor: default;
		    border-width: 1px;
		    border-style: solid;
		    border-color: initial;
		    border-image: initial;
		}
		select {
		    border-radius: 5px;
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
		.bbsWriteA tbody tr th span.division {
		    padding-left: 10px;
		    margin-right: 10px;
		    line-height: 18px;
		    background: url(../images/board/icon_view_arrow.png) left 5px no-repeat;
		    color: #222;
		}
		.bbsWriteA tbody tr td .inputTxt01 {
		    line-height: 37px;
		    height: 37px;
		    padding: 0 5px;
		    border: 1px solid #e0e0e0;
		    background-color: #fbfbfb;
		    color: #666;
		    font-size: 14px;
		}
		body {
		    margin: 0;
		    padding: 0;
		    font-size: 13px;
		    line-height: 14px;
		    color: #535353;
		    font-family: 'Nanum Gothic', 'NanumGothic', '나눔고딕', '돋움', dotum, sans-serif;
		}
		.bbsWriteA tbody tr th span.division {
		    padding-left: 10px;
		    margin-right: 10px;
		    line-height: 18px;
		    background: url(./resources/img/icon_view_arrow.png) left 5px no-repeat;
		    color: #222;
		}
		th{
			width:300px;
		}
		.overBtn{
			height:35px;
		}
		.radioBtn{
			margin-left:20px;
		}
		.dkdkdk{
			font-size:17px;
			margin-right: 10px;
		}
		input[type="checkbox"]{
			margin-right: 5px;
			margin-bottom: 5px;
		}
    </style>
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    <div id="contents_area">
        <h3>개인정보수정</h3>
        <div class="join_wrap">
        <input type="hidden" id="user_id" name="user_id" value="${sessionScope.loginId }"/>
        <table class="bbsWriteA" summary="개인정보수정">
        	<tbody>
        		<tr>
        			<th scope="row">
        				<label for="input0101">
        					<span class="division">이름</span>
        				</label>
        			</th>
        			<td>
        				${membershipUpdate.user_name }
        			</td>
        		</tr>
        		<tr>
				<th scope="row">
					<label for="input0101">
						<span class="division">생년월일</span>
					</label>
				</th>
	                <td>
	                    <select id="year" class="select02 year" name="year">
	                        <%for(int i = 2017; i >= 1901; i--){ %>
	                        <option value="<%=i %>"><%=i %></option>
	                        <%} %>
	                    </select>년
	                    <select id="month" name="month" class="select02 month" style="width:55px; margin-right:5px;">
	                        <%for(int i = 1;i <= 12; i++){ %>
	                        <option value="<%=i %>"><%=i %></option>
	                        <%} %>
	                    </select>월
	                    <select id="date" name="date" class="select02 date" style="width:55px; margin-right:5px;">
	                    	<%for(int i = 1;i <= 31; i++){ %>
	                        <option value="<%=i %>"><%=i %></option>
	                        <%} %>
	                    </select>일
	                </td>
            	</tr>
            	<tr>
	                <th scope="row">
						<label for="input0101">
							<span class="division">이메일</span>
						</label>
					</th>
	                <td>
	                	<input type="email" id="email" placeholder="" class="inputTxt01" style="width:200px; color:rgb(102,102,102);"/> @
	                	<input type="text" id="dotcom" class="inputTxt01" style="width:150px; color:rgb(102,102,102);"/>
	                	<select id="address" onchange="addMail(this)" class="select02">
	                		<option id="direct">직접입력</option>
	                		<option id="google" value="google.com">google.com</option>
	                		<option id="naver" value="naver.com">naver.com</option>
	                		<option id="daum" value="daum.net">daum.net</option>
	                		<option id="nate" value="nate.com">nate.com</option>
	                	</select>
	                </td>
            	</tr>
            	<tr>
					<th scope="row">
						<label for="input0101">
							<span class="division">전화번호</span>
						</label>
					</th>
					<td><input type="text" value="${membershipUpdate.phone }" name="phone" id="phone" class="inputTxt01" style="width:60%; color:rgb(102, 102, 102);"/> *번호 입력시 '-'를 제외</td>
				</tr>
				<tr>
				<th scope="row">
					<label for="input0101">
						<span class="division">소속</span>
					</label>
				</th>
				<td><input type="text" value="${membershipUpdate.assign}" name="assign" id="assign" class="inputTxt01" style="width:60%; color:rgb(102, 102, 102);"/> *소속이 없으면 '없음'이라 입력 ex)OO대학교</td>
				</tr>
				<tr>
				<th scope="row">
					<label for="input0101">
						<span class="division">멘토/멘티</span>
					</label>
				</th>
				<td class="radioBtn">
					<input type="radio" class="user_type" name="user_type" value="멘토" <c:if test="${membershipUpdate.user_type eq '멘토'}">checked</c:if> /><span>멘토</span>
					<input type="radio" class="user_type radioBtn" name="user_type" value="멘티" <c:if test="${membershipUpdate.user_type eq '멘티'}">checked</c:if> /><span>멘티</span>
				</td>
			</tr>
			<tr>
				<th scope="row">
					<label for="input0101">
						<span class="division">최종학력</span>
					</label>
				</th>
				<td>
					<select name="grade" id="grade" class="select02">
						<option value="highschool" <c:if test="${membershipUpdate.grade eq 'highschool'}">selected</c:if>>고등학교</option>
						<option value="college" <c:if test="${membershipUpdate.grade eq 'college'}">selected</c:if>>대학(2,3년제)</option>
						<option value="university" <c:if test="${membershipUpdate.grade eq 'university'}">selected</c:if>>대학교(재학, 졸업)</option>
						<option value="master" <c:if test="${membershipUpdate.grade eq 'master'}">selected</c:if>>석사</option>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">
					<label for="input0101">
						<span class="division">기술분야</span>
					</label>
				</th>
			</tr>
			<tr>
				<th scope="row">
					<label for="input0101">
						<span class="division">개발</span>
					</label>
				</th>
				<td>
				<div class="dkdkdk">
					<input type="checkbox" name="skill" value="php"/>php
					<input type="checkbox" name="skill" value="java"/>java
					<input type="checkbox" name="skill" value="python"/>python
					<input type="checkbox" name="skill" value="linux"/>linux
					<input type="checkbox" name="skill" value="C#"/>C#<br>
					<input type="checkbox" name="skill" value="web"/>web
					<input type="checkbox" name="skill" value="html"/>html
					<input type="checkbox" name="skill" value="server"/>server
					<input type="checkbox" name="skill" value="ASP"/>ASP
					<input type="checkbox" name="skill" value="javascript"/>javascript<br>
					<input type="checkbox" name="skill" value="jquery"/>jquery
					<input type="checkbox" name="skill" value="swift"/>swift
					<input type="checkbox" name="skill" value="objective-c"/>objective-c
					<input type="checkbox" name="skill" value="ios"/>ios
					<input type="checkbox" name="skill" value="firebase"/>firebase<br>
					<input type="checkbox" name="skill" value="apachetomcat"/>apachetomcat
					<input type="checkbox" name="skill" value="mssql"/>mssql
					<input type="checkbox" name="skill" value="mysql"/>mysql
					<input type="checkbox" name="skill" value="Oracle"/>Oracle
					<input type="checkbox" name="skill" value="QRcode"/>QRcode
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">
					<label for="input0101">
						<span class="division">디자인</span>
					</label>
				</th>
				<td>
				<div class="dkdkdk">
					<input type="checkbox" name="skill" value="illustrator"/>illustrator
					<input type="checkbox" name="skill" value="photoshop"/>photoshop
					<input type="checkbox" name="skill" value="powerpoint"/>powerpoint
					<input type="checkbox" name="skill" value="storyboard"/>storyboard
					<input type="checkbox" name="skill" value="CI"/>CI<br>
					<input type="checkbox" name="skill" value="BI"/>BI
					<input type="checkbox" name="skill" value="cafe24"/>cafe24
					<input type="checkbox" name="skill" value="CSS"/>CSS
					<input type="checkbox" name="skill" value="html5"/>html5
					<input type="checkbox" name="skill" value="3dmax"/>3dmax<br>
					<input type="checkbox" name="skill" value="sketch"/>sketch
					<input type="checkbox" name="skill" value="corel_draw"/>corel_draw
					<input type="checkbox" name="skill" value="indesign"/>indesign
					<input type="checkbox" name="skill" value="zbrush"/>zbrush
					<input type="checkbox" name="skill" value="BootStrap"/>BootStrap<br>
					<input type="checkbox" name="skill" value="zeplin"/>zeplin
					<input type="checkbox" name="skill" value="js"/>js
					<input type="checkbox" name="skill" value="rhino"/>rhino
					<input type="checkbox" name="skill" value="cad"/>cad
					<input type="checkbox" name="skill" value="responsiveweb"/>responsiveweb
					</div>
				</td>
			</tr>
        	</tbody>
        </table>
        <div class="btnRight mgt30 mgb50">
       		<!-- <input type="button" id="update" value="수정완료"/> -->
			<a class="boardBtn01" onclick="update()" id="update">수정완료</a>
			<a class="boardBtn01" onclick="location.href='myPage?user_id=${sessionScope.loginId}'">MyPage</a>
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
	 	// DB에서 가져온 스킬 나누기
 		var strData = "${membershipUpdate.user_skill}";
 		var arrData = strData.split(',');
 		// 전문분야 DB값 적용
 		var i = 0;
 		$('input:checkbox[name="skill"]').each(function(){
 			if(this.value == arrData[i]){
 				console.log(arrData[i]);
 				$("input:checkbox[value='"+arrData[i]+"']").prop("checked",true);
 				i++;
 			}
 		});
 		// DB에서 가져온 생년월일 배열로 나누기
 		var strBirth = "${membershipUpdate.user_birth}";
 		console.log(strBirth);
 		var arrBirth = strBirth.split('년');
 		var arrBirth1 = arrBirth[1].split('월');
 		var arrBirth2 = arrBirth1[1].split('일');
 		console.log(arrBirth);
 		console.log(arrBirth1);
 		console.log(arrBirth2);
 		// 생년월일 DB값 적용
 		$("select.year option[value='"+arrBirth[0]+"']").attr("selected","selected");
 		$("select.month option[value='"+arrBirth1[0]+"']").attr("selected","selected");
 		$("select.date option[value='"+arrBirth2[0]+"']").attr("selected","selected");
 		// DB에서 가져온 이메일 주소 배열로 나누기
 		var strEmail = "${membershipUpdate.email}";
 		console.log(strEmail);
 		var arrEmail = strEmail.split('@');
 		console.log(arrEmail);
 		// 이메일 DB값 적용
 		$("#email").val(arrEmail[0]);
 		$("#dotcom").val(arrEmail[1]);
 		
 		// 회원정보수정
 		var url;
		var data;
 		function update(){
 		//$("#update").click(function(){
			var skill = document.getElementsByName("skill");
			var len = skill.length;
			var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;
			for(var i=0; i<len; i++){
				if(skill[i].checked == true){
					checkCnt++;        //체크된 체크박스의 개수
					checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 
			for(var i=0; i<len; i++){
				if(skill[i].checked == true){  //체크가 되어있는 값 구분
				checkRow = skill[i].value;
				if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
				rowid += ""+checkRow+"";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
				if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
				rowid += ""+checkRow+"";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{
				rowid += ""+checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
				}
				}
				cnt++;
				checkRow = '';    //checkRow초기화.
			}
			}
			console.log(rowid);
			data={};
			data.id  = $("#user_id").val();
			data.email = $("#email").val()+"@"+$("#dotcom").val();
			data.type = $(".user_type:checked").val();
			data.birth = $("#year").val()+"년"+$("#month").val()+"월"+$("#date").val()+"일";
			data.assign = $("#assign").val();
			data.phone = $("#phone").val();
			data.grade = $("#grade").val();
			data.skill = rowid;
			ajaxCall("./membershipController/membershipInfoUpdate", data);		
 		//});
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
					if(reqUrl=="./membershipController/membershipInfoUpdate"){
						if(d.success == 1){
							alert("수정 완료");
							location.href="myPage?user_id=${sessionScope.loginId}";
						}else{
							alert("수정 실패");
							location.href="redirect:/membershipUpdate";
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