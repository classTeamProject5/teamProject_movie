<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="customer-container">
    <div class="customer-row">
      <div class="search-container" style="text-align: right; width: 1000px;">
	    <form action="#">
	      <input type=text name="search" placeholder="검색어를 입력해 주세요"></input>
	      <button type="submit" class="glyphicon glyphicon-search"></button>
	    </form>
	  </div>
	<nav class="navbar navbar-defualt" style="text-align: center;">
	    <div class="container-fluid">
	        
			  <ul class="nav navbar-nav" style="width: 1000px; margin-left: 350px; ">
				  <li style="width: 16%; ">
				    <input data-tab='notice1' type=button style="color: #212121; text-align: center; background-color: #dce4f0; border-radius: 5px; width:100%; height: 50px;" id="cus-all" value="전체">
				  </li>
				  <li style="width: 16%; ">
				    <input type=button style="color: #212121; text-align: center; background-color: #dce4f0; border-radius: 5px; width:100%; height: 50px;" id="cus-system" value="시스템 점검">
				  </li>
				  <li style="width: 16%; ">
				    <input type=button style="color: #212121; text-align: center; background-color: #dce4f0; border-radius: 5px; width:100%; height: 50px;" id="cus-theater" value="극장">
				  </li>
				  <li style="width: 16%; ">
				    <input type=button style="color: #212121; text-align: center; background-color: #dce4f0; border-radius: 5px; width:100%; height: 50px;" id="cus-etc" value="기타">
				  </li>
	          </ul>
	     
		</div>
    </nav>
    <table class="table" style="width:1000px; margin: auto;">
      <tr style="background-color: #d3d3d3">
        <th width=5% class="text-center">번호</th>
        <th width=5% class="text-center">구분</th>
        <th width=60% class="text-center">제목</th>
        <th width=15% class="text-center">등록일</th>
        <th width=5% class="text-center">조회수</th>
      </tr>
      <c:forEach var="vo" items="${list }">
      <tr>
        <td width=5% class="text-center">${vo.no }</td>
        <td width=5% class="text-center" id="type2">${vo.type }</td>
        <td width=60%><a href="notice_detail.do?no=${vo.no }">${vo.title }</a></td>
        <td width=15% class="text-center">${vo.regdate }</td>
        <td width=5% class="text-center">${vo.hit }</td>
      </tr>
  	  </c:forEach>
    </table>
   
    <nav style="text-align: center;">
      <ul class="pagination">
          <c:if test="${curpage>BLOCK }">
           <li><a href="notice.do?page=${startPage-1 }">&laquo; Previous</a></li>
          </c:if> 
           <c:forEach var="i" begin="${startPage }" end="${endPage }">
              <c:if test="${curpage==i }">
                <c:set var="ss" value="class=current"/>
              </c:if>
              <c:if test="${curpage!=i }">
                <c:set var="ss" value=""/>
              </c:if>
              <li ${ss }><a href="notice.do?page=${i }">${i }</a></li>
           </c:forEach>
           <c:if test="${endPage<totalpage }">
            <li><a href="notice.do?page=${endPage+1 }">Next &raquo;</a></li>
           </c:if>
        </ul>
    </nav>
    
    </div>
  </div>
  
</body>
</html>