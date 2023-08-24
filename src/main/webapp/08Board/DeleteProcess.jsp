<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<% //클라이언트가 작성한 폼값을 받아온다.
String num = request.getParameter("num");

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();

int delResult = 0;
if(sessionId.equals(dto.getId())){
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	dao.close();
	
	if(delResult == 1) JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	else JSFunction.alertBack("삭제에 실패했습니다.", out);
}else{
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
	return;
}
%>