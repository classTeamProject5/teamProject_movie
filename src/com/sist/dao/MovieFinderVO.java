package com.sist.dao;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class MovieFinderVO {
	
	private String title;
	private String poster;
	
	public MovieFinderVO() {
		// TODO Auto-generated constructor stub
	}

	public MovieFinderVO(String title, String poster) {
		super();
		this.title = title;
		this.poster = poster;
	}
		
}
