<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - forward</title>
</head>
<body>
<!-- 페이지 이동의 경우 새 페이지에 대한 요청 발생하므로 완전히 서로다른 페이지를 의미
따라서 page, request 영역 모두 공유되지않는다. -->
<h3>sendRedirect 통한 페이지 이동</h3>
<%--
response.sendRedirect("ForwardSub.jsp");
--%>

<!-- 포워드된 페이지에선 request영역이 공유된다. 주소표시줄엔 최초요청한 페이지의
경로가 보이지만, 사용자는 포워드된 페이지의 내용을 본다. 
즉, 하나의 요청을 2개의 페이지가 공유하는 개념이다. -->
<h2>액션태그 이용한 포워딩</h2>
<jsp:forward page="/07ActionTag/ForwardSub.jsp" />
<%--
request.getRequestDispatcher("ForwardSub.jsp").forward(request, response);
--%>
<!-- 액션태그 사용하면 jsp코드보다 훨씬더 간결하게 코드 표현가능 -->
</body>
</html>