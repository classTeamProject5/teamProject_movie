<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화차트</title>
<link href="moviechartcss/style.css" rel="stylesheet" />
</head>
<body >
<!--movie-->
   
        <div class="container">
            <div class="row">
                <div class="movie">
                    
                    <div class="movie_title">
                        <ul>
                        
                            <li ><a href="../moviechart/moviechart.do?cno=1">박스오피스</a></li>
                           
                            <li><a href="../moviechart/moviechart.do?cno=2">상영예정작</a></li>
                          
                        </ul>
                    </div>
                     <div class="movie_chart">
                                <div class="poster">
                                    <figure>
                  <ul class="nospace clear">              
               <c:forEach var="vo" items="${list }" varStatus="s">
             <c:if test="${s.index%4==0 }">
               <li class="one_quarter first"><a href="../movie_detail/movie_detailpage.do?mno=${vo.mno }&cno=${cno}"><img style="width:250px;height:250px" src="${vo.poster }" title="${vo.title }"> ${vo.mno }. ${vo.title }</a></li>
              
             </c:if>
             <c:if test="${s.index%4!=0 }">
               <li class="one_quarter"><a href="../movie_detail/movie_detailpage.do?mno=${vo.mno }&cno=${cno}"><img style="width:250px;height:250px" src="${vo.poster }" title="${vo.title }">${vo.mno }. ${vo.title }</a></li>
               
            </c:if>
           </c:forEach>
           </ul>
           </figure>
                        </div>
                        </div>
                   </div>
                  </div>
         </div>
          
          <nav class="pagination">
        <ul>
          <c:if test="${startPage>1 }">
            <li><a href="../moviechart/moviechart.do?page=${startPage-1 }&cno=${cno}">&laquo; 이전</a></li>
          </c:if>
           <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <c:if test="${i==curpage }"><%--현재페이지라면 --%>
              <li class="current"><strong>${i }</strong></li>
            </c:if>
            <c:if test="${i!=curpage }"><%--현재페이지가 아닌경우 --%>
              <li><a href="../moviechart/moviechart.do?page=${i }&cno=${cno}">${i }</a></li>
            </c:if>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
            <li><a href="../moviechart/moviechart.do?page=${endPage+1 }&cno=${cno}">다음 &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
                      
 
</body>
</html>