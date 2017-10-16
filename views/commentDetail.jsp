<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
		<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm2.js"/>"></script>
		
		<script type="text/javascript" charset="utf-8">
			sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		</script>
		
		<title>지식 Q&A</title>
		<link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/common.css">
		<link rel="stylesheet" href="resources/css/QnADetail.css">

	</head>
    <body>
    <jsp:include page="header.jsp"/>
    	<input type="hidden" id="cagegory" value="question"/>
    	<div class="container">
    		
    		<div class="outter">
    		
    			<div class="searchBar">
		    		<input type="text" id="text" name="searchBar" /><input type="button" value="검색" />
		    	</div>
		    	<input type="button" value="질문하기" onclick="location.href='questionForm'"/>
    			
    			<div class="inner">
    			
			    	<div class="qnaList">
			    	<hr/>
			    	<input type="hidden" id="idx" value="${detail.idx }"/>
			    		<table class="board">
							<tr>
								<td>${detail.hit }</td>
								<td>${detail.comment_count }</td>
								<td>${detail.subject }</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>투표</td>
								<td>답변</td>
								<td></td>
								<td>${detail.reg_date }</td>
								<td>${detail.user_id }</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td class="content">${detail.content }</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td colspan="4" id="attach">
								
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<input type="button" onclick="location.href='./QnABoard'" value="목록보기"/>
									 <%if("${sessionScope.loginId}" == "${detail.user_id}"){%> 
										<input type="button" onclick="location.href='./updateForm?idx=${detail.idx}'" value="수정하기"/>
										<input type="button" value="삭제" onclick="confirmDel()"/>
									 <% }%> 
									
								</td>
							</tr>
						</table>
			    		
			    		
			    		<span>
			    		<h3 style="text-align:left;">${detail.comment_count } 개의 답변 <span class="addCmt"><input type="button" class="cmt" value="수정취소" onclick="modCancel(${cmtDetail.idx })"/></span></h3>
			    		</span>
			    		<hr/>
			    		
			    		
						<!-- 답변 리스트 -->
						<div id="commentZone">
						
			    		</div>
			    		
			    		
			    		<!--  답변수정 스마트에디터 들어갈 부분-->
			    		
			    		<div class="modifyZone">
			    			
			    			<form id="frm" method="post">
				   			<input type="hidden" name="idx" value="${cmtDetail.idx }"/>
				   			<input type="hidden" name="comment_idx" value="${cmtDetail.comment_idx }"/>
				               <table>
				                   <tr>
				                       <td class="subj">작성자</td>
				                       <td class="title"><input type="text" id="user_id" name="user_id" value="${cmtDetail.user_id }" readonly/></td>
				                   </tr>
				               </table>
				               <hr/>
				               <table>
				                   <tr>
				                       <td class="subj">내용</td>
				                       <td class="tdSe"><textarea name="smarteditor2" id="smarteditor2" rows="10" cols="100" style="width:100%; height:412px;">${cmtDetail.content }</textarea>
				                       <input id="content2" type="hidden" name="content" value=""/></td>
				                   </tr>
				               </table>
				               <hr/>
				               <div>
						            <input id="addBtn" class="modifyCmt" type="button" value="답변수정"/>
								</div>
					   		</form>
			    			
			    			
			    		</div>
			    		
			    		<div class="foot"></div>
			    	
			    	</div>			
			    	    	
    			
    			</div> 
    			
    			
    			   			
    		</div>    		
    	</div>

	</body>
	<script>
		var msg = "${msg}";
		if(msg !=""){
			alert(msg);
		}
		var fileMap = {};
		var url="";
		var data={};
		<%String modifycontent;  %>
		var modifycontent = "";
		
		<c:forEach items="${files}" var="list">
			fileMap["${list.new_file}"] = "${list.old_file}"
		</c:forEach>
		

		
		if(fileMap.length < 1){
			$("#attach").html("첨부된 파일이 없습니다.");
		}else{
			//object에서 key만 뽑아 내는 과정
			var ext;
			var content;
			Object.keys(fileMap).forEach(function(item){
				console.log(item);
				ext = item.substring(item.lastIndexOf(".")+1);
				console.log(ext);
				if(ext!= "jpg" && ext!= "png" && ext!= "gif"){
					content = "	<a href='./download?file="+item+"'>"
					+"<img width='15px' src='resources/img/default.png'/> "
					+fileMap[item]+"</a>";
				}
			});
			$("#attach").append(content);
		}
	
		
		
		//글삭제
		function confirmDel(){
			if(confirm("정말 삭제하시겠습니까 ?") == true){
				//삭제 실행
				del( ${detail.idx } );
			}else{
				//취소
				return;
			}
		}
		
		//댓글 리스트보기
		function commentList(){
			url="./rest/commentList";
			data={};
			data.idx=$("#idx").val();
			sendAjax(url,data);
		}
		
		//댓글 지우기
		function commentDel(comment_idx, idx){
			url="./rest/commentDel";
			data={};
			data.idx = idx;
			data.comment_idx = comment_idx;
			sendAjax(url,data);
		}
		
		//글삭제
		function del(idx){
			url="./rest/del";
			data={};
			data.idx = idx;
			sendAjax(url,data);
		}

		
		//디테일로 돌아가기
		function modCancel(idx){
			location.href="QnADetail?idx="+idx;
		}
		
		//액션지정(답변작성버튼)
		$(".modifyCmt").click(function(){
			$("#frm").attr("action", "commentUpdate");
		});
		
		//ajax전송
		function sendAjax(reqUrl, reqData){
			console.log(reqUrl, reqData);
			$.ajax({
				url:reqUrl,
				type:"get",
				data:reqData,
				dataType:"json",
				success:function(d){
					//글삭제
					if(reqUrl=="./rest/del"){
						console.log(d.success);
						if(d.success == 1){
							alert("삭제되었습니다.");
							location.href="./QnABoard";
						}else{
							alert("삭제에 실패했습니다.");
						}
					}
					

					if(reqUrl=="./rest/repleDel"){
						console.log(d);
						if(d.success == 1){
							alert("삭제에 성공했습니다.");
							repleList();
						}else{
							alert("삭제에 실패했습니다.");
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