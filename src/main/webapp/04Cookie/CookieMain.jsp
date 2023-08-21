<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
<!-- 쿠키 : 클라리언트의 상태정보를 유지하기위한 기술로 클라이언트의 pc에 파일형태로 저장됨
쿠키 하나의 크기는 4kb이고 3000개까지 만들수있다
쿠키는 생성자 통해서만 생성가능. setName()이라는 세터가없어 쿠키는 생성후 쿠키명변경불가
> cookie.setMaxAge(0)으로 삭제하고 새로만들어야함 -->
<h2>1. 쿠키설정</h2>
<%
Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
//쿠키경로설정. 컨텍스트루트경로로지정하므로 웹앱 전체에서사용가능
cookie.setPath(request.getContextPath()); 
System.out.println("설정경로 : "+request.getContextPath());
cookie.setMaxAge(3600); //쿠키유지시간설정
response.addCookie(cookie); //응답헤더에 쿠키 추가하여 클라이언트측으로 전송
%>
<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
<!-- request 내장객체의 getCookies()통해 생성된 모든쿠키를 배열형태로가져옴
쿠키 생성 직후에는 쿠키값 읽을수없다. 클라이언트 측에있는 쿠키를 서버로 다시전송하기위해 
페이지이동을하거나 새로고침을 하여 새 요청을 보내야만 읽을수있다. -->
<%
Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(Cookie i:cookies){
		String cookieN = i.getName();
		String cookieV = i.getValue();
		out.println(cookieN+" : "+cookieV+"<br><br>");
	}
}
%>

<h2>3. 페이지 이동후 쿠키값 확인하기</h2>
<a href="CookieResult.jsp">다음 페이지에서 쿠키값 확인하기</a>
</body>
</html>