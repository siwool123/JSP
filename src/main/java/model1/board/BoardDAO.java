package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import common.JDBConnect;
import jakarta.servlet.ServletContext;

/* JDBC 이용한 DB연결위한 클래스상속
 * 인수생성자에서는 application 내장객체를 매개변수로 전달
 * 부모생성자에서는 application 통해 web.xml에 직접 접근하여 컨텍스트 초기화 파라미터를 얻어온다. 
 * 
 * */

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}

	//게시물 개수 카운트하여 int형으로 반환하는메소드
	public int selectCnt(Map<String, Object> map) {
		int totalcnt = 0;
		
		String sql = "SELECT COUNT(*) FROM board";
		if(map.get("searchWord")!=null) sql += " WHERE "+map.get("searchField")+" LIKE '%"+map.get("searchWord")+"%'";
		try { 
			stmt = con.createStatement(); //정적 쿼리실행위한 Statement 객체생성
			rs = stmt.executeQuery(sql);
			rs.next(); 
			//커서를 첫번쨰 행으로 이동하여 레코드를 읽는다.
			//첫번째 컬럼 count(*) 의 값을 가져와서 변수에 저장
			totalcnt = rs.getInt(1);
		}catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
		return totalcnt;
	}
	
/* 작성게시물을추출하여반환. 
 * 특히반환값은 여러개의 레코드를 반환할수있고 순서 보장해야하므로 List컬렉션 사용 
 * List컬렉션 생성. 이때 타입매개변수는 board 테이블 대상으로 하므로 BoardDTO로 설정
 *  */
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>(); //벡터는 리스트의 일종. ArrayList와 유사
		
		String sql = "SELECT * FROM board";
		if(map.get("searchWord")!=null) sql += " WHERE "+map.get("searchField")+" LIKE '%"+map.get("searchWord")+"%'";
		sql += " ORDER BY num DESC";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
//2개 이상의 레코드가 반환될수있으므로 while문 사용
			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
//setter이용하여 각컬럼값을 멤버변수에 저장				
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPostdate(rs.getDate(5));
				dto.setId(rs.getString(4));
				dto.setVisitcnt(rs.getString(6));
				
				bbs.add(dto); //리스트에 dto추가
			}
		}catch(Exception e) {
			System.out.println("게시물 조회 중 예외발생"); 
			e.printStackTrace();
		}
		return bbs;
	}

//게시물 입력위한 메소드. 폼값이 저장된 dto객체를 인수로 받는다.
	public int insertWrite(BoardDTO dto) {
		int result=0;
		try {
			String sql = "INSERT INTO board (num, title, content, id, visitcnt) VALUES (seq_board_num.NEXTVAL, ?, ?, ?, 0)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String sql = "SELECT B.*, M.name FROM member M INNER JOIN board B ON M.id=B.id WHERE num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
/* 일련번호는 중복되지 않으므로 단한개의 게시물을 추출한다. 따라서 while이아닌 if사용. 
 * next()메소드는 rs으로 반환된 게시물을 확인해서 존재하면 true 반환한다.
 * 각 컬럼값추출시 1부터시작한느 인덱스와 컬럼명 둘다사용가능. 날짜인 경우getDate()메소드로 추출가능
 */
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setPostdate(rs.getDate(5));
				dto.setId(rs.getString(4));
				dto.setVisitcnt(rs.getString(6));
				dto.setName(rs.getString(7));
			}
		}catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitcnt(String num) {
		String sql = "UPDATE board SET visitcnt=visitcnt+1 WHERE num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeQuery();
		}catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}

//게시물 수정하기 > 특정일련번호에 해당하는 게시물 수정
	public int updateEdit(BoardDTO dto) {
		int result=0;
		try {
			String sql = "UPDATE board SET title=?, content=? WHERE num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 수정 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result=0;
		try {
			String sql = "DELETE FROM board WHERE num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getNum());
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
}
