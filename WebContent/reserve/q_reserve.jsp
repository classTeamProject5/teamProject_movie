
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
  <script type="text/javascript">
  $(document).ready(function(){
		$('#btn3').click(function(){   //submit 버튼을 클릭하였을 때
			let sendData = "btn1="+$('input[name=btn1]').val();   //폼의 이름 값을 변수 안에 담아줌
			$.ajax({
				type:'post',   //post 방식으로 전송
				url:'q_reserve.do',   //데이터를 주고받을 파일 주소
				data:sendData,   //위의 변수에 담긴 데이터를 전송해준다.
				dataType:'html',   //html 파일 형식으로 값을 담아온다.
				success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					$('btn1').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
				}
			});
		});
	});

  </script>
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


 

.btn3{
margin:10px;
width:80px;
height:40px;

border: none;
}

.btn3:hover{
background-color:#4f3397;
color: white;
}
  </style>
  <script> 
  function submit2(frm) { 
    frm.action='reserve/seat.do'; 
    frm.submit(); 
    return true; 
  } 
</script> 
</head>
<body>
<form name='frm' method="POST" action="q_reserve.do"> 
  <div class="container text-center">
   <h3>빠른예매</h3>          
  </div>
<div class="container" style="border:1px solid gray; height:700px">
<hr>
<div class="container" style="margin=50px">

	 
    <c:forEach var="rvo" items="${reg_list1 }" varStatus="s">
      <input type="submit" class="btn3" value="${rvo.regdate}" name=reg id=btn3>
<%-- 	  <input type="hidden" name=tit value="${title_list1[s.index].title }"> --%>	  
    </c:forEach>   

   <!-- <div class="swiper-pagination"></div> --> 
 

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
       
       	<c:forEach var="tvo" items="${title_list1 }">
       	<p><input type="text" readonly class="btn1" id="movie_list" onclick="document.getElementById('time_list').innerHTML='${tvo.title}'" value="${tvo.title }" style="width:100%"></p>
       	  
	    </c:forEach>	   	  
       </div>       
    </div>
   
    <div class="col-sm-3 "> 
      <p>극장<p>
       <div class="txtBox" style="overflow:auto; resize: none;width: 270px;">
       	<c:forEach var="thvo" items="${theater_list1 }" varStatus="s">
       	<p><input type="text" readonly class="btn2" name=the id="theater_list" onclick="document.getElementById('time_list').innerText+= ' '+'${thvo.theater}'" value="${thvo.theater}" style="width:100%"><p>
       
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
  	<div>
       	<c:forEach var="tvo1" items="${list1 }">
       	<p id="time_list"></p> <p id="time_list1"></p>
       	<a href=# data-toggle="modal" data-target="#myModal" style="text-decoration: none;color:black;"><input type="submit" name=time value="${tvo1.starttime }"></a>
	    </c:forEach>
	 </div>   
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
          <input type="submit" class="btn btn-default" data-dismiss="modal" value="네" onclick='return submit2(this.form);'>
          <input type="button" class="btn btn-default" data-dismiss="modal" value="아니오">
           <%-- <input type="hidden" name=reg1 value="${reg_list1[s.index].regdate }"> --%>
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
</form>

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
		  $('.btn3').removeClass('active');
		  $(this).addClass('active');
		}); 
	
	
	//리스트 값 가져오기
/*  function printName()  {
	var name = document.getElementById('movie_list').value;
	   document.getElementById("time_list").innerHTML = name;	   
	  

	 }

   function printName2()  {
   const name2 = document.getElementById('theater_list').value;
   document.getElementById("time_list").innerHTML =name +" "+ name2;
   }  */
   
   function setInnerHTML() {
	   const element = document.getElementById('time_list');
	   element.innerHTML 
	     = 'vo_list';
	 } 
 </script>
</html>