<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="resources/js/twbsPagination.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style></style>
	</head>
	<body>
		<input type="hidden" name="project_idx" id="project_idx" value="${project_idx}"/>
		<!-- 메시지 표시 영역 -->
	    <textarea id="messageTextArea" readonly="readonly" rows="10" cols="45">
	    	사용할 별명을 먼저 입력해주세요.
	    </textarea><br />
	    <!-- 송신 메시지 텍스트박스 -->
	    <input type="text" id="messageText" size="50" name="enter" onkeypress="if(event.keyCode==13){sendMessage();}"/>
	    <!-- 송신 버튼 -->
	    <input type="button" value="Enter" onclick="sendMessage()" />
	</body>
	<script>
	
	//웹소켓 초기화
    var webSocket = new WebSocket("ws://localhost/main/broadsocket");
    var messageTextArea = document.getElementById("messageTextArea");
    //메시지가 오면 messageTextArea요소에 메시지를 추가한다.
    webSocket.onmessage = function processMessge(message){
        //Json 풀기
        var jsonData = JSON.parse(message.data);
        if(jsonData.message != null) {
            messageTextArea.value += jsonData.message + "\n"
        };
    }
    //메시지 보내기
    function sendMessage(){
        var messageText = document.getElementById("messageText");
        webSocket.send(messageText.value);
        messageText.value = "";
    }

	/*
	var textarea = document.getElementById("messageWindow");
	
	//프로젝트명 밑의 자바파일 @ServerEndpoint(/broadcasting)으로 간다.
	var wevSocket = new webSocket('ws://localhost:8080/main/broadcasting'); 
	var inputMessage = document.getElementById('inputMessage');
	
	webSocket.onerror = function(e){
		onError(e)
	};
	
	webSocket.onopen = function(e){
		onOpen(e)
	};
	
	//채팅 텍스트를 상대로부터 받음
	webSocket.onmessage = function(e){
		onMessage(e)
	};
	
	//받은 메세지를 화면에 출력
	function onMessage(e){
		textarea.value += "상대 : " + e.data + "\n";
	}
	
	function onOpen(e){
		textarea.value += "연결 성공\n";
	}
	
	function onError(e){
		alert(e.data);
	}
	
	//채팅 텍스트를 상대에게 보냄
	function send(){
		textarea.value += "나 : " + inputMessage.value + "\n";
		webSocket.send(inputMessage.value);
		inputMessage.value = "";
	}
	*/
	
	/*
		//WebSocketEx는 프로젝트 이름
	    //websocket 클래스 이름
	    var webSocket = new WebSocket("ws://localhost/main/websocket");
	    var messageTextArea = document.getElementById("messageTextArea");
	    //웹 소켓이 연결되었을 때 호출되는 이벤트
	    webSocket.onopen = function(message){
	        messageTextArea.value += "Server connect...\n";
	    };
	    //웹 소켓이 닫혔을 때 호출되는 이벤트
	    webSocket.onclose = function(message){
	        messageTextArea.value += "Server Disconnect...\n";
	    };
	    //웹 소켓이 에러가 났을 때 호출되는 이벤트
	    webSocket.onerror = function(message){
	        messageTextArea.value += "error...\n";
	    };
	    //웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
	    webSocket.onmessage = function(message){
	        messageTextArea.value += "Recieve From Server => "+message.data+"\n";
	    };
	    //Send 버튼을 누르면 실행되는 함수
	    function sendMessage(){
	        var message = document.getElementById("textMessage");
	        messageTextArea.value += "Send to Server => "+message.value+"\n";
	        //웹소켓으로 textMessage객체의 값을 보낸다.
	        webSocket.send(message.value);
	        //textMessage객체의 값 초기화
	        message.value = "";
	    }
	    //웹소켓 종료
	    function disconnect(){
	        webSocket.close();
	    }
	*/
	</script>
</html>