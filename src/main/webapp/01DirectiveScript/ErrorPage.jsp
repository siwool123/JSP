<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="IsErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
<%
//에러페이지처리방법2 : 페이지 지시어에 errorPage 속성 추가. 
//해당속성은 현재페이지에서처리하지않고, 지정페이지로 오류전달하겠다는 의미 갖고있다. 
//java의 throws와 동일. 해당파일 실행시 즉시 500에러발생
//이때 에러는 지시어에 지정한 페이지로 전달되어 IsErrorPage 파일내용이 출력됨
int myAge = Integer.parseInt(request.getParameter("age"))+10;
out.println("10년 후 당신의 나이는 "+myAge+" 입니다.");
%>
</body>
</html>