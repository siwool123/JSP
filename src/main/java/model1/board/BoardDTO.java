package model1.board;

import java.sql.Date;
/* 멤버변수 : board 테이블 컬럼과 동일하게 선언
 * member 테이블과의 조인 통해 회원이름 출력해야할때 위해 멤버변수추가
 * 특별한이유없다면 생성자 따로 선언하지않는다.
 *  */
public class BoardDTO {
	private String num;
	private String title;
	private String content;
	private String id;
	private Date postdate;
	private String visitcnt;
	private String name;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcnt() {
		return visitcnt;
	}
	public void setVisitcnt(String visitcnt) {
		this.visitcnt = visitcnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
