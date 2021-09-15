package com.sist.vo;
/*
 * NO         NOT NULL NUMBER        
MNO                 NUMBER        
REGDATE             VARCHAR2(50)  
TITLE      NOT NULL VARCHAR2(100) 
THEATER    NOT NULL VARCHAR2(30)  
STARTTIME  NOT NULL VARCHAR2(30)  
ENDTIME    NOT NULL VARCHAR2(30)  
TOTALSEAT  NOT NULL NUMBER        
REMAINSEAT NOT NULL NUMBER        
GRADE      NOT NULL VARCHAR2(30)  

 */
public class MovieTimeVO {
private int no,mno,totalseat,remainseat,rn;
private String regdate,title,theater,starttime,endtime,grade;

public int getRn() {
   return rn;
}
public void setRn(int rn) {
   this.rn = rn;
}
public int getNo() {
   return no;
}
public void setNo(int no) {
   this.no = no;
}
public int getMno() {
   return mno;
}
public void setMno(int mno) {
   this.mno = mno;
}
public int getTotalseat() {
   return totalseat;
}
public void setTotalseat(int totalseat) {
   this.totalseat = totalseat;
}
public int getRemainseat() {
   return remainseat;
}
public void setRemainseat(int remainseat) {
   this.remainseat = remainseat;
}
public String getRegdate() {
   return regdate;
}
public void setRegdate(String regdate) {
   this.regdate = regdate;
}
public String getTitle() {
   return title;
}
public void setTitle(String title) {
   this.title = title;
}
public String getTheater() {
   return theater;
}
public void setTheater(String theater) {
   this.theater = theater;
}
public String getStarttime() {
   return starttime;
}
public void setStarttime(String starttime) {
   this.starttime = starttime;
}
public String getEndtime() {
   return endtime;
}
public void setEndtime(String endtime) {
   this.endtime = endtime;
}
public String getGrade() {
   return grade;
}
public void setGrade(String grade) {
   this.grade = grade;
}

}