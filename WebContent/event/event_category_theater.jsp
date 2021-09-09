<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	DaehanEventDAO dao_dh_theater = new DaehanEventDAO();
	ArrayList<DaehanEventVO> list_dh_theater = dao_dh_theater.daehanEventListData_theater();
%>
<c:set var="list_dh_theater" value="<%=list_dh_theater %>"/>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="content">
		<c:forEach var="vo" items="${list_dh_theater}" varStatus="status">
			<ul>
				<li class="eventContent">
					<a href="#">
						<div class="eventImg_box">
							<img class="eventImg" src="${vo.event_poster}" alt="img들어갈공간">
						</div>
						<div class="eventText_box">
							<span class="eventTitle">${vo.event_title}</span>
							<span class="eventDates">${vo.event_term}</span>
						</div>
					</a>
				</li>
			</ul>
		</c:forEach>
	</div>
</body>
</html>