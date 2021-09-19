<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.tbtn:hover{
background-color:#4f3397;
color: white;
}
    
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script type="text/javascript">
$(function(){
	$('.time').hover(function(){
		$(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','none');
	})
		
	$('.time').click(function(){
		
		
		/* $.ajax({
			type:'post',
			url:'../reserve/time_list.do',
			success:function(result)
			{
				$('#time_list').html(result);
			}
		}); */
	
		let starttime=$(this).attr("data-starttime");	
		$('#time_list').text(title);
	
	    
	})
})
</script>
<body>

<c:forEach var="svo" items="${list}">

      <div class="starttime" data-starttime="${svo.starttime }" > 
      <a href="../reserve/seat.do?no=${svo.no} "  style="color:black;">          
        <input type="submit" class="tbtn" value="${svo.starttime}" style="margin:10px; width:400px;height:40px; border:none;">      
     </a> 
      </div>
             
    </c:forEach>
    

    
    
    

</body>
</html>