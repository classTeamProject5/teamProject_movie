<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link
  rel="stylesheet"
  href="https://unpkg.com/swiper@7/swiper-bundle.min.css"
/>

<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
.txtBox{border-style: solid; border-width: 2px; padding: 12px; word-break: break-all;
  width:200px; height: 500px;
}
.txtBox::-webkit-scrollbar{
	width:5px
}
.txtBox::-webkit-scrollbar-thumb{
  background-color: black;
}
.txtBox::-webkit-scrollbar-track{
  background-color: #d3d3d3
}

 .modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}


input{
	background-color:white;
	 border: none; 

}
.active{
	background-color:#4f3397;
	color:white;     
}


 .swiper {
        width: 1050px;
        height: 30px;
        margin: 10px;
      }
      

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
          display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
        
      }
   
      .swiper-button-next{
      color: #030303;
      }
      .swiper-button-prev{
      color: #030303;
      }

.btn3{
margin:10px;
width:110px;
height:100px;

border: none;
}

.btn3:hover{
background-color:#4f3397;
color: white;
}
  </style>
  
</head>
<body>
  <div class="container text-center">
   <h3>빠른예매</h3>          
  </div>
<div class="container" style="border:1px solid gray; height:700px">
<hr>
<div class="container" style="margin=50px">

 <div class="swiper">
   <div class="swiper-wrapper">
   <c:forEach begin="1" end="30" step="1">
   <div class="swiper-slide">      
      <input type="button" class="btn3" value="09-10(금)">
   </div>
    </c:forEach>   
   </div>
   <!-- <div class="swiper-pagination"></div> -->
   <div class="swiper-button-next"></div>
   <div class="swiper-button-prev"></div>
 </div>

<%--       <c:forEach begin="1" end="8" step="1">  
  <input type="button" class="btn-default" value="날짜">
  </c:forEach>  --%>


  
   <%-- <c:forEach begin="1" end="8" step="1">  
  <input type="button" class="btn-default" value="날짜">
  </c:forEach>  --%>
</div> 
<hr>

<div class="container">    
  <div class="row">
    <div class="col-sm-3">
      <p>영화</p>
       <div class="txtBox" style="overflow:auto; resize: none;width: 270px;">
       	<c:forEach begin="1" end="25" step="1">
       	<p><input type="button" class="btn1" value="영화목록들" style="width:100%"><p>
	    </c:forEach>	    
       </div>
       
    </div>
    <div class="col-sm-3 "> 
      <p>극장<p>
       <div class="txtBox" style="overflow:auto; resize: none;width: 270px;">
       	<c:forEach begin="1" end="10" step="1">
       	<p><input type="button" class="btn2" value="상영관" style="width:100%"><p>
       
	    </c:forEach>
	    
       </div>
    </div>
    
    <div class="col-sm-6 ">    
      <p>시간<p>
       <div class="txtBox" style="overflow:auto; resize: none;width: 500px;">
        <div class="container">     
  </div>
  
       <div>
       
  <hr>
  
       	<c:forEach begin="1" end="6" step="1">
       	 <p><a href=# data-toggle="modal" data-target="#myModal" style="text-decoration: none;color:black;">11:00 영화  영화제목  몇관 예약좌석/총좌석</a><p> 
	    </c:forEach>
	    
	    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="background-color: #4f3397">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color: white">예매</h4>
        </div>
        <div class="modal-body">
          <p>예매하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="네" onClick="location.href='../reserve/seat.do'">
          <input type="button" class="btn btn-default" data-dismiss="modal" value="아니오">
          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">네</button> -->
          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">아니요</button> -->
        </div>
      </div>
    </div>
  </div>
	    
       </div>
    </div>
  </div>
</div>
</div>
</div>
</body>
 <script>
 /* $('input').click(function(){
	  $('input').removeClass("active");
	  $(this).addClass("active");
	}); */
	//버튼 클릭 유지
	$('.btn1').on('click', function(){
		  $('.btn1').removeClass('active');
		  $(this).addClass('active');
		});
	$('.btn2').on('click', function(){
		  $('.btn2').removeClass('active');
		  $(this).addClass('active');
		});
	$('.btn3').on('click', function(){
		  $('.btndate').removeClass('active');
		  $(this).addClass('active');
		});
	
	//슬라이드
 
      /* let appendNumber = 600;
      let prependNumber = 1; */
      const swiper = new Swiper('.swiper', {
        slidesPerView: 7,
        /* centeredSlides: true, */
        spaceBetween: 5,
        /* pagination: {
          el: '.swiper-pagination',
          type: 'fraction',
        }, */
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
       /*  virtual: {
          slides: (function () {
            const slides = [];
            for (var i = 0; i < 600; i += 1) {
              slides.push('Slide ' + (i + 1));
            }
            return slides;
          })(),
        }, */
      });    
        
   
 </script>
</html>