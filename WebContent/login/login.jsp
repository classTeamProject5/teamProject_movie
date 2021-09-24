<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>홍대 극장 로그인</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <!-- <link rel="stylesheet" href="../login/css/bootstrap.min.css" type="text/css"> -->
    <link rel="stylesheet" href="../login/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../login/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../login/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="../login/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../login/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../login/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../login/css/style.css?after" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   
 
     <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>로그인</h3>
                        <form method="post" action="login_ok.do" >
                            <div class="input__item">
                                <input type="text" name="id" placeholder="아이디">
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" name="pwd" placeholder="비밀번호">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn">로그인</button>
                         </form>
                        <a href="../login/idfind.do" class="forget_pass">아이디를 잊어버리셨나요?</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>계정이 없으신가요?</h3>
                        <a href="../member/join.do" class="primary-btn">회원가입하러 가기</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> 페이스북으로 로그인하기 </a></li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> 구글로 로그인 하기</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> 트위터로 로그인 하기</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->



    <!-- Js Plugins -->
    <script src="../login/js/jquery-3.3.1.min.js"></script>
    <script src="../login/js/bootstrap.min.js"></script>
    <script src="../login/js/player.js"></script>
    <script src="../login/js/jquery.nice-select.min.js"></script>
    <script src="../login/js/mixitup.min.js"></script>
    <script src="../login/js/jquery.slicknav.js"></script>
    <script src="../login/js/owl.carousel.min.js"></script>
    <script src="../login/js/main.js"></script>


</body>

</html>