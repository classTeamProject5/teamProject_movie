<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.thbtn:hover{
background-color:#4f3397;
color: white;
}
    
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.theaters').hover(function(){
		$(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','none');
	})
		
	$('.theaters').click(function(){
		let theater=$(this).attr("data-theater");	
		let regdate=$(this).attr("data-regdate");
		$('#theater1').text(theater);
		$('#theater_list').val(regdate); 
		$.ajax({
			type:'post',
			data:{"regdate":regdate,"theater":theater},
			url:'../reserve/time_list.do',
			success:function(result)
			{
				$('#time_list').html(result);
			}
		});
	
		
	
	    
	})
})
</script>
</head>
<body>
<table>
	<c:forEach var="tvo" items="${list }">
	
     <tr class="theaters"  data-theater="${tvo.theater }" data-regdate="${tvo.regdate }">   
      <td class="text-left">
          <input type="button" class="thbtn" style="margin:10px; width:220px;height:30px; border:none; " value="${tvo.theater}"> 
      </td>
     </tr>
    
    </c:forEach>
    </table>
</body>
<script type="text/javascript">
$('.thbtn').on('click', function(){
	  $('.thbtn').removeClass('active');
	  $(this).addClass('active');
	});
</script>
</html>