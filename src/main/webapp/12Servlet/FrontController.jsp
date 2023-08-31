<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController.jsp</title>
</head>
<body>

<!-- 요청명은 일괄적으로 .one 으로 끝나는 형태로 생성한후 링크를 걸어준다.
이처럼 요청명(url-pattern)은 임의로 네이밍가능

해당 요청명은 web.xml을 사용하지 않고 어노테이션 통해 매핑한다.
FrontController.java  -->
<h3>한번의 매핑으로 여러가지 요청 처리하기</h3>
${ resultValue }
<ol>
	<li>URI : ${ uri }</li>
	<li>요청명 : ${ commandStr }</li>
</ol>
<ul>
	<li> <a href="../12Servlet/regist.one">회원가입</a> </li>
	<li> <a href="../12Servlet/login.one">로그인</a></li>
	<li> <a href="../12Servlet/freeboard.one">자유게시판</a></li>
</ul>
</body>
</html>