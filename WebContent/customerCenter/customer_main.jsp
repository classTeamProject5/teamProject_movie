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
    <title>Applab | Landing, Corporate &amp; Business Templatee</title>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="assets/css/theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
          <div class="row-cus justify-content-center">
            <div class="col-md-8 col-lg-6 text-center mb-3">
              <h2 class="fw-bold">고객센터</h2>
              <p class="mb-5">고객의 소리를 듣습니다</p>
            </div>
          </div>
          <nav class="navbar" style="width: 1200px; ">
			<div class="container-fluid">
			  <ul class="nav navbar-nav" style="width: 100%;">
			      <li style="width: 32%; text-align: center; border: 1px solid black; border-radius: 8px; background-color: #d3d3d3;"><a href="#" style="color: #212121">FAQ</a></li>
			      <li style="width: 32%; text-align: center; border: 1px solid black; border-radius: 8px; margin-left: 3px; background-color: #d3d3d3;"><a href="#" style="color: #212121">공지사항</a></li>
			      <li style="width: 32%; text-align: center; border: 1px solid black; border-radius: 8px; margin-left: 3px; background-color: #d3d3d3;"><a href="#" style="color: #212121">1:1 문의</a></li>
			  </ul>
		    </div>
		  </nav>
    </div>
    <jsp:include page="customer_notice_detail.jsp"/>
    
    
    
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    
    
</body>
</html>