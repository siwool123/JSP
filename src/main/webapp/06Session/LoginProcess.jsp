<%@page import="utils.CookieManager"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% //로그인 폼에서 전송한 폼값을 받는다.
String userId = request.getParameter("user_id");
String userPw = request.getParameter("user_pw");
String idsave = request.getParameter("idsave");

//web.xml에 입력한 컨텍스트 초기화 파라미터를 application 내장객체로 읽어올수있다
System.out.println(userId+" : "+userPw);
out.println(userId+" : "+userPw);

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePw = application.getInitParameter("OraclePw");

/* 위정보 통해 dao객체 생성하고 오라클에 연결
폼값으로 받은 아이디, 비번을 인수로 전달하여 로그인처리 위한 회원인증진행
일치하는 레코드있다면 DTO에저장하여 반환 > 자원해제

로그인 성공한경우 > 세션 영역에 회원아이디와 이름을 저장 > 로그인페이지로 '이동' 한다.
로그인실패한 경우 > request 영역에 에러메세지 저장 > 로그인페이지로 '포워드' 한다.
*/

MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePw);
MemberDTO dto = dao.getMemberDTO(userId, userPw);
dao.close();

if(dto.getId() != null){
	if (idsave != null && idsave.equals("y")) CookieManager.makeCookie(response, "loginId2", userId, 86400);
	else CookieManager.deleteCookie(response, "loginId2");
	session.setAttribute("UserId", dto.getId());
	session.setAttribute("UserName", dto.getName());
	response.sendRedirect("LoginForm.jsp");
	
}else{
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>