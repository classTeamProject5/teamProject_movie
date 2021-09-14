<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../mypage/css/main_mypage.css">
<link rel="stylesheet" href="../mypage/css/core-style.css">
<link rel="stylesheet" href="../mypage/imgs/vip_info_purple2.png">

</head>
<body class="main_mypage">
	<div class="mypage_all">
		<div class="mypage_info">
			<div class="myimg">svip</div>
			<div class="mypage_infobox">
				<!-- id,grade,0 자리에 테이블 데이터가 들어갈 것임. -->
				<div class="mypage_user">
					<div class="mypage_id">name님</div>
					<div class="mypage_text">id</div>
					<div class="mypage_grade"></div>
					<div class="mypage_text"></div>
				</div>	
				<div class="mypage_point">
					<div class="point_number">0</div>
					<div class="mypage_text">P</div>
				</div>
			</div>
			<div class="mypage_coupon">
				<div class="mypage_linkcoupon">
					<a href="#">고객센터를 통해 궁금증을 해결하세요.</a>
				</div>
				<div class="mypage_event">
					<div class="mypage_event_text">사용 가능한 나의 쿠폰 </div>
					<div class="mypage_event_number">15</div>
					<div class="mypage_event_text">장</div>
				</div>
				<div class="mypage_often_theater">
					<a href="#">My홍대극장</a>
				</div>
			</div>
		</div>
		</div>
<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
             <!-- 옆에 메뉴 바 -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>
		
        <!-- Header Area Start -->
        <div class="header-area clearfix">
            <!-- Close Icon -->
           
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
           
        	</div>
        </div>
        <!-- Header Area End -->
      
        
        
        

        <div class="cart-table-area section-padding-50">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">
						<table>
							<thead>
                            <div class="cart-title">
                                <h2>나의 예매내역</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
                                 <div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="나의 영화할인쿠폰"></textarea>
                                    </div>
                                   
                                  
                                </div>
                            </form>
                              <div class="cart-title">
                                <h2>나의 Q&A</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
                                 <div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="나의 영화할인쿠폰 사용내역"></textarea>
                                    </div>
                                   
                                  
                                </div>
                            </form>
                            
                             <div class="cart-title">
                                <h2>MY 구매정보</h2>
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
             </div>
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