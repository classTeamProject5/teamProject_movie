package com.sist.vo;
/*
 * NO       NOT NULL NUMBER        
TYPE              VARCHAR2(30)  
TITLE             VARCHAR2(200) 
CONTENT           CLOB          
FILENAME          VARCHAR2(500) 
FILESIZE          NUMBER        
ALERT             VARCHAR2(20)  
NAME              VARCHAR2(50)  
TEL               VARCHAR2(30)  
EMAIL             VARCHAR2(50)  
REGDATE           DATE          
STATE             VARCHAR2(20) 
 */

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class CustomerQNAVO {
	private int no;
	private double filesize;
	private String type,title,content,filename,alert,name,tel,email,state;
	private String regdate;
	
	
	
}
