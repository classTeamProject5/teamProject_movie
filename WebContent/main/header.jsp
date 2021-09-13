<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="header">
        <div class="container">
            <div class="row">
                <div class="header">
                    <div class="header-topnav">
                      <div class="header-topnav-side">
	                      <!-- Left-aligned links (default) -->
						  <a href="#news">멤버십</a>
						  <a href="../customerCenter/main.do">고객센터</a>
						
						  <!-- Right-aligned links -->
						  <div class="header-topnav-right">
						    <a href="../login/login.do">로그인</a>
						    <a href="../member/join.do">회원가입</a>
						    <a href="#about">빠른예매</a>
						  </div>
					  </div>
					  
					  <!-- Centered link -->
					  <div class="header-topnav-centered">
						  <h1>
	                        <a href="../main/main.do">
	                            <em><img src="../main/assets/img/megaStyle_title.png" alt="MEGABOX"></em>
	                            <!-- <strong><img src="assets/img/logo-sub.png" alt="LIFE THEATER"></strong>  -->
	                        </a>    
	                      </h1>
					  </div>
					  <div class="wrap">
					     <a href="#" class="searchButton">
					        <span title="검색"class="glyphicon glyphicon-search"></span>
					     </a>
					     <div class="wrap_my">
						     <a href="#" class="searchButton">
						        <span title="마이페이지"><img src="../main/mega_image/personicon.jpg" class="my_icon"></span>
						     </a>
					     </div>
					  </div>
					</div>
                    <nav class="navbar navbar-defualt">
                      <div class="container-fluid">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                              <a class="dropdown-toggle" href="#">영화</a>
                                <ul class="dropdown-menu">
						          <li><a href="#">무비차트</a></li>
						          <li><a href="../main/moviefind.do">무비파인더</a></li>
						        </ul>
                            </li>
                            <li class="dropdown">
                              <a class="dropdown-toggle" href="#">예매</a>
                                <ul class="dropdown-menu">
						          <li><a href="../reserve/q_reserve.do">빠른 예매</a></li>
						          <li><a href="../reserve/movie_time.do">상영시간표</a></li>
						        </ul> 
                            </li>
                            <li class="dropdown">
                              <a class="dropdown-toggle" href="#">이벤트</a>
                                <ul class="dropdown-menu">
						          <li><a href="../event/event_category_all.do">진행중인 이벤트</a></li>
						          <li><a href="../event/event_board_list.do">당첨자 발표</a></li>
						          <li><a href="../event/event_last_event.do">지난 이벤트</a></li>
						        </ul>
                            </li>
                            <li class="dropdown">
                              <a class="dropdown-toggle" href="#">혜택</a>
                                <ul class="dropdown-menu">
						          <li><a href="../viplounge/viplounge_main.do">멤버십</a></li>
						        </ul>
                            </li>
                        </ul>
                       </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- //header -->
     
</body>
</html>