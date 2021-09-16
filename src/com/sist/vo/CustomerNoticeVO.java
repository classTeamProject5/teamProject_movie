package com.sist.vo;
/*
 * NO      NOT NULL NUMBER        
TYPE    NOT NULL VARCHAR2(30)  
TITLE   NOT NULL VARCHAR2(200) 
REGDATE NOT NULL DATE          
CONTENT NOT NULL CLOB          
HIT              NUMBER   
 */

import java.util.Date;

public class CustomerNoticeVO {
	private int no,hit,cno;
	private String type,title,content,all_type;
	private Date regdate;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getAll_type() {
		return all_type;
	}
	public void setAll_type(String all_type) {
		this.all_type = all_type;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
