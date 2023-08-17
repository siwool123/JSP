<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1kb" autoFlush="false"%> <!-- 버퍼설정 
jsp는 화면상에 내용 출력시 항상 버퍼에 먼저 저장한다.
버퍼 속성을 통해 버퍼 용량을 설정할수있고
autoFlush 속성으로 버퍼가 꽉찬경우 내보내기할지를 설정할수있다.
여기서 버퍼는 1kb(1000byte), 꽉찬경우 내보내지않도록 설정한상태이다.
    -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - buffer, autoFlush 속성</title>
</head>
<body>
<%
//for문으로 10글자(10byte)를 100번 반복출력하므로 1000바이트가된다. 여기에 html태그들이 포함되어
//해당 페이지 용량은 1kb를 초과하여 실행시 에러발생. 해결법은 버퍼용량늘리거나, autoFlush를 true로 변경
//이런이유로 jsp에서 버퍼용량 지정하는경우는 거의없다. 단, jsp가 웹브라우저에 내용출력시 버퍼사용하는걸 인지하고
//이를통해 에러페이지처리나 포워드 등의 기능을 수행할수있게된다. 
for(int i=1; i<=100; i++) out.println("abcde12345"); //버퍼채우기
%>
</body>
</html>