<%@page import="java.util.StringTokenizer"%>
<%@page import="org.eclipse.tags.shaded.org.apache.xml.utils.StringToIntTable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forTokens</title>
</head>
<body>
<!-- forTokens 태그 : 문자열에서 특정구분자로 반환된 배열 크기만큼 반복해야할때 사용
속성
items : 구분자 포함한 문자열 지정. 단 컬렉션이나 배열은 사용불가
delims :  구분자를 지정. 여러가지 특수기호 사용가능
var : 구분자로 잘라낸 토큰 저장
 ※ 토큰이란? 문법적으로 의미있는 최소단위. 하이픈으로 구분되있는 전화번호 분리시 각각의번호가 토큰이된다. -->
<%
String rgba = "Red,Green,Blue,Black";
%>
<h4>JSTL의 forTokens 태그사용</h4>
<c:forTokens items="<%= rgba %>" delims="," var="color">
	<p style="color:${ color };">${ color }</p>
</c:forTokens>

<h4>StringTokenizer 클래스 사용</h4>
<%
StringTokenizer tks = new StringTokenizer(rgba, ",");
out.println("토큰수 : "+tks.countTokens()+"<br>");
while(tks.hasMoreTokens()) {
	String tk = tks.nextToken();
	out.println(tk+"<br>");
}
%>

<h4>String 클래스의 split() 메소드 사용</h4>
<%
String[] colorArr = rgba.split(",");
for(String i:colorArr) out.println(i+"<br>");
%>
</body>
</html>