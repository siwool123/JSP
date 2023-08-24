package membership;
/* DTO(Data Transfer Object) : jsp와 자바파일 간 데이터 전달하기 위한 객체로
 * 자바빈 규약 (교재 114페이지 참조) 에의해 제작. 보통 테이블 하나당 한개씩생성 */
public class MemberDTO {
//멤버변수 : 멤버테이블의 컬럼과동일하게 생성
	private String id;
	private String pw;
	private String name;
	private String email;
	private String emailok;
	private String add1;
	private String add2;
	private String add3;
	private String phone;
	private String smsok;
	private String regidate;
//필요한경우아니면 기본생성자 생성하지않아도됨. 디폴트생성자가 자동추가되기때문
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailok() {
		return emailok;
	}
	public void setEmailok(String emailok) {
		this.emailok = emailok;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public String getAdd3() {
		return add3;
	}
	public void setAdd3(String add3) {
		this.add3 = add3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSmsok() {
		return smsok;
	}
	public void setSmsok(String smsok) {
		this.smsok = smsok;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
}
