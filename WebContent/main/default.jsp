<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div style="background: #1a2a6c; background: -webkit-linear-gradient(to left, #fdbb2d, #b21f1f, #1a2a6c); background: linear-gradient(to left, #fdbb2d, #b21f1f, #1a2a6c);">
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
		<div class="row" style="margin-top: 30px;">
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
			</div>
			
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
			  <div class="col-md-2">
			  <a href="#">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-main-customer.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center" style="color: white;">고객센터</h4>
			      </div>
			    </div>
			    </a>
			  </div>
			  <div class="col-md-2">
			  <a href="#">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-faq.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center" style="color: white;">자주 묻는 질문</h4>
			      </div>
			    </div>
			    </a>
			  </div>
			  <div class="col-md-2">
			  <a href="#">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-oneandone.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center" style="color: white;">1:1 문의</h4>
			      </div>
			    </div>
			    </a>
			  </div>
			  <div class="col-md-2">
			  <a href="#">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-groupping.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center" style="color: white;">단체/대관문의</h4>
			      </div>
			    </div>
			    </a>
			  </div>
			  <div class="col-md-2">
			  <a href="#">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-miss-question.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center" style="color: white;">분실물 문의/접수</h4>
			      </div>
			    </div>
			    </a>
			  </div>
			  <div class="col-md-2">
			  <a href="#">
			    <div class="thumbnail" style="background-color: transparent; border: none;">
			      <img src="default/ico-butique.png" alt="..." style="padding: 50px; width: 150px; height: 150px;">
			      <div class="caption">
			        <h5 class="text-center" style="color: white;">더 부티크</h4>
			        <h5 class="text-center" style="color: white;">프라이빗 대관예매</h4>
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

