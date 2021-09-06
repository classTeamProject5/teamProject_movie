<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    
    
    
</head>
<body>
    <div class="container">
          <div class="row-cus justify-content-center">
            <div class="col-md-8 col-lg-6 text-center mb-3">
              <h2 class="fw-bold">고객센터</h2>
              <p class="mb-5">고객의 소리를 듣습니다</p>
            </div>
          </div>
          
          <nav class="navbar navbar-defualt" style="width: 1200px; ">
			<div class="container-fluid">
			  <ul class="nav navbar-nav" style="width: 400px; ">
			      <li style="width: 32%; height:60px; text-align: center;  background-color:white;"><a href="#" style="color: #212121; border-bottom: 1px solid black;">FAQ</a></li>
			      <li style="width: 32%; height:60px; text-align: center;  margin-left: 3px; background-color: white;"><a href="#" style="color: #212121; border-bottom: 1px solid black;">공지사항</a></li>
			      <li style="width: 32%; height:60px; text-align: center;  margin-left: 3px; background-color: white;"><a href="#" style="color: #212121; border-bottom: 1px solid black;">1:1 문의</a></li>
			  </ul>
		    </div>
		  </nav>
    </div>
    
    <jsp:include page="customer_notice.jsp"/>
    
    

    

    
 
    
    
</body>
</html>