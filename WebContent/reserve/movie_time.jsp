<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
    /* Remove the navbar's default margin-bottom and rounded borders */     

.timetable {
  background-color: #f2f2f2;
 
  border-radius: 15px;
  margin: 10px;
  width: 540px;
  
}
ul{
	list-style: none;
}


.btn-default{
width:110px;
height:50px;
}
.btn-default:hover{
background-color:#4f3397;
color: white;

}
.btndate{
margin:10px;
width:100px;
height:60px;
background-color: white;
border: none;
}
.btndate:hover{
background-color:#4f3397;
color: white;
}

    </style>
</head>
<body>

  <div class="container text-center">
    <h3>상영시간표</h3>          
  </div>

<hr>
<div class="container" style="margin=50px">  
  

  <c:forEach begin="1" end="8" step="1">  
  <input type="button" class="btndate" value="날짜">
  </c:forEach>
</div> 
<hr>

<div class="container"> 

  
  <div class="row">  
    <c:forEach begin="1" end="10" step="1">
    <div class="col-xs-6 timetable" style="">      
      <div style="font-size: 15pt"><span>등급</span> 영화제목</div>     
      <br>     
      <div>                      
      <ul>           
       <li>  
          <c:forEach begin="1" end="4" step="1">
       	   <a href="../reserve/seat.do" class="btn btn-default" role="button">     	         	 
      	     <div> <!-- 시간정보 -->
      	       <div style="font-size: 11pt;font-weight: bold;">시작시간</div>
      	      <!--  <div>시작~끝시간</div> -->
      	     </div>
      	     <div style="font-size: 9pt">좌석수
      	       <span>85</span>
      	       <span>/</span>
      	       <span>150</span>
      	     </div>      	   
      	   </a> 	     
      	   </c:forEach> 	     
       </li>
      </ul>
      </div>
    </div>         
    </c:forEach>
  </div>
 </div>
</body>
</html>