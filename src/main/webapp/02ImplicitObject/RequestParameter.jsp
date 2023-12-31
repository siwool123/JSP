<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
<%
//post 방식으로 전송된 한글이 깨지는 현상을 처리한다.
/* request.setCharacterEncoding("UTF-8"); 9.x 버전에서 필요함 */
/* 
getParameter() : input태그의 text, radio 타입처럼 하나의값이 전송되는 경우 사용. 
			입력값이 문자,숫자 상관없이 String 타입으로 저장된다.
getParameterValues() : checkbox 혹은 <select>태그의 multiple 속성을 부여하여 2개이상의 
			값이 전송되는경우 사용. 받은값은 String타입의 배열로 저장됨
*/
String id = request.getParameter("id");
String sex = request.getParameter("sex");
String etc1 = request.getParameter("etc1");
String etc2 = request.getParameter("etc2");
String chkAll = request.getParameter("chkAll");
String[] chks = request.getParameterValues("chk");
String mailok = request.getParameter("mailok");
String smsok = request.getParameter("smsok");

//관심사항은 checkbox이므로 2개이상 선택가능하므로 배열로 폼값받는다.
String[] favo = request.getParameterValues("favo"); 
String[] grade = request.getParameterValues("grade"); 
String favoStr = "", gradeStr = "", chk="";
if(favo!=null){
	for(String i:favo) favoStr += i + " ";
} //체크박스의 체크한 항목만 서버로전송됨

if(grade!=null){
	for(String i:grade) gradeStr += i + " ";
}

if(chk!=null){
	for(String i:chks) chk += i + " ";
}
//<textarea> 태그는 2줄이상 입력가능하므로 엔터 추가하는 경우 \r\n으로 저장된다. 
//따라서 웹브라우저에 출력할때는 <br>태그로 변경해야한다.
String intro = request.getParameter("intro").replace("\r\n", "<br>");
%>
<ul>
<li>아이디 : <%= id %></li>
<li>성별 : <%= sex %></li>
<li>관심사항 : <%= favoStr %></li>
<li>자기소개 : <%= intro %></li>
<li>학력 : <%= gradeStr %></li>
<li>관심분야1 : <%= etc1 %></li>
<li>관심분야2 : <%= etc2 %></li>
<li>전체체크 : <%= chkAll %></li>
<li>일부체크 : <%= chk %></li>
<li>메일수신 : <%= mailok %></li>
<li>문자수신 : <%= smsok %></li>
</ul>
</body>
</html>