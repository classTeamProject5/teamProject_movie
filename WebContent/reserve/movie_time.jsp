
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
<form method="POST" action="movie_time.do" id=frm>
  <div class="container text-center">
    <h3>상영시간표</h3>          
  </div>

<hr>
<div class="container" style="margin=50px">  
  

  <c:forEach var="rvo" items="${reg_list}">  
     <input type="submit" class="btndate" name=reg value="${rvo.regdate }">
  </c:forEach>
</div> 
<hr>

<div class="container"> 

  
  <div class="row" >  
     <c:forEach var="tvo" items="${title_list}" varStatus="s">
        <c:if test="${tvo.rn eq '1' }">
        <div class="col-xs-6 timetable" style="">
        </c:if>
            <c:if test="${tvo.rn eq '1' }">
              <div style="font-size: 15pt" >
               <span style="font-size: 12pt">${tvo.grade}</span>
                  <input type="text" style="background-color: #f2f2f2; border-style: none;" name=tit value="${tvo.title}" readonly>
                  ${tvo.theater}       
             </div>
         	</c:if>           
            <c:if test="${tvo.rn eq '1' }">
          <br>
          
                              
             <ul>           
                   <li>  
                   </c:if> 
                       <a href="../reserve/seat.do?no=${tvo.no}" class="btn btn-default" role="button">    
                         <div> 
                               
                              <div style="font-size: 11pt;font-weight: bold;">${tvo.starttime }
                                <%--  <input type="hidden" name=starttime value="${tvo.starttime }" > --%>
                              </div> 
                         </div>
                         
                         <div style="font-size: 9pt">좌석수
                            <span>${tvo.remainseat }
                          <%--    <input type="hidden" name=remainseat value="${tvo.remainseat }" >--%>
                            </span> 
                            <span>/</span>
                            <span>${tvo.totalseat }
                            <%-- <input type="hidden" name=totalseat value="${tvo.totalseat }" > --%>
                            </span>
                         </div>            
                     </a>    
                   </li>
               </ul>
          <c:if test="${tvo.rn eq '4' }">  
              
       </div>
         </c:if>  
     </c:forEach>
</div>              

  </div>
 </div>
 </form>

</body>

</html>