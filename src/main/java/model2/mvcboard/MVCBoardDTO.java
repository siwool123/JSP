package model2.mvcboard;

import java.sql.Date;

public class MVCBoardDTO {
	
	private String idx;
	private String name;
	private String title;
	private String content;
	private Date postdate;
	private String ofile;
	private String sfile;
	private int downcnt;
	private String pw;
	private int visitcnt;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public int getDowncnt() {
		return downcnt;
	}
	public void setDowncnt(int downcnt) {
		this.downcnt = downcnt;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getVisitcnt() {
		return visitcnt;
	}
	public void setVisitcnt(int visitcnt) {
		this.visitcnt = visitcnt;
	}
	
}
