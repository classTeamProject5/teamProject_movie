package com.sist.vo;
/*
이름               널?       유형           
---------------- -------- ------------ 
NO               NOT NULL NUMBER       
ID                        VARCHAR2(20) 
TITLE                     VARCHAR2(50) 
SELECTED_THEATER          VARCHAR2(30) 
MOVIE_DATE                VARCHAR2(50) 
RUNNING_TIME              VARCHAR2(50) 
MOVIE_AGE                 VARCHAR2(60) 
SELECTED_SEAT             VARCHAR2(50) 
PAY_MONEY                 VARCHAR2(60) 
REGDATE                   VARCHAR2(40) 

 */
public class ReserveVO {
	private int no;
private String id,title,selected_theater,movie_date,running_time,movie_age,selected_seat,pay_money,regdate;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getSelected_theater() {
	return selected_theater;
}
public void setSelected_theater(String selected_theater) {
	this.selected_theater = selected_theater;
}
public String getMovie_date() {
	return movie_date;
}
public void setMovie_date(String movie_date) {
	this.movie_date = movie_date;
}
public String getRunning_time() {
	return running_time;
}
public void setRunning_time(String running_time) {
	this.running_time = running_time;
}
public String getMovie_age() {
	return movie_age;
}
public void setMovie_age(String movie_age) {
	this.movie_age = movie_age;
}
public String getSelected_seat() {
	return selected_seat;
}
public void setSelected_seat(String selected_seat) {
	this.selected_seat = selected_seat;
}
public String getPay_money() {
	return pay_money;
}
public void setPay_money(String pay_money) {
	this.pay_money = pay_money;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}



}
