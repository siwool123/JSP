<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("user_id");
String userPw = request.getParameter("user_pw");

String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePw = application.getInitParameter("OraclePw");

MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePw);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
dao.close();

if(memberDTO.getId() != null){
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	response.sendRedirect("LoginForm.jsp");
}else{
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>