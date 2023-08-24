<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 dto객체에 저장
BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

//DB연결위해 dao객체생성 > 
BoardDAO dao = new BoardDAO(application);
int result = dao.updateEdit(dto);
dao.close();

if(result == 1) response.sendRedirect("View.jsp?num="+dto.getNum());
else JSFunction.alertBack("수정하기에 실패했습니다.", out);
%>
