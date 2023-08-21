<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
/*해당 페이지에선 가장먼저 팝업창오픈 관련쿠키가 있는지 먼저확인후 팝업창처리해야함
팝업창 오픈여부 판단위한 변수 */
String popupMode = "on"; 

//쿠키를 배열로 얻어온후 웹브라우저에 생성된 모든 쿠키를 읽는다.
/* 생성 쿠키중 popupclose 쿠키명과 일치하는 쿠키를 찾음. 
조건만족하면 변수에 쿠키값 저장 */
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie c : cookies) {
        String cookieName = c.getName();
        String cookieValue = c.getValue();
        if (cookieName.equals("PopupClose")) {
            popupMode = cookieValue; 
        }
    }
} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업관리</title>
<style>
    div#popup{
        position: absolute; top:100px; left:100px; color:yellow;  
        width:300px; height:100px; background-color:gray;
    }
    div#popup>div{
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
//jquery의 엔트리포인트 > 팝업창닫기버튼누르면 아래내용실행
/* 체크한경우 value얻어와 변수에저장. 1로 설정되어있다 */
$(function() {
    $('#closeBtn').click(function(){
    	$('#popup').hide();
    	var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
    	$.ajax({
    		url : './PopupCookie.jsp', //요청할서버의 url or 경로
    		type : 'get',
//요청시 전송할 파라미터, 여기선 체크박스의 값을 설정한다. 체크했다면1, 아니면 null 전송됨
    		data : {inactiveToday : chkVal},
    		dataType : "text", //콜백데이터타입은 text형식으로 지정
    		success : function(resData){ //요청성공시 호출될 콜백함수
    		if(resData) {console.log("있다."); location.reload(); }
    		else {console.log("없다.");}
    		console.log("콜백데이터", resData);
/* 콜백데이터에 지시어때문에 남게되는공백떄문에 불필요한 새로고침이 일어날수있다.
따라서 공백을 제거해야 정상동작하게된다. */
//만약 콜백데이터가있다면 페이지 새로고침 / location.href="" : ~로 이동
    		}
    	});
    });
});
</script>

</head>
<body>
<h2>팝업 메인 페이지</h2>
<%

  String str =  "현재 팝업창은 " + popupMode + " 상태입니다.<br/>";
  out.println(str.repeat(10));
  /* 스크립트렛 통해 위 출력문 10번 반복,
  변수 popupMode 초기값은 on이고, 만약쿠키생성됐다면 off로 설정된다.
 만약 변수값이 on이 아니라면 아래팝업창을 위한 html코드는 물리적으로 삽입되지않는다.
 즉 쿠키의 상태에 따라 페이지가 동적으로 변경된다. 이를 [동적웹페이지] 라고한다. */
   if (popupMode.equals("on")) {
%>
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right"><form name="popFrm">
            <input type="checkbox" id="inactiveToday" value="1" />
            하루 동안 열지 않음
            <input type="button" value="닫기" id="closeBtn" />
        </form></div>
    </div>
<%
    }
%>

</body>
</html>