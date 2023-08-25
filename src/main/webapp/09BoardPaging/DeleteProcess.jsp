<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<% /* 일련번호를 폼값으로 받는다. > 본인확인위해 기존게시물추출 */
String num = request.getParameter("num");

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();
//String sessionId = (String)session.getAttribute("UserId");
/* 세션영역에 저장된 회원정보를 얻어온후 String 타입으로 변환한다.
  세션영역 포함한 4가지영역에 값 저장시엔 모두 object 타입으로 자동형변환되므로
  사용위해선 기존타입으로 형변환해야한다. 
  
  세션아이디와 게시물아이디가일치하면 작성자 본인이므로..> 게시물 삭제 > 삭제후목록으로이동*/

int delResult = 0;
if(sessionId.equals(dto.getId())){
	dto.setNum(num);
	delResult = dao.deletePost(dto);
	dao.close();
	
	if(delResult == 1) JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	else JSFunction.alertBack("삭제에 실패했습니다.", out); //삭제실패시뒤로이동
}else{
	JSFunction.alertBack("본인만 삭제할 수 있습니다.", out); //작성자본인아니면 삭제불가
	return;
}
%>