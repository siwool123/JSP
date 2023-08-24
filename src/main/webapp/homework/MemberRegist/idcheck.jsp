<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePw = application.getInitParameter("OraclePw");
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePw);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> 
    //재입력한 아이디를 부모창으로 전송한다.
    function idUse(){
        //opener속성을 통해 부모창의 DOM을 선택할 수 있다. 
        opener.document.myform.id.value = document.overlapFrm.retype_id.value;
        self.close();
    }
</script>
</head>
<body>
<h2>아이디 중복확인</h2>
    <div>
        입력한 아이디 : <%= id %>  
<%
if(dao.checkId(id)){
%>      
        <p>
            아이디가 중복되어 사용할 수 없습니다. <br>
            다른 아이디를 다시 입력해 주세요.
            
        </p>
        <form name="overlapFrm">
            <input type="text" name="retype_id" size="20" />
            <input type="button" value="아이디사용하기" onclick="idUse();" />
        </form>
<%
} else {
%>
		<p>
            입력하신 아이디는 사용가능합니다.
        </p>
<%
}
%>
	
    </div>
</body>
</html>