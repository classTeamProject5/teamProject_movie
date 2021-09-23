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
<link rel="stylesheet" href="../mypage/imgs/mypage_main.png">

</head>
<body class="main_mypage">
	<div class="mypage_all">
			<div class="mypage_info">
				<div class="myimg"></div>
					<div class="mypage_infobox">
						<div class="mypage_user">
							<div class="mypage_id">${vo.name }</div>
							<div class="mypage_text">님 어서오세요! ${vo.id }</div>
							<div class="mypage_grade">${vo.usergrade}</div>
							<div class="mypage_text">입니다.</div>
					</div>	
			</div>
			<div class="mypage_coupon">
				<div class="mypage_linkcoupon">
					<a href="#">총 보유 포인트</a>
					<a href="#">500point</a>
				</div>
				<div class="mypage_event">
					<div class="mypage_event_text">관람권/쿠폰 </div>
					<div class="mypage_event_number">10</div>
					<div class="mypage_event_text">장</div>
				</div>
				<div class="mypage_often_theater">
					<a href="#">선호하는 영화 장르 보러가기</a>
				</div>
			</div>
		</div>
		</div>
<!-- ##### Main Content Wrapper Start ##### -->
  <div style="margin-top: 100px; margin: 0px auto; width:1200px;
  --bs-gutter-x: 2rem;
  --bs-gutter-y: 0;
  display: -webkit-box;
  flex-wrap: wrap;">
    <div class="main-content-wrapper">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
             <!-- 옆에 메뉴 바  선택하면 노랑색 나옴 -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>
		
        <!-- Header Area Start -->
        <div class="header-area clearfix">
            <!-- Close Icon -->
           
            <!-- 옆에 카테고리들 -->
            <nav class="amado-nav">
                <ul>
                     <li><a href="../mypage/mypage_main.jsp" style="width:120px;">예매/구매내역</a></li>
                    <li><a href="../mypage/movieticket.jsp" style="width:120px;">영화 관람권</a></li>
                    <li><a href="../mypage/discount.jsp" style="width:170px;">할인/제휴쿠폰</a></li>
                    <li><a href="../mypage/membershippoint.jsp" style="width:140px;">포인트 이용내역</a></li>
                    <li><a href="../mypage/membershipcard.jsp" style="width:140px;">멤버쉽 카드관리</a></li>
                    <li><a href="../mypage/moivestory.jsp" style="width:140px;">나의 무비스토리</a></li>
                    <li><a href="../mypage/event_aply.jsp" style="width:190px;">나의 이벤트 응모내역</a></li>
                    <li><a href="../mypage/myask.jsp" style="width:130px;">나의 문의내역</a></li>
                    <li><a href="../mypage/card.jsp" style="width:170px;">자주쓰는 카드 관리</a></li>
                    <li><a href="../mypage/member_moidfy.jsp" style="width:130px;">개인정보 수정</a></li>
                </ul>
            </nav>
           
        </div>
     </div>
        <!-- 옆에 카테고리 끝 -->

        
         <div  style="width:700px; margin-top: 100px; margin-left: 100px;">
                    <div>
                        <div style="">
                            <div class="cart-title">
                                <h2>1:1 문의내역</h2>
                            </div>
                            <form action="#" method="post">
                                <div class="row">
                                 <div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="나의 영화할인쿠폰"></textarea>
                                    </div>                                                         
                                </div>
                            </form>
                              <div class="cart-title">
                                <h2>단체관람 문의내역</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
                                 <div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="나의 영화할인쿠폰 사용내역"></textarea>
                                    </div>
                                </div>
                            </form>                           
                             <div class="cart-title">
                                <h2>분실물 문의내역</h2>
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

 
 
    <!-- ##### Main Content Wrapper End ##### -->
  
 
            


    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
    <script src="js/popper.min.js"></script>
    
    <script src="js/bootstrap.min.js"></script>
    
    <script src="js/plugins.js"></script>
   
    <script src="js/active.js"></script>
	
</body>

</html>