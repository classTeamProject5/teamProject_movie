package com.sist.dao;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DaehanEventVO {
	private int num;
	private String event_category;
	private String event_poster;
	private String event_title;
	private String event_term;
	private String event_state;
	private String key;
	//Content컬럼은 관리자 페이지와 관련이 있었는데, 다루지 않아서 뺐습니다.

}
