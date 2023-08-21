package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {

	public MemberDAO(ServletContext application) {
		super(application);
	}

	public MemberDAO(String driver, String url, String id, String pw) {
		super(driver, url, id, pw);
	}
	
	public MemberDTO getMemberDTO(String uid, String upw) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT * FROM member WHERE id=? AND pw=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
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
}
