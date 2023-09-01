<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/f101226514.js" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="./images/favicon.ico" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
var optionArr = {
		Literature: ['한국소설', '외국소설', '한국에세이', '외국에세이', '장르문학', '고전문학/신화', '시', '희곡/시나리오', '문학이론/비평'],
        Economy: ['경영', '경제', '마케팅/세일즈', '재테크/투자', '창업/취업', 'CEO/리더쉽', '자기관리'],
        Human: ['인문교양', '철학', '언어학/기호학', '심리학', '출판/도서/창작', '신화학', '문명/고고학'],
        Art: ['예술의이해', '미술', '음악', '사진', '영화/연극', '무용/뮤지컬', '건축/디자인', '대중문화'],
        Religion: ['종교학', '기독교', '가톨릭', '불교', '세계종교', '역학'],
        History: ['역사학', '한국사', '서양사', '동양사', '주제별역사'],
        People: ['종교인', '사회운동가/혁명가', '여러인물이야기', '철학자/사상가', '과학자/의료인', '교육자', '여성인물', '경영/기업가', '자서전', '예술가', '정치인/군인', '연예인/운동선수', '언론인', '인물기타'],
        Society: ['사회학', '행정학', '교육학', '정치/외교학', '법학', '통계학', '언론/미디어', '여성학', '지리학', '환경/생태', '사회사상', '국방/군사학'],
        Science: ['과학의이해', '물리', '화학', '생명과학', '천문학', '수학', '지구과학', '의학/간호학', '농업/임학', '기술공학'],
        Kid: ['초등1~2', '초등3~4', '초등5~6', '한국동화', '외국동화', '동요/동시', '어린이학습', '어린이만화', '어린이취미/놀이', '세트/전집'],
        Study: ['초등1학년', '초등2학년', '초등3학년', '초등4학년', '초등5학년', '초등6학년', '초등종합참고서', '중학1학년', '중학2학년', '중학3학년', '중학종합참고서', '고등1학년', '고등문제집', '고등자습서', '수능영역별', '고등영어종합', 'EBS교육방송', '대입/논술과면접'],
        Exam: ['국가고시', '공무원', '임용고시', '편입/검정/독학사', '공인중개사/주택관리사', '금융/경제/물류', '보건/위생/의학', '법무/사회', '취업/상식/적성검사', '운전/관광', '전자/전기', '건축/토목/기계', '가스/안전/환경', '음식/미용', '컴퓨터/IT', '한자', '기타'],
        Computer: ['게임/디카/입문/활용', 'OS/Networking', 'e비즈니스/창업', '오피스활용', '홈페이지/웹', '컴퓨터공학', '프로그래밍언어', '그래픽/멀티미디어', '프로그래밍 개발/방법론'],
        Magazine: ['가정/육아', '경제/경영', '요리/건강', '여성/남성/패션', '여행/취미/스포츠', '연예/영화', '교양', '문화/예술', '자동차/과학/기술', '컴퓨터/게임/그래픽', '성인지(19+)', '수험/어학교재', '만화/애니메이션', '시사', '종교', '다이어리/달력', '사회과학'],
        Textbook: ['경상계열', '공학계열', '자연과학계열', '의약간호계열', '농축산학계열', '법학계열', '사범계열', '사회과학계열', '인문계열', '어문학계열', '예체능계열', '생활환경계열'],
        Life: ['가정생활', '요리', '육아', '임신/출산/태교', '인테리어/주거환경', '건강/다이어트/미용', '질병과예방', '패션/수공예', '자녀교육'],
        Language: ['영어', '일본어', '중국어', '한문/한국어', '독일어/프랑스어/스페인어', '기타외국어'],
        Dictionary: ['국어사전', '중국어/한자/옥편', '영어사전', '일어사전', '독일어', '스페인어', '프랑스어', '기타외국어', '백과/연감', '전문사전'],
        Foreign: ['문학', '유아/어린이', 'ELT/사전', '경제/경영', '실용', '예술/디자인', '컴퓨터/기술', '잡지', '베스트']
	}

//관심분야 선택
$(function () {
    $("#etc1").change(function () {
        $("#etc2 option:selected").length = 0;
        let sValue = $("#etc1 option:selected").val();
        for (var i = 0; i < optionArr[sValue].length; i++) {
            let cOption = $("<option value=" + optionArr[sValue][i] + ">" + optionArr[sValue][i] + "</option>");
            $("#etc2").append(cOption);
        }
    });
});

</script>
</head>
<body>
 <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
    <a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">  <!--GET 방식으로 요청-->
      GET 방식 전송
    </a><br />
    <form action="RequestWebInfo.jsp" method="post">  <!--POST 방식으로 요청-->
        영어 : <input type="text" name="eng" value="Bye" /><br />
        한글 : <input type="text" name="han" value="잘 가" /><br />
        <input type="submit" value="POST 방식 전송" />
    </form>

    <h2>2. 클라이언트의 요청 매개변수 읽기</h2>
    <form method="post" action="RequestParameter.jsp">  <!--다양한 <input> 태그 사용-->
        아이디 : <input type="text" name="id" value="" /><br />
        성별 :
        <input type="radio" name="sex" value="man" />남자
        <input type="radio" name="sex" value="woman" checked />여자<br />
        관심사항 :
        <input type="checkbox" name="favo" value="eco" />경제
        <input type="checkbox" name="favo" value="pol" checked />정치
        <input type="checkbox" name="favo" value="ent" />연예<br />
        자기소개 : 
        <textarea name="intro" cols="30" rows="4"></textarea><br /><br>
<%-- select태그는 multiple 속성에 체크박스 혹은 라디오2가지형식으로 사용가능
해당 속성이 추가되면 배열형태로 전송되므로 getParameterValues() 로 받아야한다. --%>
        학력 : 
        <select name="grade" size="2" multiple>
        <option value="초등">초딩</option>
        <option value="고등">고딩</option>
        </select><br><br>
        
        관심분야 :
        <select name="etc1" class="userSelect" id="etc1" style="width: 200px;">
            <option value="">선택하세요</option>
            <option value="Literature">문학</option>
            <option value="Economy">경제/경영</option>
            <option value="Human">인문</option>
            <option value="Art">예술/대중문화</option>
            <option value="Religion">종교</option>
            <option value="History">역사</option>
            <option value="People">인물</option>
            <option value="Society">사회</option>
            <option value="Science">과학</option>
            <option value="Kid">어린이</option>
            <option value="Study">학습/참고서</option>
            <option value="Exam">수험서/자격증</option>
            <option value="Computer">컴퓨터/인터넷</option>
            <option value="Magazine">잡지</option>
            <option value="Textbook">대학교재</option>
            <option value="Life">가정/건강/생활</option>
            <option value="Language">외국어/어학</option>
            <option value="Dictionary">사전</option>
            <option value="Foreign">외국도서</option>
        </select>
        <select name="etc2" id="etc2" style="width: 200px;">
            <option value="">선택하세요</option>
        </select> <br /><br />
        
        <ul class="userTable2 mt-5">
            <li><input type="checkbox" id="chkAll" name="chkAll" value="y"> &nbsp; 모든 약관에 동의합니다. 
            <a href="" >[전체보기]</a></li>
            <li><input type="checkbox" name="chk" value="a"> &nbsp; [필수] 이용약관 <a href="" >[전체보기]</a></li>
            <li><input type="checkbox" name="chk" value="b"> &nbsp; [필수] 개인정보처리방침 <a href="" >[전체보기]</a>
            </li>
            <li><input type="checkbox" name="chk" value="c"> &nbsp; [필수] 개인정보 수집 및 이용동의 
            <a href="" >[전체보기]</a> </li>
            <li>[선택] 마케팅수신동의 
            	<input type="checkbox" class="chk" name="mailok" value="y" style="margin-left: 20px;">&nbsp; 이메일
                <input type="checkbox" class="chk" name="smsok" value="y" style="margin-left: 20px;"> &nbsp; 휴대폰
            </li>
        </ul>
        <input type="submit" value="전송하기" />
    </form>

    <h2>3. HTTP 요청 헤더 정보 읽기</h2>
    <a href="RequestHeader.jsp">  <!--HTTP 요청 헤더 읽기-->
        요청 헤더 정보 읽기
    </a>
</body>
</html>