<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
		<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
		
		<script type="text/javascript" charset="utf-8">
			sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		</script>
		
		<title>지식 Q&A</title>
		<link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/common.css">
		<link rel="stylesheet" href="resources/css/QnADetail.css">
		<style>
			img{
				width:60%;
			}
		</style>
	</head>
    <body>
    <jsp:include page="header.jsp"/>
    	<input type="hidden" id="cagegory" value="question"/>
    	<div class="container">
    		
    		<div class="outter">
    		
    			<div class="searchBar">
		    		<form action="fSearch" method="post">
			    		<input type="text" id="keyword" name="keyword" value=""/>
			    		<input type="hidden" id="category" name="category" value="question"/>
			    		<input type="submit" value="검색" onclick="fSearch()"/>
			    	</form>
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
			    		<h3 style="text-align:left;">${detail.comment_count } 개의 답변 <span class="addCmt"><input type="button" class="cmt" value="답변작성" onclick="commentWrite()"/></span></h3>
			    		</span>
			    		<hr/>
			    		
			    		
						<!-- 답변 리스트 -->
						<div id="commentZone">
						
			    		</div>
			    		
			    		<!-- 에디터 들어갈 부분 -->
			    		<div id="smartZone">
			    			<form id="frm" method="post">
			    			<input type="hidden" name="idx" value="${detail.idx }"/>
					               <table>
					                   <tr>
					                       <td class="subj">작성자</td>
					                       <td class="title"><input type="text" id="user_id" name="user_id" value="${sessionScope.loginId }" /></td>
					                   </tr>
					               </table>
					               <hr/>
					               <table>
					                   <tr>
					                       <td class="subj">내용</td>
					                       <td class="tdSe"><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;"></textarea>
					                       <input id="content2" type="hidden" name="content" value=""/></td>
					                   </tr>
					               </table>
					               <hr/>
					               <div>
							            <input id="addBtn" class="writeCmt" type="button" value="답변작성"/>
									</div>
					   		</form>
			    		</div>
			    		<!--  답변수정 스마트에디터 들어갈 부분-->
			    		
			    		<div class="modifyZone">
			    			
			    			
			    		</div>
			    		
			    		<div class="foot"></div>
			    	
			    	</div>			
			    	    	
    			
    			</div> 
    			
    			
    			   			
    		</div>    		
    	</div>

	</body>
	<script>
		
	
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
					+"<img class='fileimg' style='width:15px;' src='resources/img/default.png'/> "
					+fileMap[item]+"</a>";
				}
			});
			$("#attach").append(content);
		}
	
		commentList(); // 최초 리플표시 
		
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
		
		//답글작성 폼 열기
		function commentWrite(){
			var cancelBtn = "<input type='button' class='cancelbtn' value='취소' onclick='cancel()'/>";
			$(".addCmt").append(cancelBtn);
			$(".commentList").css("display", "none"); //답변리스트 영역 없애기
			$(".cmt").css("display", "none"); //답변작성버튼 없애기
			$("#smartZone").css("display", "block"); //에디터 보이기
			$(".modifyZone").css("display", "none"); // iFrame 없애기
		}
		
		//답글작성 취소 폼닫기
		function cancel(){
			$(".cancelbtn").css("display","none");//답변작성 취소버튼 없애기
			$(".commentList").css("display", "block");//답변 리스트 보이기
			$(".cmt").css("display", "block");//답변작성버튼 보이기
			$("#smartZone").css("display", "none");//에디터 없애기
		}
		
		//답변수정 폼으로 이동
		function commentDetail(comment_idx, idx){
			location.href="commentDetail?comment_idx="+comment_idx+"&idx="+idx;
		}
		
		//액션지정(답변작성버튼)
		$(".writeCmt").click(function(){
			$("#frm").attr("action", "commentWrite");
		});
		
		//투표 증가
		function recmdUp(comment_idx, idx){
			if(confirm("이 답변이 도움이 되셨나요 ?") == true){
				//증가 실행
				url="./rest/recmdUp";
				data={};
				data.idx = idx;
				data.comment_idx = comment_idx;
				data.push_user = "TEST";//"${sessionScope.loginId }";
				sendAjax(url,data);
			}else{
				//취소
				return;
			}
		}
		
		
		//투표 감소
		function recmdDown(comment_idx, idx){
			if(confirm("이 답변이 도움이 되지않나요 ?") == true){
				//감소 실행
				url="./rest/recmdDown";
				data={};
				data.idx = idx;
				data.comment_idx = comment_idx;
				data.push_user = "TEST";//"${sessionScope.loginId }";
				sendAjax(url,data);
			}else{
				//취소
				return;
			}
		}
		
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
					//답글리스트 띄우기
					if(reqUrl=="./rest/commentList"){
						printList(d.list);
					}
					

					if(reqUrl=="./rest/commentDel"){
						console.log(d);
						if(d.success == 1){
							alert("삭제에 성공했습니다.");
							location.href="./QnADetail?idx=${detail.idx}";
						}else{
							alert("삭제에 실패했습니다.");
						}
					}
					
					//추천수 증가 누름
					if(reqUrl == "./rest/recmdUp"){
						console.log(d);
						if(d.success == 0){
							alert("추천을 취소하셨습니다.");
						}else{
							alert("추천하셨습니다.");
						}
						location.href="./QnADetail?idx="+d.idx;
					}
					//추천수 감소 누름
					if(reqUrl == "./rest/recmdDown"){
						console.log(d);
						if(d.success == 0){
							alert("비추천을 취소하셨습니다.");
						}else{
							alert("비추천하셨습니다.");
						}
						location.href="./QnADetail?idx="+d.idx;
					}
					
					
					
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		function printList(list){
			$("#commentZone").empty();
			var content = "";
			list.forEach(function(item){
				content +="<div class='commentList'>";
				content +="<div class='recmdDiv'>";
				content +="<a href='#' onclick='recmdUp("+item.comment_idx+","+item.idx+")'> ▲</a><br/>";
				content +="<br/>"+item.recommend+"<br/>투표<br/>";
				content +="<br/><a href='#' onclick='recmdDown("+item.comment_idx+","+item.idx+")'> ▼</a></div>";
				content +="<div class='dateDiv'>"+item.reg_date+"<br/><br/>"+item.user_id+"</div>";
				content +="<span class='contentDiv'>"+item.content+"</span>";
				console.log(item.user_id);	
				if("${sessionScope.loginId}" == item.user_id){ 
					content += "<div class='modCmtDiv'><a href='#' onclick='commentDetail("+item.comment_idx+","+item.idx+")'> 수정</a></div>";
					content += "<div class='delCmtDiv'><a href='#' onclick='commentDel("+item.comment_idx+","+item.idx+")'> 삭제</a></div>";
				} 
				content +="<hr/></div>";
			});
			$("#commentZone").append(content);
		}
		
		
		
	</script>
	

</html>