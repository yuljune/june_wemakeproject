<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
		<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
		<link rel="stylesheet" href="<c:url value="/resources/css/write.css"/>"/>
		<script type="text/javascript" charset="utf-8">
			sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		</script>
		<title>결과물 수정 </title>
		<link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/common.css">
		<link rel="stylesheet" href="resources/css/questionForm.css">
		<style type="text/css">
			.dkdk{
					font-size: 30px;
					font-family: sans-serif;
					font-weight: bold;
					color: steelblue;
					margin-top:30px;
					margin-bottom: -40px;
			}
			.container{
				border:none;
			}
		</style>
		
	</head>
    <body>
    <jsp:include page="header.jsp"/>
    	<div class="container">
    		<span class="dkdk">팀 게시판 글 수정</span>
    		<div class="outter">
    		<form id="frm" action="teamUpdate" method="post">
    		<input type="hidden" name="tb_idx" value="${detail.tb_idx}"/>
    		<input type="hidden" name="project_idx" value="${detail.project_idx }"/>
                <hr/>
                <table>
                    <tr>
                        <td class="subj">▷ 제 목</td>
                        <td class="title"><input type="text" id="subject" name="subject" value="${detail.tb_subject }"/></td>
                    </tr>
                    <tr>
                        <td class="subj">▷ 작성자</td>
                        <td class="title">
                        	<input type="text" id="user_id" name="user_id" value="${detail.writer }" readonly/>
                        	<input type="hidden" id="idx" name="idx" value="${detail.tb_idx }"/>
                        </td>
                    </tr>
                </table>
                <hr/>
                <table>
                    <tr>
                        <td class="subj">▷ 내용</td>
                        <td class="tdSe">
                        	<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;">${detail.tb_content }</textarea>
                        	<input type="hidden" id="content" name="content" value=""/>
                        </td>
                    </tr>
                </table>
                
               <hr/>
                
               <table>
                    <tr>
                        <td class="subj">첨부파일</td>
                        <td class="title"><input type="button" onclick="fileUp()" value="파일업로드"/>
						<div id="files"></div></td>
                    </tr>
                </table>
				 
                <hr/>
               	<input id="addBtn" type="button" value="수정완료"/>
				<input id="cancel" type="button" value="취소" onclick="goBack()"/>
    		</form>
    		</div>
    	</div>
    </body>
    
    <script>
    var fileMap = {};
	var url="";
	var data={};
	var tb_idx = "${detail.tb_idx}";
	
	<c:forEach items="${files}" var="list">
		fileMap["${list.new_file}"] = "${list.old_file}"
	</c:forEach>
	
	console.log(fileMap);
	
	
	
	if(fileMap.length < 1){
		$("#files").html("첨부된 파일이 없습니다.");
	}else{
		//object에서 key만 뽑아 내는 과정
		var ext;
		var content = "";
		Object.keys(fileMap).forEach(function(item){
			console.log(item);
			ext = item.substring(item.lastIndexOf(".")+1);
			console.log(ext);
			
				content += "<a id='"+item+"' href='#' onclick='del(this)'>"
				+"<img width='15' src='resources/img/default.png' /> " + fileMap[item] +" <b>X</b></a>";
				
		});
		
		$("#files").append(content);
	}
	
    function goBack(){
		location.href="./teamDetail?idx=${detail.tb_idx}";
		
	}
    function fileUp(){
		//새창 띄우기
		var myWin = window.open("./uploadForm", "파일업로드", "width=400, height=100");

	}
	
	function del(elem){
		console.log(elem.id);
		$.ajax({
			url : "./rest/fileDelete",
			type : "get",
			data : {"fileName" : elem.id},
			dataType : "json",
			success : function(d){
				console.log(d);
				if(d.success==1){
					var element = document.getElementById(elem.id);
					element.parentNode.removeChild(element);
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	}
		
    </script>
   
    
    
</html>