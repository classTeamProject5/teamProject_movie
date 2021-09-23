package com.sist.vo;
/*
      no    notnull 
	BNO              NUMBER       
	TYPE             NUMBER       
	ID               VARCHAR2(20) 
	NAME    NOT NULL VARCHAR2(34) 
	MSG     NOT NULL CLOB         
	REGDATE          DATE  
 */
import java.util.*;
public class MovieReviewVO {
	  private int no,bno,type;
	    private String id,name,msg;
	    private Date regdate;
	    private String dbday; // 날짜 (시간=>오라클) TO_CHAR
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public int getBno() {
			return bno;
		}
		public void setBno(int bno) {
			this.bno = bno;
		}
		public int getType() {
			return type;
		}
		public void setType(int type) {
			this.type = type;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public String getDbday() {
			return dbday;
		}
		public void setDbday(String dbday) {
			this.dbday = dbday;
		}
		   
	}


