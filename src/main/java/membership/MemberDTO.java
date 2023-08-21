package membership;
/* DTO(Data Transfer Object) : jsp와 자바파일 간 데이터 전달하기 위한 객체로
 * 자바빈 규약 (교재 114페이지 참조) 에의해 제작 */
public class MemberDTO {
//멤버변수 : 멤버테이블의 컬럼과동일하게 생성
	private String id;
	private String pw;
	private String name;
	private String regidate;
//필요한경우아니면 기본생성자 꼭 생성하지않아도됨. 디폴트생성자가 자동추가되기때문
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
}
