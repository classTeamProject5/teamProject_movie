<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="wrapper row3 reserve_row">
  <main class="container clear">
    <h2 class="sectiontitle">영화 예약목록</h2>
    <table class="table">
      <tr>
       <th class="text-center">번호</th>
       <th class="text-center">아이디</th>
       <th class="text-center">영화제목</th>
       <th class="text-center">상영관</th>
       <th class="text-center">상영날짜</th>
       <th class="text-center">상영시간</th>
       <th class="text-center">나이등급</th>
       <th class="text-center">예약인원</th>
       <th class="text-center">가격</th>
       <th class="text-center">예약일</th>
      </tr>
      <c:forEach var="vo" items="${list }">
       <tr>
	       <td class="text-center">${vo.no }</td>
	       <td class="text-center">${vo.id }</td>
	       <td class="text-center">${vo.title }</td>
	       <td class="text-center">${vo.selected_theater }</td>
	       <td class="text-center">${vo.movie_date }</td>
	       <td class="text-center">${vo.running_time }</td>
	       <td class="text-center">${vo.movie_age }</td>
	       <td class="text-center">${vo.selected_seat }</td>
	       <td class="text-center">${vo.pay_money }</td>
	       <td class="text-center">${vo.regdate }</td>
      </tr>
      </c:forEach>
    </table>    
    <%-- 본인이 작성한  게시물,댓글 --%>
  </main>
</div>
</body>
</html>