<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>공지사항</title>
		<link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/common.css?var=1">
		<link rel="stylesheet" href="resources/css/noticeDetail.css?var=1">
		
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
    		<h3 style="margin-top:1px;">공모소식</h3>
    		<div class="outter">
    		
    			<div class="searchBar">
		    		<input type="text" id="text" name="searchBar" /><input type="button" value="검색" />
		    	</div>
		    	
    			
    			<div class="inner">
    			
			    	<div class="noticeArea">
			    	<hr/>
			    	<input type="hidden" id="idx" value="${detail.idx }"/>
			    	<h3 style="font-size: 12pt; font-weight: bold;">제목 : ${detail.subject }</h3>
			    	<hr/>
			    		<table class="board">
			    			<tr><td colspan="6"></td></tr>
							<tr>
								<td>▷ 첨부파일</td>
								<td id="attach"></td>
								<td>▷ 등록일</td>
								<td>${detail.reg_date }</td>
								<td>▷ 작성자</td>
								<td>${detail.user_id }</td>
							</tr>
							
							<tr><td colspan="6"></td></tr>
							<tr>
								<td colspan="6" class="content">${detail.content }</td>
							</tr>
							<tr><td colspan="6"></td></tr>
						</table>
						<hr/>
			    		<input type="button" onclick="location.href='./noticeBoard'" value="목록보기"/>
					<%-- <%if("${sessionScope.loginId}" == "${detail.user_id}"){%> --%>
						<input type="button" onclick="location.href='./noticeUpdateForm?idx=${detail.idx}'" value="수정하기"/>
						<input type="button" value="삭제" onclick="confirmDel()"/>
					<%-- <% }%> --%>
			    		
			    		<span>
			    		
			    		</span>
			    		
			    		
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
		
		//글삭제
		function del(idx){
			url="./rest/del";
			data={};
			data.idx = idx;
			sendAjax(url,data);
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
							location.href="./noticeBoard";
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