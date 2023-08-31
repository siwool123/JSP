package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import model1.board.BoardDTO;

public class MVCBoardDAO extends DBConnPool {

	public MVCBoardDAO() {
		super();
	}

	public int selectCnt(Map<String, Object> map) {
		int totalcnt = 0;
		String sql = "SELECT COUNT(*) FROM mvcboard";
		if(map.get("searchWord")!=null) sql += " WHERE "+map.get("searchField")+" LIKE '%"+map.get("searchWord")+"%'";
		try { 
			stmt = con.createStatement(); //정적 쿼리실행위한 Statement 객체생성
			rs = stmt.executeQuery(sql);
			rs.next(); 
			totalcnt = rs.getInt(1);
		}catch(Exception e) {
			System.out.println("게시물 수 카운트 중 예외발생");
			e.printStackTrace();
		}
		return totalcnt;
	}
	
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>(); 
		String sql = "SELECT * FROM (SELECT T1.*, ROWNUM R FROM (SELECT * FROM mvcboard";
		if(map.get("searchWord")!=null) {
			sql += " WHERE " + map.get("searchField")+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		sql += " ORDER BY idx DESC) T1) WHERE R BETWEEN ? AND ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncnt(rs.getInt(8));
				dto.setPw(rs.getString(9));
				dto.setVisitcnt(rs.getInt(10));
				
				board.add(dto); //리스트에 dto추가
			}
		}catch(Exception e) {
			System.out.println("게시물 조회 중 예외발생"); 
			e.printStackTrace();
		}
		return board;
	}
	
	public int insertWrite(MVCBoardDTO dto) {
		int result=0;
		try {
			String sql = "INSERT INTO mvcboard (idx, name, title, content, ofile, sfile, pw) VALUES (seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPw());
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외발생");
			e.printStackTrace();
		} 
		return result;
	}
}
