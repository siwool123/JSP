<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - out</title>
</head>
<body>
<%
//out내장객체로 print()메소드 호출하면 인수로 전달된 내용은 브라우저에 즉시 출력되지 않고 버퍼에 먼저 저장된다.
out.print("출력되지 않는 텍스트"); 
out.clearBuffer(); //버퍼에저장된 내용삭제 > 출력안됨
out.print("<h2>out 내장객체</h2>"); //기본버퍼사이즈는 8kb로 설정된다.
out.print("출력버퍼의 크기 : "+out.getBufferSize()+"<br>");
out.print("남은버퍼의 크기 : "+out.getRemaining()+"<br>");
out.flush(); //버퍼에 저장된 내용을 플러시(출력)한다.
//버퍼에 모든 내용이 출력되므로 크기는 원상복구된다.
out.print("flush 후 버퍼의 크기 : "+out.getRemaining()+"<br>");
out.println(1); // println은 끝에 \n 이 추가된 효과만 부여하므로 브라우저상에는 <br>로 인식되지않아 한칸공백만 출력된다. 
out.println(false);
out.print('가');
%>
</body>
</html>