
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
  $(function(){
		$.ajax({
			type:'post',
			url:'../reserve/regdate_list.do', /*ReserveModel => RequestMapping()*/
			success:function(result)
			{
				$('#reg_list').html(result);
			}
		})
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

</head>
<body>

  <div class="container text-center">
   <h3>빠른예매</h3>          
  </div>
<div class="container" style="border:1px solid gray; height:700px">
<hr>
<div  style="margin=50px; display: inline; margin:10px;width:80px;height:40px; border:none;"  id="reg_list" >	 
  
</div> 
<hr>

<div class="container">    
  <div class="row">
 
    <div class="col-sm-3">
      <p style="font-size: 12pt">영화</p>
       <div class="txtBox" style="overflow:auto; resize: none;width: 270px; " id="movie_list">
              
       </div>       
    </div>
   
    <div class="col-sm-3 "> 
      <p style="font-size: 12pt">극장<p>
       <div class="txtBox" style="overflow:auto; resize: none;width: 270px;" id=theater_list>
       	
	    
       </div>
    </div>
    
    <div class="col-sm-6 ">    
      <p style="font-size: 12pt">시간<p>
       <div class="txtBox" style="overflow-x:hidden; resize: none;width: 500px;">
        <span id=regdate1 style="font-size: 14pt">
        
        </span>
        <span id=title1 style="font-size: 14pt">
        
        </span>
        <span id=grade1 style="font-size: 14pt">
        
        </span>
         <span id=theater1 style="font-size: 14pt">
        
        </span>
        
  
       <div>
       
  <hr>    	
       	<div href=# data-toggle="modal" data-target="#myModal" style="text-decoration: none;color:black;">
      		<div class="container" id=time_list>  
           
  			</div>
       	</div> 
	    
       </div>
    </div>
  </div>
</div>
</div>

</div>


</body>
 
</html>