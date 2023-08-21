<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 영역</title>
</head>
<body>
<h2>application 영역의 공유</h2>
<%
/* application 영역 : 웹앱은 단하나의 application 객체를 생성하고 클라이언트가 요청하는 모든페이지가 application객체를공유한다.
해당 영역에 저장된 속성은 웹서버가 셧다운(전원off)될때까지 유지된다. 
즉, 웹브라우저를 닫았다 새로 접속해도 저장정보는 유지됨 */
HashMap<String, Person> maps = new HashMap<>();
maps.put("actor1", new Person("이수일", 30));
maps.put("actor2", new Person("심순애", 28));
application.setAttribute("maps", maps);
%>
application 영역에 속성이 저장되었습니다.
</body>
</html>