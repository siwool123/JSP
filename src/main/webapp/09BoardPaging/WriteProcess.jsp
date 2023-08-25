<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IsLoggedIn.jsp" %>
<% //클라이언트가 작성한 폼값을 받아온다.
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 dto객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);

dto.setId(session.getAttribute("UserId").toString());
 
BoardDAO dao = new BoardDAO(application);
/* int iResult = dao.insertWrite(dto); */
//더미게시물입력위해 반복문 사용
int iResult = 0;
for(int i=1; i<=100; i++){
	dto.setTitle(title+"-"+i);
	iResult = dao.insertWrite(dto);
}
dao.close();

if(iResult == 1) response.sendRedirect("List.jsp");
else JSFunction.alertBack("글쓰기에 실패했습니다.", out);
%>