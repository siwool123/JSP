<%@page import="utils.JSFunction"%>
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw1");
String name = request.getParameter("name");
String email = request.getParameter("email1")+"@"+request.getParameter("email2");
String emailok = request.getParameter("mailing");
String add1 = request.getParameter("zipcode");
String add2 = request.getParameter("addr1");
String add3 = request.getParameter("addr2");
String phone = request.getParameter("mobile1")+request.getParameter("mobile2")+request.getParameter("mobile3");
String smsok = request.getParameter("sms");

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePw = application.getInitParameter("OraclePw");

/* 위정보 통해 dao객체 생성하고 오라클에 연결
폼값으로 받은 아이디, 비번을 인수로 전달하여 로그인처리 위한 회원인증진행
일치하는 레코드있다면 DTO에저장하여 반환 > 자원해제

회원가입 성공한경우 > 세션 영역에 회원아이디와 이름을 저장 > 로그인페이지로 '이동' 한다.
회원가입 실패한 경우 > request 영역에 에러메세지 저장 > 회원가입 페이지로 '포워드' 한다.
*/

MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePw);
int result = dao.getMemberDTO(id, pw, name, email, emailok, add1, add2, add3, phone, smsok);
dao.close();

if(result==1){
	/* session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName()); */
	/* request.setAttribute("MembershipWelcomeMsg", "회원가입을 환영합니다.");*/
	try {
		out.println("<script>alert('회원가입을 환영합니다.');</script>");
	}catch(Exception e) {}
	response.sendRedirect("/JSPStudy/06Session/LoginForm.jsp"); 
}else{
	try {
		out.println("<script>alert('회원가입 오류입니다.');</script>");
	}catch(Exception e) {}
	request.getRequestDispatcher("RegiFormValidate.html").forward(request, response);
}
%>