<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<% //클라이언트가 작성한 폼값을 받아온다.
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 dto객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);

//특히 아이디 경우 로그인후작성페이지에 진입할수있어 세션영역에 저장된 회원아이디를 가져와 저장
dto.setId(session.getAttribute("UserId").toString());

//DB연결위해 dao객체생성 > 
BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

if(iResult == 1) response.sendRedirect("List.jsp");
else JSFunction.alertBack("글쓰기에 실패했습니다.", out);
%>