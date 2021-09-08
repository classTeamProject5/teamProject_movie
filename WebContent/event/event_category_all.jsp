<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//크롤링파트 	
	DaehanEventDAO dao_dh = new DaehanEventDAO();
	ArrayList<DaehanEventVO> list_dh = dao_dh.daehanEventListData();

%>  
<c:set var="list_dh" value="<%=list_dh %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="content">
		<c:forEach var="vo" items="${list_dh}" varStatus="status">
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