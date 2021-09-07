<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화정보</title>
<link href="detailcss/main.css" rel="stylesheet">
<link href="replycss/style.css" rel="stylesheet">
<link href="replycss/normalize.css" rel="stylesheet">
<link href="replycss/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<!-- Two -->
			<section id="two" class="wrapper style2 alt">
				<div class="inner">
					<div class="spotlight">
						<div class="image">
							<img src="testposter.jpg" alt="poster" />
						</div>
						<div class="content">영호 상세 정보
							<h3>영화 제목</h3>
							<h5 >장르: {장르}</h5> 
							<h5 >등급: {등급}</h5> 
							<h5 >감독: {감독}</h5> 
							<h5>배우: {배우}</h5> 
							<h5 >총관객수: {총관객수}</h5> 
							<h5 >평점: {평점}</h5> 
							<h5>상영일: {상영일}</h5> 
							
							
							<ul class="actions">
								<li><a href="#" class="button alt">예매하기</a></li>
							</ul>
						</div>
					</div>
			</div>
		</section>	
		<section class="layout_padding">
     
     <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="heading" style="padding-left: 15px;padding-right: 15px;">
                     <h4 style="border-bottom: solid #333 1px;">Comments / 2</h4>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="full comment_blog_line">
                     <div class="row">
                        <div class="col-md-1">
                           <img src="testicon.png" alt="#" />
                        </div>
                        <div class="col-md-9">
                           <div class="full contact_text">
                              <h3>id</h3>
                              <h4>date/time</h4>
                              <p>comment
                              </p>
                           </div>
                        </div>
                       
                     </div>
                  </div>
                  <div class="full comment_blog_line">
                     <div class="row">
                        <div class="col-md-1">
                           <img src="testicon.png" alt="#" />
                        </div>
                        <div class="col-md-9">
                           <div class="full contact_text">
                              <h3>id</h3>
                              <h4>date/time</h4>
                              <p>comment
                              </p>
                           </div>
                        </div>
                        
                     </div>
                  </div>
               </div>
            </div>
            <div class="row margin_top_30">
               <div class="col-md-12 margin_top_30">
                  <div class="heading" style="padding-left: 15px;padding-right: 15px;">
                     <h4>Post : Your Comment</h4>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="full comment_form">
                     <form action="">
                        <fieldset>
                           <div class="col-md-12">
                              <div class="row">
                                 <div class="col-md-6">
                                    <input type="text" name="name" placeholder="Name" required="#" />
                                    <input type="email" name="email" placeholder="Email" required="#" />
                                 </div>
                                 <div class="col-md-6">
                                    <textarea placeholder="Comment"></textarea>
                                 </div>
                              </div>
                              <div class="row margin_top_30">
                                 <div class="col-md-12">
                                    <div class="center">
                                       <button>Send</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </fieldset>
                     </form>
                  </div>
               </div>
            </div>
         </div>
         </section>
</body>
</html>