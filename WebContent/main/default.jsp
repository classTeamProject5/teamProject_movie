<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<div>
	<div class="container">
	<!-- body {
		background: #1a2a6c;  /* fallback for old browsers */
		background: -webkit-linear-gradient(to left, #fdbb2d, #b21f1f, #1a2a6c);  /* Chrome 10-25, Safari 5.1-6 */
		background: linear-gradient(to left, #fdbb2d, #b21f1f, #1a2a6c); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	}
	
	* {
		box-sizing: border-box;
	}
	
	.card {
		background-color: transparent;
	} -->
		<!-- <div class="row" style="margin-top: 30px;">
			  <div class="col-md-3">
			    <div class="thumbnail">
			      <img src="assets/img/poster01@2.jpg" alt="...">
			      <div class="caption text-right">
			        <h3>영화제목</h3>
			        <p><a href="#" class="btn btn-primary " role="button">예매하기</a></p>
			      </div>
			    </div>
			  </div>
			  <div class="col-md-3">
			    <div class="thumbnail">
			      <img src="assets/img/poster02@2.jpg" alt="...">
			      <div class="caption text-right">
			        <h3>영화제목</h3>
			        <p><a href="#" class="btn btn-primary" role="button">예매하기</a></p>
			      </div>
			    </div>
			  </div>
			  <div class="col-md-3">
			    <div class="thumbnail">
			      <img src="assets/img/poster03@2.jpg" alt="...">
			      <div class="caption text-right">
			        <h3>영화제목</h3>
			        <p><a href="#" class="btn btn-primary" role="button">예매하기</a></p>
			      </div>
			    </div>
			  </div>
			  <div class="col-md-3">
			    <div class="thumbnail">
			      <img src="assets/img/poster04@2.jpg" alt="...">
			      <div class="caption text-right">
			        <h3>영화제목</h3>
			        <p><a href="#" class="btn btn-primary" role="button">예매하기</a></p>
			      </div>
			    </div>
			  </div>
			</div> -->
			
		<c:if test="${!empty list}">
		<div class="container" style="border-radius: 30px; margin-top: 50px;">
		<div class="row" style="margin-top: 30px;">
			<c:forEach var="m" items="${list}">
			<c:set var="title" value="${m.title}" />
				  <div class="col-md-3">
				    <div class="thumbnail" style="width: 260px; height: 510px; border-radius: 30px; padding: 0px;">
				      <img src="${m.poster}" alt="..." style="width: 100%;">
				      <div class="caption text-right">
				        <c:if test="${fn:length(title) > 10 }">
				        	<h3>${fn:substring(m.title, 0, 10)}...</h3>
				        </c:if>
				        <c:if test="${fn:length(title) <= 10 }">
				        	<h3>${m.title}</h3>
				        </c:if>
				        <p><a href="../movie_detail/movie_detailpage.do?mno=${m.mno}" class="btn btn-primary" role="button">상세보기</a></p>
				        <p>${m.regdate}</p>
				      </div>
				    </div>
				  </div>
				  </c:forEach>
			</div>
			</div>
			</c:if>
			
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top: 30px;">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img src="assets/img/event01@2.jpg" alt="...">
			      <div class="carousel-caption">
			        <h3>이벤트1</h3>
			      </div>
			    </div>
			    <div class="item">
			      <img src="assets/img/event01@2.jpg" alt="...">
			      <div class="carousel-caption">
			        <h3>이벤트2</h3>
			      </div>
			    </div>
			    <div class="item">
			      <img src="assets/img/event01@2.jpg" alt="...">
			      <div class="carousel-caption">
			        <h3>이벤트3</h3>
			      </div>
			    </div>
			  </div>
			
			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			
			<!-- 고객센터 -->
			<div class="row" style="margin-top: 30px;">
			  <div class="col-md-2 col-md-offset-3">
			  <a href="../customerCenter/main.do">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-main-customer.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center">고객센터</h4>
			      </div>
			    </div>
			    </a>
			  </div>
			  <div class="col-md-2">
			  <a href="../customerCenter/notice.do">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-faq.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center">자주 묻는 질문</h4>
			      </div>
			    </div>
			    </a>
			  </div>
			  <div class="col-md-2">
			  <a href="../customerCenter/qna.do">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-oneandone.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center">1:1 문의</h4>
			      </div>
			    </div>
			    </a>
			  </div>
			  </div>
			</div>
			
</div>
		

<div>
		
</div>
</div>

