<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %> <!-- 수정전 로그인확인 -->
<% //수정폼에서입력한내용을 파라미터로 받는다.
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//dto객체에 수정할 내용을 저장
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DB연결위해 dao객체생성 > 
BoardDAO dao = new BoardDAO(application);
int result = dao.updateEdit(dto);
dao.close();

//수정완료시 수정내용확인위해 주로 내용보기페이지로 이동
if(result == 1) response.sendRedirect("View.jsp?num="+dto.getNum());
else JSFunction.alertBack("수정하기에 실패했습니다.", out);
%>
