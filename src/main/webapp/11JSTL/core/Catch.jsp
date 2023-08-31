<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - catch</title>
</head>
<body>
<!-- catch 태그 : el이나 jsp에서 발생한 예외 처리시 사용. var 속성사용시 에러내용을 원하는 위치에 출력가능
jstl문법오류는 catch되지않는다. -->
<h4>자바코드에서의 예외</h4>
<% int num1 = 100; %>
<c:catch var="eMessage"><% int result = num1/0; %></c:catch>
예외내용 : ${ eMessage }

<!-- el에서 +기호는 덧셈연산만 한다. 즉 문자열 연결기능은 없으므로 예외발생 -->
<h4>EL에서의 예외</h4>
<c:set var="num2" value="200" />
<c:catch var="eMessage"> ${ "일"+num2 } </c:catch>
${ "일" }+${ num2 }  <br />
예외 내용 : ${ eMessage }
</body>
</html>