<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.MyFileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
MyFileDAO dao = new MyFileDAO();
List<MyFileDTO> flist = dao.myFileList();
dao.close(); //커넥션풀에 반납
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 게시판</title>
</head>
<body>
<h2>DB에 등록된 파일목록보기</h2>
<a href="FileUploadMain.jsp">파일등록1</a>
<a href="MultiUploadMain.jsp">파일등록2</a>
<br /><br />
<table border="1">
	<tr>
		<th>No</th>
		<th>제목</th>
		<th>카테고리</th>
		<th>원본 파일명</th>
		<th>저장된 파일명</th>
		<th>작성일</th>
		<th>비고</th>
	</tr>
<% for(MyFileDTO dto : flist){ %>
	<tr align="center">
		<td><%= dto.getIdx() %></td>
		<td><%= dto.getTitle() %></td>
		<td><%= dto.getCate() %></td>
		<td><%= dto.getOfile() %></td>
		<td><%= dto.getSfile() %></td>
		<td><%= dto.getPostdate() %></td>
		<td><a href="Download.jsp?oName=<%= URLEncoder.encode(dto.getOfile(), "UTF-8") %>&sName=<%= URLEncoder.encode(dto.getSfile(), "UTF-8") %>">[다운로드]</a></td>
	</tr>
<%	} %>
</table>
</body>
</html>