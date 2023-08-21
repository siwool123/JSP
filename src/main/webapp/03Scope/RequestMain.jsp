<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* request 영역 : 클라이언트가 요청할때마다 새 request객체가 생성되어 같은 요청을 처리하는데 사용되는 모든 jsp페이지가 영역을 공유한다.
즉 request 영역에 저장된 정보는 현재페이지와 forward된 페이지까지 공유된다. 
리퀘스트 영역에 2개의 데이터를 저장한다. */
request.setAttribute("requestString", "request 영역의 문자열");
request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역</title>
</head>
<body>
<h2>request 영역의 속성값 삭제하기</h2>
<%
request.removeAttribute("requestString"); //request영역에 저장되었던것이라 정상삭제됨
request.removeAttribute("requestInteger"); //저장되어있지않는데이터. 에러없이 아무일 발생하지않음
%>
<h2>request 영역의 속성값 읽기</h2>
<% //동일페이지에 저장된 정보이므로 정상출력됨
Person rPerson = (Person)(request.getAttribute("requestPerson"));
%>
<ul>
<li>String 객체 : <%= request.getAttribute("requestString") %></li> <!-- 앞에서 삭제되어 null출력됨 -->
<li>Person 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge() %></li> <!-- 저장된 정보이므로 정상출력됨 -->
</ul>
<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
<% 
/* 포워드 : 현재 페이지로 들어온 요청을 다음 페이지로 보내는 기능. 즉 하나의 요청을 둘이상의 페이지가 공유할수있다.
포워드 명령을 만나기전까지의 모든 내용은 버퍼에서 삭제되고, 포워드된 페이지의 내용만 화면에 출력하는 특징 가진다.
즉, 포워드란 현재 페이지로 들어온 요청을 다른 페이지에서도 공유할수있도록 전달하는 걸 말한다.
그래서 주소줄에선느 최초요청받은 페이지명이 출력되고, 실제출력된내용은 요청이 전달된 페이지가 나오게된다. */
request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
%>
</body>
</html>