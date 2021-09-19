<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mbtn:hover{
background-color:#4f3397;
color: white;
}
    
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.movies').hover(function(){
		$(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','none');
	})
		
	$('.movies').click(function(){
		
		let regdate=$(this).attr("data-regdate");
		let no=$(this).attr("data-no");
		let theater=$(this).attr("data-theater");
		let title=$(this).attr("data-title");
		let grade=$(this).attr("data-grade");
		
	 	$('#theater_list').val(regdate); 
	 	$('#theater_list').val(no); 
	 	$('#theater_list').val(theater); 
		$('#title1').text(title);
		$('#grade1').text(grade);
		
		$.ajax({
			type:'post',
			url:'../reserve/theater_list.do',
			data:{"regdate":regdate, "title":title,"theater":theater, "no":no},
			success:function(result)
			{
				$('#theater_list').html(result);
			}
		});
		
 
	})
})
</script>
</head>
<body>
<table>
	<c:forEach var="mvo" items="${list1 }">
	<c:if test="${mvo.rn eq '1' }">
     <tr class="movies"  data-title="${mvo.title}" data-grade="${mvo.grade }" data-regdate="${mvo.regdate }" data-no="${mvo.no }" data-theater="${mvo.theater }">   
      <td class="text-left">
          <input type="submit" class="mbtn" style="margin:10px; width:220px;height:30px; border:none;" value="${mvo.title }  ${mvo.grade }">
      </td>
     </tr>
     </c:if>
    </c:forEach>                                       	         
    </table>
</body>
<script type="text/javascript">
$('.mbtn').on('click', function(){
	  $('.mbtn').removeClass('active');
	  $(this).addClass('active');
	});
</script>
</html>