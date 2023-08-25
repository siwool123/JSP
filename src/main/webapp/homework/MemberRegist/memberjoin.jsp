<%@page import="utils.JSFunction"%>
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

if(id!=null) JSFunction.alertLocation("회원가입에 성공했습니다.", "/JSPStudy/06Session/LoginForm.jsp", out);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<style>
    *{font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: 12px;margin: 0px auto;}
    form{margin-top: 20px;}
    input, select, buttid_loadingon {border: 1px solid #afafaf;}
    input.userInput{padding:3px 2px;}
    select.userSelect{padding:2px 0;}
    .c_imp{color: red;}
    .userTable{border: none; border-collapse: collapse; width: 670px;}
    .userTable td{padding:10px; border: 1px solid #b9babb;}
    .userTable td.userTit{background-color: #E4E6E9; font-weight: bold;}
    .btn_search{background-color: #3d3d3d; color: #ffffff; width: 70px; height: 23px; padding:1px 0 2px;}
    .btn_search:hover{background-color: #6d6d6d;}        
    .btn_submit{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #E70E16;color:white;font-size: 14px;border:none;}
    .btn_cancel{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #464646;color:white;font-size: 14px;border:none;}
    #id_loading{position:absolute;top:400px;z-index:10;width:100%;text-align:center;display:none;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
function formValidate(frm){
    /*
    <form>에서 this를 통해 전달한 인수는 다음과 같다. 
    1. document.forms[0];
    2. document.myform;
    즉 <form> 태그의 DOM 객체이다. 
    */
    
    //아이디에 입력한 값이 있는지 확인한다. 
    if(frm.id.value==''){
        alert("아이디를 입력해주세요.");
        frm.id.focus();
        return false;
    }

    //아이디는 8~12자로 입력되었는지 검증
    if(!(frm.id.value.length>=8 && frm.id.value.length<=12)){
        //8~12자 사이가 아니라면..
        alert("아이디는 8~12자 사이만 가능합니다.");
        //입력된 값을 지우고 포커스를 이동한다. 
        frm.id.value = '';
        frm.id.focus();
        return false;
    }

    //아이디는 숫자로 시작할 수 없음
    /* 0과 9의 아스키코드값은 각각 48, 57이므로 아이디의 첫글자가
    만약 이 사이에 존재한다면 사용할 수 없는 아이디로 판단할 수 있다. */
    //입력한 아이디와 첫번째 문자, 아스키코드를 콘솔에서 확인한다. 
    console.log(frm.id.value, frm.id.value[0], 
        frm.id.value.charCodeAt(0));
    if(frm.id.value[0].charCodeAt(0)>=48 &&
            frm.id.value.charCodeAt(0)<=57){
        alert('아이디는 숫자로 시작할 수 없습니다.');
        frm.id.value = '';
        frm.id.focus();
        return false;
    }

    //아이디는 영문+숫자의 조합으로만 사용할 수 있다. 
    /* 아이디를 구성하는 각 문자가 소문자 a~z, 대문자 A~Z, 숫자 0~9
    사이가 아니라면 잘못된 문자가 포함된 경우이므로 전송을 중단한다.*/

    //아이디의 길이만큼 반복한다. 
    for(var i=0 ; i<frm.id.value.length ; i++){
        if(!((frm.id.value[i]>='a' && frm.id.value[i]<='z') ||
            (frm.id.value[i]>='A' && frm.id.value[i]<='Z') ||
            (frm.id.value[i]>='0' && frm.id.value[i]<='9'))){
            alert("아이디는 영문 및 숫자의 조합만 가능합니다.");
            frm.id.value='';
            frm.id.focus();
            return false; 
        }
    }


    //패스워드 입력 확인
    if(frm.pass1.value==''){
        alert("패스워드를 입력해주세요.");frm.pass1.focus();return false;
    }
    if(frm.pass2.value==''){
        alert("패스워드 확인을 입력해주세요.");frm.pass2.focus();return false;
    }
    //만약 입력한 패스워드가 일치하지 않는다면..
    if(frm.pass1.value!=frm.pass2.value){
        alert('패스워드가 일치하지 않습니다. 다시 입력해주세요.');
        //사용자가 입력한 패스워드를 지운다. 
        frm.pass1.value = '';
        frm.pass2.value = '';
        //입력상자로 포커싱 한다. 
        frm.pass1.focus();
        return false;
    }

    //폼 검증이 끝난후 서버로 전송 직후 로딩 이미지를 띄워준다. 
    document.getElementById("id_loading").style.display = 'block';
    //return false;
}

function inputEmail(frm){
    //이메일의 도메인을 선택한 경우의 value값 가져오기 
    var choiceDomain = frm.email_domain.value;
    if(choiceDomain==''){//--선택-- 부분을 선택한 경우..
        //입력한 모든 값을 지운다. 
        frm.email1.value = '';
        frm.email2.value = '';
        //아이디 입력란으로 포커싱한다.
        frm.email1.focus();
    }
    else if(choiceDomain=='직접입력'){//직접입력을 선택한 경우..
        //기존에 입력된 값을 지운다.
        frm.email2.value = '';
        //readonly 속성을 해제한다.
        frm.email2.readOnly = false;
        //포커스를 이동한다. 
        frm.email2.focus();
    }
    else{//포털 도메인을 선택한 경우..
        //선택한 도메인을 입력한다. 
        frm.email2.value = choiceDomain;
        //입력된 값을 수정할 수 없도록 readonly속성을 추가한다. 
        frm.email2.readOnly = true;
    }
}   
/* thisObj 입력상자에 inputLen 길이의 텍스트를 입력하면 nextName
엘리먼트로 포커스를 이동시킨다. */ 
function focusMove(thisObj, nextName, inputLen){
    //입력한 문자의 길이
    var strLen = thisObj.value.length;
    //제한 길이가 넘어가는지 확인 
    if(strLen >= inputLen){
        //alert("포커스 이동");
        /*
        eval() 함수는 문자열로 주어진 인수를 Javascript코드로 해석하여
        실행한다. 
        document.myform. => 문서객체를 이용한 DOM(form태그를 가리킴)
        nextName => 문자열이 전달된 매개변수
        객체와 문자열을 바로 연결하면 에러가 발생하므로 
        객체를 문자열로 변경한 후 eval()함수를 통해 JS코드로 재변환한다.
        */
        eval('document.myform.'+ nextName).focus();
    }  
} 
//아이디 중복확인 
function idCheck(fn){
    if(fn.id.value==''){
        alert("아이디를 입력후 중복확인 해주세요.");
        fn.id.focus();
    }
    else{
        //아이디 중복확인 창을 띄울때 입력한 아이디를 쿼리스트링으로 넘겨준다. 
        window.open('idcheck.jsp?id='+fn.id.value, 'idOver', 'width=500,height=300');
        //입력한 아이디를 수정할 수 없도록 속성을 추가한다. 
        fn.id.readOnly = true;
    }
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function postOpen(){    
    new daum.Postcode({
        oncomplete: function(data) {
            console.log(data);
            console.log(data.zonecode);
            console.log(data.address);
            
            let frm = document.myform;
            frm.zipcode.value = data.zonecode;
            frm.addr1.value = data.address;
            frm.addr2.focus();
        }
    }).open();
}
</script>
</head>
<body>
<%-- <jsp:include page="/JSPStudy/Common/Link.jsp" /> --%>
    <form name="myform" action="registAction.jsp" method="post" onsubmit="return formValidate(this);" target=".../06Session/LoginForm.jsp" >
        <table class="userTable">
            <colgroup>
                <col width="130px" />
                <col width="540px" />
            </colgroup>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 아이디</td>
                <td class="userVal">
                    <input type="text" name="id" value="" maxlength="15" class="userInput" size="16" />                    
                    <button type="button" class="btn_search" id="idSearch" onClick="idCheck(this.form);">중복확인</button>
                    &nbsp;&nbsp;&nbsp;<span style="color:#888888;"></span>
                    <div style="color:#888888; line-height: 30px;">+ 8~12자, 첫 영문자, 영문자와 숫자 조합</div>
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 비밀번호</td>
                <td class="userVal">
                    <input type="password" name="pw1" value="" class="userInput" maxlength="25" size="16" />
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 비밀번호 확인</td>
                <td class="userVal">
                    <input type="password" name="pw2" value="" class="userInput" maxlength="25" size="16" />
                    <span style="margin:0 0 0 3px;color:#888888;">(확인을 위해 다시 입력해 주세요.)</span>
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 이름</td>
                <td class="userVal">
                    <input type="text" name="name" value="" class="userInput" maxlength="10" size="16" />
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 이메일</td>
                <td class="userVal">
				<br /><input type="text" name="email1" value="" class="userInput" size="10" />
                    <span style="font-size:16px;">＠</span>
                    <input type="text" name="email2" value="" class="userInput" size="10" />
                    <select name="email_domain" onchange="inputEmail(this.form);"  class="userSelect" style="width:100px;" >
                        <option value="">-- 선택 --</option>
                        <option value="naver.com">naver.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="직접입력" selected>직접입력</option>
                    </select>&nbsp;&nbsp;&nbsp;
                    <label><input type="radio" name="mailing" value="yes" />&nbsp;수신허용</label>&nbsp;
                    <label><input type="radio" name="mailing" value="no" />&nbsp;수신불가</label><br /><br />
                    <p>※ hanmail.net은 메일 수신이 어려울 수 있으니 가급적 다른 메일을 이용하시기 바랍니다.</p><br />
                </td>
            </tr>
            <tr>
                <td class="userTit"><span style="margin-left:10px;"></span> 주소</td>
                <td class="userVal">
                    <br /><button type="button" class="btn_search" onClick="postOpen();" style="border:none;">주소찾기</button>
                    <input type="text" name="zipcode" maxlength="10" value="" class="userInput" size="6" /> (우편번호) <br />
                	<input type="text" name="addr1" class="userInpu" maxlength="100" value="" size="50" style="height:19px; margin: 20px 0;" /><br />
                	<input type="text" name="addr2" class="userInput" maxlength="100" value="" size="50" style="margin-bottom: 10px;" />&nbsp; + 나머지 주소
                </td>
            </tr>
            <tr>
                <td class="userTit"><span class="c_imp">*</span> 휴대전화</td>
                <td class="userVal">
                    <input type="text" name="mobile1" value="" class="userInput" onkeyup="focusMove(this,'mobile2',3);" size="5" /> -
                    <input type="text" name="mobile2" value="" class="userInput" maxlength="4" onkeyup="focusMove(this,'mobile3',4);" size="5" /> -
                    <input type="text" name="mobile3" value="" class="userInput" maxlength="4" size="5" />
                    &nbsp;&nbsp;&nbsp;
                    <label><input type="radio" name="sms" value="yes" />&nbsp;SMS 수신허용</label>&nbsp;
                    <label><input type="radio" name="sms" value="no" />&nbsp;SMS 수신불가</label>
                </td>
            </tr>
        </table>
        <table style="width:670px; margin-top:20px;">
            <tr>
                <td align="center">                    
                    <input type="submit" value="등록하기" class="btn_submit" />&nbsp;&nbsp;
                    <input type="reset" value="새로쓰기" class="btn_cancel" />
                </td>
            </tr>
        </table>       
    </form>

    <div id="id_loading">
        <img src="./images/loading.gif" style="width:40%;" />
    </div>
</body>
</html>