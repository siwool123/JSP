package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;
/* DAO(Data Access Object) : 실제 DB에 접근하여 기본적인 crud 작업하기위한 객체
 * DB접속 및 Select 같은 쿼리문 실행후 결과 반환받는 역할
 * 
 *  JDBC 위한 클래스 상속하여 DB에 연결한다. 
 *  매개변수가 4개인 부모의 생성자 호출하여 DB연결
 *  application 내장객체를 인수로 전달한 후 DB연결
 *  */
public class MemberDAO extends JDBConnect {

	public MemberDAO(ServletContext application) {
		super(application);
	}

	public MemberDAO(String driver, String url, String id, String pw) {
		super(driver, url, id, pw);
	}
/* 사용자가 입력한 아이디, 패스워드로 회원테이블에 존재하는 회원정보와 일치한경우
 * DTO객체에 레코드 담아 반환한다.
 * 회원인증 위한 쿼리실행후 회원정보 저장하기 위해 DTO객체 생성
 * 로그인폼에서입력한 아이디, 비번을 통해 인파라미터를 설정할수있도록 쿼리문작성 */	
	public MemberDTO getMemberDTO(String uid, String upw) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT * FROM member WHERE id=? AND pw=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upw);
			rs = psmt.executeQuery();
			
			if(rs.next()) { //반환된 rs객체에 정보가있는지 확인
				dto.setId(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int getMemberDTO(String id, String pw, String name, String email, String emailok, String add1, String add2, String add3, String phone, String smsok) {
//		MemberDTO dto = new MemberDTO();
		String sql = "INSERT INTO member2 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
		int affected = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, email);
			psmt.setString(5, emailok);
			psmt.setString(6, add1);
			psmt.setString(7, add2);
			psmt.setString(8, add3);
			psmt.setString(9, phone);
			psmt.setString(10, smsok);
			affected = psmt.executeUpdate();
			
//			if(rs.next()) { //반환된 rs객체에 정보가있는지 확인
//				dto.setId(rs.getString(1));
//				dto.setPw(rs.getString(2));
//				dto.setName(rs.getString(3));
//				dto.setEmail(rs.getString(4));
//				dto.setEmailok(rs.getString(5));
//				dto.setAdd1(rs.getString(6));
//				dto.setAdd2(rs.getString(7));
//				dto.setAdd3(rs.getString(8));
//				dto.setPhone(rs.getString(9));
//				dto.setSmsok(rs.getString(10));
//			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return affected;
	}
	
	public boolean checkId(String id) {
		String sql = "SELECT * FROM member2 WHERE id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
