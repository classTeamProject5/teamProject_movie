<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.regs').hover(function(){
		$(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','none');
	})
	
	$('.regs').click(function(){
		
		let regdate=$(this).attr("data-regdate");
		$('#regdate1').text(regdate);	
		
		$.ajax({
			type:'post',
			url:'../reserve/movie_list.do',
			data:{"regdate":regdate},
			success:function(result)
			{
				$('#movie_list').html(result);
			}

		});
	
		
	
	})
})
</script>

<style type="text/css">
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
	<c:forEach var="rvo" items="${list}">
      <div class="regs" data-regdate="${rvo.regdate }" style="display: inline;">        
        <input type="submit" class="btn3" value="${rvo.regdate}" style="width:100px;">     
      </div>
    </c:forEach>
</body>
<script type="text/javascript">
$('.btn3').on('click', function(){
	  $('.btn3').removeClass('active');
	  $(this).addClass('active');
	});
</script>
		
</html>