<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//크롤링파트 	
	//dao_dh.daehanEvent_theater_DataCrawling(); //대한극장-이벤트-극장부분 크롤링
	//dao_dh.daehanEvent_movie_DataCrawling();//대한극장-이벤트-영화부분 크롤링

%>
<%
 /*div.subMenu관련 부분. 메뉴를 클릭하면 전체이벤트/영화이벤트/극장이벤트로 나뉜다.*/
	String mode=request.getParameter("mode");
	if(mode==null)
		mode = "1";
	int index = Integer.parseInt(mode);
	String eventlist = "";
	switch(index){
	case 1:
		eventlist="event_category_all.jsp";
		break;
	case 2:
		eventlist="event_category_movie.jsp";
		break;
	case 3:
		eventlist="event_category_theater.jsp";
		break;
	}
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍대극장 | 이벤트</title>
<link rel="stylesheet" href="../event/css/event.css">
<link rel="stylesheet" href="../event/css/total.css">



</head>

<body class="event_body">
	

	<!--  
	<div class="where">
		<div> 홈 > 이벤트 > 진행중인 이벤트 </div> <!-- 이부분은 홈,이벤트,진행중인이벤트, 링크식으로 걸어야함. 나중에 수정. 
	</div>
	-->
	<div class="event_header">
		<div class="event_contentTitle">진행중인 이벤트/%형식수정,페이징해야함
		</div>
		<div class="event_otherLinkBox"><a class="event_otherLink">지난 이벤트</a>
		</div>
		<div class="event_otherLinkBox"><a class="event_otherLink">당첨자 발표</a>
		</div>
	</div>	
	
	
	
	<div class="event_subMenu">
		<!-- 대한극장은, 클릭한 메뉴 밑에 컬러밑줄이 생긴다. 만들어야함. -->
		<ul>
			<li class="subMenuTitle"><a id="subMenu_total" href="event_main.jsp?mode=1">전체</a></li>
			<li class="subMenuTitle"><a id="subMenu_movie" href="event_main.jsp?mode=2">영화</a></li>
			<li class="subMenuTitle"><a id="subMenu_theater" href="event_main.jsp?mode=3">극장</a></li>
		</ul>
	
	</div>
	<div class="searchPart">
		<span class="search">
				<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
				<button type="button" class="btn-search-input"></button>
		</span>
	</div>
	
	<!-- 앞으로 작업해야 할 부분.
	
	1.	데이터 크롤을 임시로 4페이지씩 해둔 상태이다.
		대한극장-이벤트-극장탭 4페이지, 대한극장-이벤트-영화탭 4페이지
		=>이것을 유동적으로 최대페이지로 늘릴것.
	2.	데이터가 많아지면 끊임없이 스크롤을 내릴 수는 없는 일이다.
		=> 페이지 나눠서 출력할 것.
	3.	극장탭에서 크롤링, 이벤트탭에서 크롤링 하다보니 전체탭에 갔을때에는
		극장이벤트n개가 나온 후 영화이벤트n개가 나오는 형태이다.
		=> 전체 페이지에 대해선, 이벤트기간 dates 값을 기준으로 정렬하여 출력하도록 하자.
	4.  검색기능 구현. 이것도 테이블 만들고 임의 데이터 넣은 후 만들것.
	1-->
	
	
	<div class="eventlist">
		<jsp:include page="<%=eventlist%>"></jsp:include>
		
		<!-- 데이터가 많아서 로딩이 오래걸리는것 같다. 페이지를 나누어야한다. -->
		
	</div>
	

	



</body>
</html>