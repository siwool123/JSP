<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- trimDirectiveWhitespaces : 지시어 속성 중 지시어때문에 남은 불필요한 공백 제거
콜백데이터는 해당 페이지에 출력되는 모든 소스코드를 반환하게되는데, 
공백도 하나의 문자이므로 필요없는경우 제거하는게좋다. --%>
<%
//체크박스체크후닫기버튼누르면 1이 파라미터로 전송된다.
String chkVal = request.getParameter("inactiveToday");
if(chkVal!=null && chkVal.equals("1")){ //파라미터가1이면 쿠키생성
	Cookie cookie = new Cookie("PopupClose", "off");
	cookie.setPath(request.getContentType());
	cookie.setMaxAge(3600*24);
	response.addCookie(cookie);
	out.println("쿠키 : 하루동안 열지않음"); //콜백데이터를 출력
}
%>
