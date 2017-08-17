<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<title>Insert title here</title>
	<style>
		
		#contents_area {width:1100px; margin:0 auto; z-index:90;}
		#contents_area h3 {position:relative; color:#222; font-size:32px; font-weight:700; line-height:36px; margin-top:10px; margin-bottom:30px;}
	    .bbsWriteA {width:100%;  border-bottom:1px solid #222; border-top:1px solid #222; border-collapse:collapse; border-spacing:0; table-layout:fixed;}
		.bbsWriteA > tbody > tr > th {height:35px; padding:10px 0 10px 40px; font-weight:400; color:#222; font-size:14px; text-align:left; vertical-align:middle; border-top:1px solid #e4e4e4; background:#fff;} /*20160729수정*/
		.bbsWriteA tbody tr th.pad0 {padding:10px 0;}
		.bbsWriteA tbody tr th span.division {padding-left:10px; margin-right:10px; line-height:18px; background:url(../images/board/icon_view_arrow.png) left 5px no-repeat; color:#222;}
		.bbsWriteA > tbody > tr > td {height:35px; padding:10px 0; line-height:18px; font-size:14px; color:#666; vertical-align:middle; border-top:1px solid #e4e4e4; background:#fff;} /*20160801수정*/
		.bbsWriteA tbody tr td.pad0{padding:0;}
		.bbsWriteA tbody tr td .inputTxt01 {line-height: 37px; height: 37px; padding: 0 5px; border: 1px solid #e0e0e0; background-color: #fbfbfb; color:#666; font-size:14px;}
		.bbsWriteA tbody tr td .inputDate {line-height: 37px; height: 37px; padding: 0 5px; border-top:1px solid #e0e0e0; border-bottom:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-right:0; background-color: #fbfbfb; color:#666; font-size:14px;}
		.bbsWriteA tbody tr:first-child th, .bbsWriteA tbody tr:first-child td {border-top:0;}
		.bbsWriteA tbody tr td textarea {background-color:#fbfbfb; color:#666; font-size:14px; overflow:auto;}
		.bbsWriteA tbody tr td .select02 {width:150px; height:39px; margin-right:20px; font-size:13px; line-height:22px;  border:1px solid #e0e0e0; padding:0.7em .5em; font-family: inherit;  -webkit-appearance: none; -moz-appearance: none;  appearance: none; background:#fbfbfb url(../images/board/icon_select_arrow.png) no-repeat right 10px center;}
		.bbsWriteA tbody tr td .select0201 {width:150px; height:39px; font-size:13px; line-height:22px;  border:1px solid #e0e0e0; padding:0.7em .5em; font-family: inherit;  -webkit-appearance: none; -moz-appearance: none;  appearance: none; background:#fbfbfb url(../images/board/icon_select_arrow.png) no-repeat right 10px center;}
		.bbsWriteA tbody tr td .select02::-ms-expand {display: none;}
		.bbsWriteA tbody tr th.borderT {border-top:1px solid #222;}
		.bbsWriteA tbody tr td.borderT {border-top:1px solid #222;}
		.bbsWriteA tbody tr td label {margin-right:20px;}
		.bbsWriteA tbody tr td .photo_wrap {width:160px; margin:0 auto;}
		.bbsWriteA tbody tr td .photo_wrap .photo {width:160px; height:186px; margin-bottom:3px;}
		.bbsWriteA tbody tr td .photo_wrap .photo img {width:160px; height:186px;}
		.bbsWriteA tbody tr td .photo_box {width:252px; height:329px; margin:20px auto;}
		.bbsWriteA tbody tr td .photo_box img {width:252px; height:329px;}
		.bbsWriteA tbody tr td .remaining {text-align:right; padding:5px 3px 5px 0;}
		.bbsWriteA tbody tr td .hideInput {margin-top:10px;}
		.bbsWriteA tbody tr td .redC {color:#da5b1c;}
		.bbsWriteA tbody.prjRow {border-top:1px solid #222;}
		.bbsWriteA tbody.prjRow tr:first-child td, .bbsWriteA tbody.prjRow tr:first-child th {border-top:1px solid #222;}
		.bbsWriteA tbody tr td > ul {margin:20px 0 30px 50px; overflow:hidden;} /*20160830추가*/
		.bbsWriteA tbody tr td > ul > li {float:left; width:300px; padding:0 40px 0 50px; font-size:14px; line-height:24px; color:#da5b1c; background:url(resources/img/li_line.gif) repeat-y left top;} /*20160830추가*/
		.bbsWriteA tbody tr td > ul > li:first-child {background:none;} /*20160830추가*/
		
		.bbsWriteA > tbody > tr > td .img-upload {position:relative; width:280px; height:150px; overflow: hidden;    }
		.bbsWriteA > tbody > tr > td .img-upload .upload_box{position:absolute; text-align:center; z-index:1001; width:200px; height:110px; top:20px; left:40px; border-radius:3px;  background:rgba(0, 0, 0, 0.3);}
		.bbsWriteA > tbody > tr > td .img-upload .upload_box label{padding-top:65px;  width:200px; text-align:center; background-size:50%;  background: url(resources/img/icon_plus.png) no-repeat center 27px; display:block; color:#fff}
		.bbsWriteA > tbody > tr > td .img-upload .upload_box > input[type="file"]
		{  /* 파일 필드 숨기기 */
		position:absolute; width:0px; height:0px; padding:0; margin:-1px; overflow:hidden; clip:rect(0,0,0,0); border:0;}
		
		
		.bbsWriteA > tbody > tr > td .img-upload #cma_image{position:absolute; display:block; top:0; left:0; z-index:1;  }
		
		
		.bbsWriteA_in {width:100%; border-collapse:collapse; border-spacing:0; table-layout:fixed;}
		.bbsWriteA_in tbody tr th {height:35px; padding:10px 0 10px 20px; font-weight:400; color:#222; font-size:14px; text-align:left; vertical-align:middle; border-top:1px solid #e4e4e4; border-left:1px solid #e4e4e4; background:#fff;}
		.bbsWriteA_in tbody tr th span.division {padding-left:10px; margin-right:15px; line-height:18px; background:url(../images/board/icon_view_arrow.png) left 5px no-repeat; color:#222;}
		.bbsWriteA_in tbody tr td {height:35px; padding:10px 10px; line-height:18px; font-size:14px; color:#666; vertical-align:middle; border-top:1px solid #e4e4e4; border-left:1px solid #e4e4e4; background:#fff;}
		.bbsWriteA_in tbody tr td .inputTxt01 {line-height: 37px; height: 37px; padding: 0 5px; border: 1px solid #e0e0e0; background-color: #fbfbfb; color:#666; font-size:14px; margin:2px 3px 2px 0;}
		.bbsWriteA_in tbody tr td .inputDate {line-height: 37px; height: 37px; padding: 0 5px; border-top:1px solid #e0e0e0; border-bottom:1px solid #e0e0e0; border-left:1px solid #e0e0e0; border-right:0; background-color: #fbfbfb; color:#666; font-size:14px;}
		.bbsWriteA_in tbody tr:first-child th, .bbsWriteA tbody tr:first-child td {border-top:0;}
		.bbsWriteA_in tbody tr td textarea {background-color:#fbfbfb; color:#666; font-size:14px; overflow:auto;}
		.bbsWriteA_in tbody tr td .select02 {width:150px; height:39px; margin-right:20px; font-size:13px; line-height:22px;  border:1px solid #e0e0e0; padding:0.7em .5em; font-family: inherit;  -webkit-appearance: none; -moz-appearance: none;  appearance: none; background:#fbfbfb url(../images/board/icon_select_arrow.png) no-repeat right 10px center;}
		.bbsWriteA_in tbody tr td .select02::-ms-expand {display: none;}
		.bbsWriteA_in tbody tr td label {margin-right:20px;}
		
		.btnRight {margin-top:20px; text-align:right; position:relative;}
		
		.boardBtn01 {overflow:hidden; text-align:center; font-size:15px; color:#fff !important; text-decoration:none; width:113px; height:49px; line-height:49px; background:#bbb;  margin:0 3px;} 
		.boardBtn01:hover {background-color:#bbb;text-decoration:none;}
		.boardBtn05 {overflow:hidden; text-align:center; font-size:14px; color:#fff !important; text-decoration:none; width:113px; height:49px; line-height:49px; background:#4152ac; margin:0 9px;}
		.boardBtn05:hover {color:#fff !important; text-decoration:none; background:#4152ac url(../images/board/icon_btn_arrow_on.png) no-repeat 90% center;}
		
	</style>
	</head>
	<body>
		<jsp:include page="header.jsp" /><!-- 헤더부분 --><br/><br/>
		<div id="contents_area">
			<h3>프로젝트 등록</h3>
			<form action="projectwrite" id="sendForm" method="post">
			<input type="hidden" id="user_id" name="user_id" value="${sessionScope.loginId}"/>
			<div class="list_box">
				<table class="bbsWriteA">
					
					<colgroup>
						<col width="23%" />
						<col width="77%" />
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">
							<label for="input0101">
							<span class="division">프로젝트명</span>
							</label>
							</th>
							<td><input id="subject" name="subject" class="inputTxt01" style="width: 95%;" type="text" maxlength="100"/></td>
						</tr>
						<tr>
							<th scope="row"><label for="input0102"><span class="division">프로젝트 공고기간</span></label></th>
							<td>
								<input type="date" id="begin_date"> ~ <input type="date" id="end_date">
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="input0103"><span class="division">수행 예상기간</span></label></th>
							<td>
								<input type="date" id="take_start"/> ~ <input type="date" id="take_end"/>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="division">주제영역</span></th>
							<td>
								<input id="kind" name="kind" class="inputTxt01" style="width: 95%;" type="text" maxlength="100" placeholder="ex) 웹,어플리케이션"/>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="input0104"><span class="division">기술분야</span></label></th>
							<td>
								<input type="checkbox" name="skills" value="java"/>java
								<input type="checkbox" name="skills" value="PHP"/>PHP
								<input type="checkbox" name="skills" value="ASP"/>ASP
								<input type="checkbox" name="skills" value="XML"/>XML
								<input type="checkbox" name="skills" value="HTML"/>HTML
								<input type="checkbox" name="skills" value="JSP"/>JSP
								<input type="checkbox" name="skills" value="APM"/>APM
								<input type="checkbox" name="skills" value="Ajax"/>Ajax
								<input type="checkbox" name="skills" value="PERL"/>PERL
								<input type="checkbox" name="skills" value="Rudy"/>Rudy<br>
								<input type="checkbox" name="skills" value="Python"/>Python
								<input type="checkbox" name="skills" value="FLEX"/>FLEX
								<input type="checkbox" name="skills" value="API"/>API
								<input type="checkbox" name="skills" value="Linux"/>Linux
								<input type="checkbox" name="skills" value="C"/>C++
								<input type="checkbox" name="skills" value="Oracle"/>Oracle
								<input type="checkbox" name="skills" value="MySQL"/>MySQL
								<input type="checkbox" name="skills" value="Windows"/>Windows
								<input type="checkbox" name="skills" value="Unix"/>Unix
								<input type="checkbox" name="skills" value="VisualBasic"/>VisualBasic
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="input0107"><span class="division">프로젝트개요<br/>(프로젝트 소개 및 제안 배경)</span></label></th>
							<td>
								<textarea id="summary" name="summary" class="textarea" style="width: 95%; height: 90px;"></textarea>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="input0108"><span class="division">내용</span></label></th>
							<td>
								<textarea id="content" name="content" class="textarea" style="width: 95%; height: 150px;"></textarea>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="input0104"><span class="division">희망구성</span></label></th>
							<td>
								<input type="checkbox" name="hope" value="멘티"/>멘티
								<input type="checkbox" name="hope" value="멘토"/>멘토
								<span style="margin-left:5px;">인원수 : <input id="people" name="people" class="inputTxt01" style="width: 13%; text-align: center;" type="text" maxlength="2"/></span>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="input0111"><span class="division">파일첨부</span></label></th>
							<td>
								<input type="button" onclick="fileUp()" value="파일 올리기" style="padding: 5px;">
								<div id="attach"></div> <!-- 올려놓은 파일 알수있게 -->
							</td>
						</tr>
					</tbody>
				
				</table>
				</div>	
				<input type="hidden" value="모집중"/>
				<div class="btnRight">								
					
					<span style="float:left;"></span>
					 
					<a href="#" class="boardBtn01" onclick="goBack()">취소</a>
					<a id="regist" class="boardBtn05" >등록</a>
					
				</div>	
				</form>
			</div>
	</body>
	<script>
		var msg="${msg}";
		var url;
		var data;
		
		if(msg!=""){
			alert(msg);
		}
		
		function fileUp(){
			//파일 올리기 창 띄우기
			var myWin = window.open("./projectUpload","파일업로드","width=400,height=100");
		}
		function goBack(){ //리스트 페이지로 보내기.
			location.href="./projectmain";
		}
		
		function del(elem){
			console.log(elem.id);
			$.ajax({
				url:"./project/fileDelete",
				type:"get",
				data:{"fileName":elem.id},
				dataType:"json",
				success:function(d){
					console.log(d);
					if(d.success==1){
						//해당 요소가 감싸고 있는 자식요소를 삭제.
						var element = document.getElementById(elem.id);
						element.parentNode.removeChild(element); 
					}
				},
				error:function(e){
					console.log(e);
					
				}
			});
		}
		
		$("#regist").click(function(){
			var skills = document.getElementsByName("skills");
			var hope = document.getElementsByName("hope");
			var len = skills.length;
			var hopelen = hope.length;
			var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;
			
			
			var checkRowh = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnth = 0;        //체크된 체크박스의 개수
			var checkLasth = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var checkhope=""; // 담을 결과.
			var cnth =0;
			
			for(var i=0; i<len; i++){
				if(skills[i].checked == true){
					checkCnt++;        //체크된 체크박스의 개수
					checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 

			for(var i=0; i<len; i++){
				if(skills[i].checked == true){  //체크가 되어있는 값 구분
				checkRow = skills[i].value;
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
			
			for(var i=0; i<hopelen; i++){
				if(hope[i].checked == true){
					checkCnth++;        //체크된 체크박스의 개수
					checkLasth = i;     //체크된 체크박스의 인덱스
				}
			} 

			for(var i=0; i<hopelen; i++){
				if(hope[i].checked == true){  //체크가 되어있는 값 구분
				checkRowh = hope[i].value;
				if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
				checkhope += ""+checkRowh+"";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
				if(i == checkLasth){                     //체크된 체크박스 중 마지막 체크박스일 때,
				checkhope += ""+checkRowh+"";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{
				checkhope += ""+checkRowh+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
				}
				}
				cnth++;
				checkRowh = '';    //checkRow초기화.
			}
			}
			var result = "";
			var str =$("#people").val();
			if($("#subject").val() == ""){
				alert("프로젝트명을 입력해주세요.");
			}else if($("#summary").val() == ""){
				alert("개요를 입력해주세요.");
			}else if($("#kind").val() == ""){
				alert("주제영역을 입력해주세요.");
			}else if($("#content").val() == ""){
				alert("내용을 입력해주세요.");
			}else if($("#begin_date").val() == ""){
				alert("공고기간을 설정해주세요.");
			}else if($("#end_date").val() == ""){
				alert("공고기간을 설정해주세요.");
			}else if($("#take_start").val() == ""){
				alert("수행기간을 정해주세요.");
			}else if($("#take_end").val() == ""){
				alert("수행기간을 정해주세요.");
			}else if(str == ""){
				alert("예상인원을 정해주세요.");
			}else{
				
			
			data={};
			data.user_id = $("#user_id").val();
			data.subject = $("#subject").val();
			data.summary = $("#summary").val();
			data.kind = $("#kind").val();
			data.content = $("#content").val();
			data.begin_date=$("#begin_date").val();
			data.end_date=$("#end_date").val();
			data.take_start=$("#take_start").val();
			data.take_end=$("#take_end").val();
			data.people = $("#people").val();
			data.skills = rowid;
			data.hope = checkhope;
			ajaxCall("./project/projectwrite", data);
			}
			//DB에 입력되고 있는데 페이지가 넘어가버림. = 고침.
		});
		
		//ajax 실행
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					//이게 안된다 DB에 입력은 되서 오류에서 페이지가 넘어가게 한다.
					if(reqUrl=="./project/projectwrite"){
						if(d.success==1){
							alert("글등록에 성공하였습니다.");
							location.href="./projectmain";
						}else{
							alert("글등록에 실패하였습니다.");
						}
					}
					if(reqUrl=="./project/fileDelete"){
						if(d.success == 1){
							//해당 요소가 감싸고 있는 자식요소를 삭제.
							alert("여기까지는 와졌나요");
							var element = document.getElementById(elem.id);
							element.parentNode.removeChild(element); 
						}
					}
				},
				error:function(e){
					location.href="./projectmain";
					console.log(e);
				}				
			});
		}

	</script>
</html>