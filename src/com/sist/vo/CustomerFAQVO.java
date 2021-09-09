package com.sist.vo;
/*
 * TYPE     NOT NULL VARCHAR2(30)  
	QUESTION NOT NULL VARCHAR2(200) 
	ANSWER   NOT NULL CLOB     
 */
public class CustomerFAQVO {
	private String type,question,answer;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
