<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="common.Person"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 영역</title>
</head>
<body>
<h2>application 영역의 속성 읽기</h2>
<%
/* object로 저장된 속성값을 map 타입으로 형변환한다.
map은 key로 value를 저장하므로 반복하기전 key를 먼저얻어온다.
keySet() 으로 얻어와 반복하여 value 를 읽어와 출력한다. */
HashMap<String, Person> maps = (HashMap<String, Person>)application.getAttribute("maps");
Set<String> keys = maps.keySet();
for(String i:keys) {
	Person person = maps.get(i);
	out.print("이름 : "+person.getName()+", 나이 : "+person.getAge()+"<br>");
}
%>
</body>
</html>