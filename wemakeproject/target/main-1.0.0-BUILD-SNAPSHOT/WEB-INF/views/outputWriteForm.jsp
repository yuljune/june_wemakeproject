<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>결과물 게시글 등록</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
		<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
		<link rel="stylesheet" href="<c:url value="/resources/css/write.css"/>"/>
		<script type="text/javascript" charset="utf-8">
			sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		</script>
		<style>
			#page{
				color:#BDC6B7;
				font-size: 15pt;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		<div class="container">
    		<br/><br/><br/><h2 id="page">게시글 작성</h2>
    	<div class="outter">
		
   		<form id="frm" action="outputWrite" method="post">
               <hr/>
               <table>
                   <tr>
                       <td class="subj">제 목</td>
                       <td class="title"><input type="text" id="subject" name="subject"/></td>
                   </tr>
                   <tr>
                       <td class="subj">작성자</td>
                       <td class="title"><input type="text" id="user_id" name="user_id" value="${user_id}" readonly/>
                       <input type="hidden" id="category" name="category" value="완성"/></td>
                   </tr>
                  
               </table>
               <hr/>
               <table>
                   <tr>
                       <td class="subj">내용</td>
                       <td class="tdSe"><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;"></textarea>
                       <input id="content" type="hidden" name="content" value=""/></td>
                   </tr>
               </table>
               <table>
                   <tr>
                       <td class="subj">게시판 메인 이미지</td>
                       <td class="title"><input class="fileBtn" type="button" onclick="fileUp()" value="사진 첨부(1개만)"/>
					<div id="files"></div></td>
                   </tr>
               </table>
               <hr/>
               <div>
		            <input id="addBtn" type="submit" value="글 작성"/>
					<input class="Btn" type="button" value="목록 보기" onclick="goBack()"/>
				</div>
   		</form>
   		</div>
    	</div>
	</body>
	<script>
		function goBack(){
			location.href="./outputBoard";
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