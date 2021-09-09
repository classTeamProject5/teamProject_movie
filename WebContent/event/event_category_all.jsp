<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../event/css/event.css">
<link rel="stylesheet" href="../event/css/total.css">
</head>
<body>
	
	<div class="event_header">
		<div class="event_contentTitle">진행중인 이벤트/페이징,카테고리별 서블릿연결해야함
		</div>
		<div class="event_otherLinkBox"><a class="event_otherLink">지난 이벤트</a>
		</div>
		<div class="event_otherLinkBox"><a class="event_otherLink">당첨자 발표</a>
		</div>
	</div>		
	
	
	<div class="event_subMenu">
		<!-- 대한극장은, 클릭한 메뉴 밑에 컬러밑줄이 생긴다. 만들어야함. -->
		<ul>
			<li class="subMenuTitle"><a id="subMenu_total" href="#">전체</a></li>
			<li class="subMenuTitle"><a id="subMenu_movie" href="#">영화</a></li>
			<li class="subMenuTitle"><a id="subMenu_theater" href="event_main.do?mode=3">극장</a></li>
		</ul>
	
	</div>
	<div class="searchPart">
		<span class="search">
				<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
				<button type="button" class="btn-search-input"></button>
		</span>
	</div>	
	<div class="content">
		<c:forEach var="vo" items="${list}">
			<ul>
				<li class="eventContent">
					<a href="#">
						<div class="eventImg_box">
							<img class="eventImg" src="${vo.poster}" alt="img들어갈공간">
						</div>
						<div class="eventText_box">
							<span class="eventTitle">${vo.title}</span>
							<span class="eventDates">${vo.term}</span>
						</div>
					</a>
				</li>
			</ul>
		</c:forEach>
	</div>

</body>
</html>