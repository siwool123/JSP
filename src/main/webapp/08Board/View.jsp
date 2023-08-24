<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 목록에서 제목클릭시 게시물의 일련번호를 ?num=99 처럼받아온다.
게시물 인출위해 파라미터를 받아온다. > dao객체생성하여 오라클연결
> 게시물 조회수 증가 > 게시물 내용 추출하여 dto에 저장 */
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);
dao.updateVisitcnt(num);
BoardDTO dto = dao.selectView(num);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
function deletePost() {
	var confirmed = confirm("정말로 삭제하시겠습니까?");
    if (confirmed) {
        var form = document.writeFrm;
        form.method = "post";
        form.action = "DeleteProcess.jsp";
        form.submit();
    }
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 상세보기 (View)</h2>
<form name="writeFrm">
	<input type="hidden" name="num" value="<%= num %>" />
	<table border="1" width="90%">
		<tr>
			<td>번호</td>
			<td><%= dto.getNum() %></td>
			<td>작성자</td>
			<td><%= dto.getName() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%= dto.getPostdate() %></td>
			<td>조회수</td>
			<td><%= dto.getVisitcnt() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%= dto.getTitle() %></td>
		</tr>
		<tr>
<!-- 입력시 줄바꿈 위한 엔터는 \r\n으로 입력되므로 웹브라우저에출력시엔 br태그로 변경해야함 -->
			<td>내용</td>
			<td colspan="3" height="100"><%= dto.getContent().replace("\r\n", "<br/>") %></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<%
/* 로그인된상태에서 세션영여겡저장된 아이디가 해당게시물작성한 아이디와 일치하면 수정, 삭제버튼을 보이게처리
  즉 작성자 본인이 해당게시물조회시 수정,삭제버튼 보이게처리한다. */
			if (session.getAttribute("UserId")!=null && session.getAttribute("UserId").toString().equals(dto.getId())){
			%>
			<button type="button" onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>';">수정하기</button>
			<button tyep="button" onclick="deletePost();">삭제하기</button>
			<%	
			}
			%>
			<button type="button" onclick="location.href='List.jsp';">목록보기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>