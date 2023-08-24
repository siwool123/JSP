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

/* 회원가입 성공한경우 > 세션 영역에 회원아이디와 이름을 저장 > 로그인페이지로 '이동' 한다.
회원가입 실패한 경우 > request 영역에 에러메세지 저장 > 회원가입 페이지로 '포워드' 한다. */
int result = 0;
MemberDTO dto = new MemberDTO();
dto.setId(id);
dto.setPw(pw);
dto.setName(name);
dto.setEmail(email);
dto.setEmailok(emailok);
dto.setAdd1(add1);
dto.setAdd2(add2);
dto.setAdd3(add3);
dto.setPhone(phone);
dto.setSmsok(smsok);

MemberDAO dao = new MemberDAO(application);
result = dao.memberjoinDTO(dto);
dao.close();

if(result==1){
	/* session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName()); */
	/* request.setAttribute("MembershipWelcomeMsg", "회원가입을 환영합니다.");*/
	out.println("회원가입을 환영합니다.");
	out.println("<script>alert('회원가입을 환영합니다.');</script>");
	/* response.sendRedirect("/JSPStudy/06Session/LoginForm.jsp");  */
}else{
	out.println("회원가입 오류입니다.");
	out.println("<script>alert('회원가입 오류입니다.');</script>");
	/* request.getRequestDispatcher("RegiFormValidate.html").forward(request, response); */
}
%>