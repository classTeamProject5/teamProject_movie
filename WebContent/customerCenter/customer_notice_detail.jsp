<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	        
	        <td class="text-center" width=50%>${vo.title}</td>
	        <td class="text-center" width=20%>${vo.regdate }
	          
	        </td>
	        <td class="text-center" width=20%>${vo.hit }</td>
	      </tr>
	    </table>
	    
	    <table class="table">
	      <tr> 
	        <td colspan="4"  style="border: 1px solid #ccc; width:1000px; height : 400px; margin-top: 30px;">
	        <pre style="padding:10px; overflow: auto; white-space: pre-wrap; background-color: white;">${vo.content }</pre></td> 
	      </tr>
	    </table>
	    <table class="table">
	      <tr style="text-align: right;">
	        <td>
	         <c:if test="${sessionScope.id==null }">
	          
	         </c:if>
	         <c:if test="${sessionScope.id!=null and sessionScope.admin=='y'}">
	           <a href="notice_delete.do?no=${vo.no }" class="btn btn-xs btn-danger">삭제
	             
	           </a>
	           <a href="notice_update.do?no=${vo.no }" class="btn btn-xs btn-primary">수정</a>
	         </c:if>
	         <a href="notice.do" class="btn btn-xs btn-info">목록</a>
	        </td>
	      </tr>
	    </table>
	    <table class="table">
	     <c:choose >
	      <c:when test="${empty voup.title}">
	        
	      </c:when>
	      <c:otherwise>
	        <tr>
	          <td class="text-center" width=10%>다음글</td>
	          <td class="text-center" width=10%>▲</td>
	          <td class="text-center" width=50%><a href="notice_detail.do?no=${voup.no }">${voup.title }</a></td>
	          <td class="text-center text-right" width=20%>${voup.regdate }</td>
	        </tr>
	      </c:otherwise>
	     </c:choose>
	     <c:choose >
	      <c:when test="${empty vodown.title}">
	        
	      </c:when>
	      <c:otherwise>
	        <tr>
	          <td class="text-center" width=10%>이전글</td>
	          <td class="text-center" width=10%>▼</td>
	          <td class="text-center" width=50%><a href="notice_detail.do?no=${vodown.no }">${vodown.title }</a></td>
	          <td class="text-center text-right" width=20%>${vodown.regdate }</td>
	        </tr>
	      </c:otherwise>
	     </c:choose>
	    </table>
	  </div>
	</div>
</body>
</html>