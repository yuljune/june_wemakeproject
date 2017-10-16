<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<title>Insert title here</title>
	<style></style>
	</head>
	<body>
		<form id="fileUpload" action="./projectFileUpload" method="post" enctype="multipart/form-data">
			<input type="file" name="file" onchange="fileView(this)"/>
			<input id="fileName" type="hidden" name="fileName"/>
		</form>
	</body>
	<script>
		var filePath ="${path}"; //파일경로 결과값
		var fileName = "${FileName}"; // projectUpload에서 resources/upload/+FileName 가져옴 
		console.log(filePath);
		console.log(fileName);
		
	
		function fileView(elem){
			var fullPath = elem.value;
			var fileName = fullPath.substring(12);
			$("#fileName").val(fileName);
			$("#fileUpload").submit();
			
		}
		//opener 연곳
		if(filePath !=""){
			
			var content=""; // content; 할시 언디파인드 content부분에 붙어버림.
			
			var fileName = filePath.substring(17);
			var ext = fileName.substring(fileName.lastIndexOf(".")+1);
			var delBtn ="";
			
			if(filePath !=""){
				var elem = window.opener.document.getElementById("attach");
				content ="<a id='"+fileName+"' href='#' onclick='del(this)'>"
				+"<img width='15' src='resources/img/default.png'/> "+fileName
				+"<b> 취소 </b></a>"	;
				elem.innerHTML += content;
			}
			self.close();
			
		}
		
	</script>
</html>