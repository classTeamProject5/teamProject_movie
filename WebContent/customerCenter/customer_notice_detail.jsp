<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="customer-container">
	  <div class="cus-row">
	  	
	    <table class="table">
	      <tr>
	        <th class="text-center danger" width=50%>제목</th>
	        <th class="text-center danger" width=20%>작성일</th>
	        <th class="text-center danger" width=20%>조회수</th>
	      </tr>
	      <tr>
	        <td class="text-center" width=50%>제목 내용</td>
	        <td class="text-center" width=20%>2021/01/01</td>
	        <td class="text-center" width=20%>2</td>
	      </tr>
	    </table>
	    <hr>
	    <table class="table">
	      <tr> 
	        <td colspan="4" style="border: 1px solid #ccc; width:1200px; height : 400px; margin-top: 30px;">내용</td> 
	      </tr>
	      <tr>
	        <td colspan="4" class="text-right">
	         <a href="list.do" class="btn btn-xs btn-info">목록</a>
	        </td>
	      </tr>
	    </table>
	    <table class="table">
	      <tr>
	        <td class="text-center" width=10%>이전글</td>
	        <td class="text-center" width=10%>▲</td>
	        <td class="text-center" width=50%><a href="#">제목</a></td>
	        <td class="text-center text-right" width=20%>날짜</td>
	      </tr>
	      <tr>
	        <td class="text-center" width=10%>다음글</td>
	        <td class="text-center" width=10%>▼</td>
	        <td class="text-center" width=50%><a href="#">제목</a></td>
	        <td class="text-center text-right" width=20%>날짜</td>
	      </tr>
	    </table>
	  </div>
	</div>
</body>
</html>