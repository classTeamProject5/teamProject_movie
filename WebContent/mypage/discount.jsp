<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>마이 페이지</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
.userInfo {
    width: 900px;
    height:300px;
    border: 1px solid;
    
}    
.inner {
  position: relative;
  left: 50%;
  transform: translateX(-50%);
  
}

    </style>
</head>

<body>
    
    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                         
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->
         <div class="container">
            <div class="row">
              <div class="userInfo inner" >
	              <div style="width:30%;float: left;">
	                <table >
	                  <td><img src="#" style=" width:200px; height: 100px;"></td>
	                </table>
	              </div>
	              <div style="width:70%;float: right;">
	                <table >
	                  <tr>
	                    <td  style=" border: 1px solid;  width:400px; height: 50px;">이름</td>
	                  </tr>
	                  <tr>
	                    <td  style=" border: 1px solid;  width:400px; height: 50px;">등급</td>
	                  </tr>
	                </table>
	              </div>
	              <table  style="width:800px;">
	                <tr>
	                  <td style=" border: 1px solid;  width:50%; height: 100px;">
	                    <h4>My Coupon</h4>
	                    <ul>
	                      <li>혜택보기</li>
	                      <li>할인쿠폰&nbsp;개수</li>
	                      <li>영화쿠폰&nbsp;개수</li>
	                    </ul>
	                  </td>
	                  <td style=" border: 1px solid;  width:50%; height: 100px;">
	                    <h4>My Point</h4>
	                    <ul>
	                      <li>사용가능 포인트&nbsp;개수</li>
	                    </ul>
	                  </td>
	                </tr>
	              </table>
	           </div>
            </div>
         
    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li><a href="#">예매/구매내역</a></li>
                    <li><a href="#">영화/스토어 관람권</a></li>
                    <li><a href="#">예매/구매내역</a></li>
                    <li><a href="#">예매/구매내역</a></li>
                    <li><a href="#">할인/제휴쿠폰</a></li>
                    <li><a href="#">멤버십 포인트</a></li>
                    <li><a href="#">나의 무비스토리</a></li>
                    <li><a href="#">나의 이벤트 응모내역</a></li>
                    <li><a href="#">나의 문의내역</a></li>
                    <li><a href="#">회원정보</a></li>
                 
                </ul>
            </nav>
           
            
        </header>
        <!-- Header Area End -->

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>영화할인쿠폰 보유 내역</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
               						<div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="나의 영화할인쿠폰"></textarea>
                                    </div>
                                   
                                  
                                </div>
                            </form>
                              <div class="cart-title">
                                <h2>영화할인쿠폰 사용 내역</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
               						<div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="나의 영화할인쿠폰 사용내역"></textarea>
                                    </div>
                                   
                                  
                                </div>
                            </form>
                            
                             <div class="cart-title">
                                <h2>이용 안내</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
               						<div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="나의 예매내역 확인하기"></textarea>
                                    </div>
                                   
                                  
                                </div>
                            </form>
                            
                        </div>
                    </div>
             
 
 
    <!-- ##### Main Content Wrapper End ##### -->
  
 
            


    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>