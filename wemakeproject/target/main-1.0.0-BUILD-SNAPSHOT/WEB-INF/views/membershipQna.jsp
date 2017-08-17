<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="./resources/css/board.css">
    <style>
  		    .listView{
	    		width: 80%;
	    		margin:auto;
	    		margin-top: 70px;
	    	}
	    	.bbsListA{
	    		margin:auto;
	    		height: 50%;
	    	}
	    	th {
			    text-align: center;
			    border: 1px solid black;
			    border-left-style: none;
			    border-right-style: none;
			    font-size: 17px;
			    font-family: sans-serif;
			    font-weight: bold;
			}
			td{
			    padding: 0;
			    text-align: center;
			    border: 1px solid gray;
			    border-left-style: none;
			    border-right-style: none;
			    font-size: 15px;
			    font-family: sans-serif;
			}
			.ldk{
				height: 80px;
			}
			.dkdk{
				font-size: 30px;
				font-family: sans-serif;
				font-weight: bold;
				color: steelblue;
				margin-bottom: 20px;
			}
			.boardBtn15{
				width:100px;
			}
			.container{
				position: relative;
			}
			.movedk{
				display: inline-block;
			    margin: auto;
			    float: right;
			    margin-bottom: 10px;
			}
			a{
				font-weight: lighter;
				text-decoration: none;
				font-size:20px;
			}
			.tltdk{
				    font-family: sans-serif;
   					font-weight: 600px;
			}
    </style>
    </head>
    <body>
    <jsp:include page="header.jsp"/>
    	<input type="hidden" name="user_id" id="user_id" value="${sessionScope.loginId }"/>
    	
    	<div class="listView">
		<table class="bbsListA" summary="팀 게시판">
			<span class="dkdk">내 QnA</span>
			<colgroup>
				<col width="8%">
				<col width="47%">
				<col width="10%">
				<col width="12%">
			</colgroup>
			<thead>
				<tr class="ldk">
	        		<td>투표수</td>
	        		<td>제목</td>
	        		<td>답변수</td>
	        		<td>날짜</td>
				</tr>
			</thead>
			<tbody id="list">
				<c:forEach items="${membershipQna}" var="membershipQna">
				<input type="hidden" value="${membershipQna.idx }"/>
	        		<tr>
	        			<td>${membershipQna.hit}</td>
	        			<td><a href="./QnADetail?idx=${membershipQna.idx }">${membershipQna.subject}</a></td>
	        			<td>${membershipQna.comment_count}</td>
	        			<td>${membershipQna.reg_date}</td>
	        		</tr>
        		</c:forEach>
			</tbody>
		</table>
	</div>
    </body>
    <script>

    </script>
</html>