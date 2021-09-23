<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// 더보기 
let u=0;
$(function(){
	$('.ubtn').click(function(){
		let no=$(this).attr("data-no");
		$('.updateForm').hide();
		if(u==0)
		{
			$(this).text("취소");
			$('#u'+no).show();
			u=1;
		}
		else
		{
			$(this).text("수정");
			$('#u'+no).hide();
			u=0;
		}
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    
    <table class="table">
      <tr>
        <td width=30% rowspan="9" class="text-center">
         <img src="${vo.poster }" style="width:290px;height:350px">
        </td>
        <td width=70% colspan="2"><h3>${vo.title }&nbsp;<span style="color:orange">${vo.score }</span></h3></td>
      </tr>
      <tr>
        <th class="text-center" width=10%>감독</th>
        <td width=60%>${vo.director }</td>
      </tr>
      <tr>
        <th class="text-center" width=10%>출연</th>
        <td width=60%>${vo.actor }</td>
      </tr>
      <tr>
        <th class="text-center" width=10%>장르</th>
        <td width=60%>${vo.genre }</td>
      </tr>
      <tr>
        <th class="text-center" width=10%>시간</th>
        <td width=60%>${vo.time }분</td>
      </tr>
      <tr>
        <th class="text-center" width=10%>등급</th>
        <td width=60%>${vo.grade }</td>
      </tr>
      <tr>
        <th class="text-center" width=10%>상영일</th>
        <td width=60%>${vo.regdate }</td>
      </tr>
      <tr>
        <th class="text-center" width=10%>예매율</th>
        <td width=60%>${vo.reserve }</td>
      </tr>
      <tr>
        <th class="text-center" width=10%>누적관객</th>
        <td width=60%>${vo.showUser }</td>
      </tr>
      <tr>
        <td colspan="3">
          ${vo.story }
        </td>
      </tr>
      <tr>
        <td colspan="3" class="text-right">
         <a href="../reserve/q_reserve.do" class="btn btn-sm btn-danger">예매</a>
         <a href="../moviechart/moviechart.do?cno=1" class="btn btn-sm btn-danger">목록</a>
        </td>
      </tr>
    </table>
    <table class="table">
     <tr>
       <td>
        <embed src="http://youtube.com/embed/${vo.key }" style="width:970px;height:500px">
       </td>
     </tr>
    </table>
    <div id="comments">
        <h2>관람평</h2>
        <ul>
         <c:forEach var="rvo" items="${list }">
	          <li>
	            <article>
	              <header>
	                <figure class="avatar">
	                  <c:if test="${sessionScope.id==rvo.id }">
	                    <a href="#" class="btn btn-xs btn-danger ubtn" style="color:black" data-no="${rvo.bno }">수정</a>
	                    <a href="../freeboard/reply_delete.do?no=${rvo.bno }&bno=${vo.mno}" class="btn btn-xs btn-success" style="color:black">삭제</a>
	                  </c:if>
	                </figure>
	                <address>
	                By <a href="#">${rvo.name }</a>
	                </address>
	                <span>(${rvo.dbday })</span>
	              </header>
	              <div class="comcont">
	                <p>${rvo.msg }</p>
	              </div>
	            </article>
	            <form method="post" action="../movie_detail/reply_update.do" 
	              class="updateForm" id="u${rvo.bno }" style="display:none">
			       <table class="table">
			          <tr>
			            <td class="inline">
			             <input type=hidden value="${vo.mno }" name="bno">
                         <input type=hidden value="${rvo.bno }" name="no">
			             <textarea rows="5" cols="80" name="msg" style="float:left">${rvo.msg }</textarea>
			             <input type="submit" class="btn btn-sm btn-primary"
			              style="height:100px" value="댓글수정" style="float:left">
			            </td>
			          </tr>
			         </table>
			      </form>
	          </li>
          </c:forEach>
         </ul>
      </div>
      <%-- 로그인이 된 상태 (id(fk),name(not null)) --%>
      <%--
                        요청 
             <a href="../movie/list.do">
             <form action="../freeboard/reply_insert.do">
             Ajax => button 클릭 
             === $.ajax({
                      url:"../freeboard/reply_insert.do"
                 })
       --%>
      <c:if test="${sessionScope.id!=null }">
         <form method="post" action="../movie_detail/reply_insert.do">
	       <table class="table">
	          <tr>
	            <td class="inline">
	             <p><textarea rows="5" cols="115" name="msg"></textarea></p>
	             <input type=hidden value="${vo.mno }" name="bno">
	             <input type=hidden value="1" name="type">
	             <input type="submit" class="btn btn-sm btn-primary"
	              style="height:80px" value="댓글쓰기">
	            </td>
	          </tr>
	         </table>
	      </form>
        </c:if>
    
    
  </main>
</div>
</body>
</html>
