package com.sist.dao;

import lombok.Getter;
import lombok.Setter;

/*
 * create table event_main2(
    mno NUMBER,
    event_category VARCHAR2(30), 
	event_poster VARCHAR2(300),
	event_title VARCHAR2(200),
	event_term VARCHAR2(200),
	event_state VARCHAR2(30)
);
 */
@Getter
@Setter
public class EventVO {
	
	private int mno;
	private String category;
	private String poster;
	private String title;
	private String term;
	private String state;
	private String content;
	

}
