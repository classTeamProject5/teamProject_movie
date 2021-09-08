<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no">
    <meta name="author" content="webstoryboy">
    <meta name="description" content="메가박스 사이트 따라하면서 배우는 튜토리얼입니다.">
    <meta name="keywords" content="메가박스, 유투브, 영화, 최신영화, 영화관, CGV, 롯데시네마, 웹스토리보이, 웹스, 사이트 만들기, 따라하기, 이미지 슬라이드">
    <title>홍대극장</title>

    <!-- css -->
    <link rel="stylesheet" href="../main/assets/css/reset19.css">
    <link rel="stylesheet" href="../main/assets/css/style19.css">
    <link rel="stylesheet" href="../main/assets/css/swiper.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="../main/assets/css/theme.css" rel="stylesheet" />

    
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
    
    <!-- HTLM5shiv ie6~8 -->
    <!--[if lt IE 9]> 
      <script src="assets/js/html5shiv.min.js"></script>
      <script type="text/javascript">
         alert("현재 브라우저는 지원하지 않습니다. 크롬 브라우저를 추천합니다.!");
      </script>
   <![endif]-->
</head>
<body>
    
    <jsp:include page="header.jsp"/>
    <jsp:include page="${main_jsp }" />
    <%-- <jsp:include page="../detail_search/detail_search.jsp" /> --%>
    <%-- <jsp:include page="../customerCenter/customer_main.jsp"/> --%>
    <jsp:include page="footer.jsp"/>
    

    
    <!-- 자바스크립트 라이브러리 -->
    <script src="../main/assets/js/jquery.min_1.12.4.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <script src="../main/assets/js/modernizr-custom.js"></script>
    <script src="../main/assets/js/ie-checker.js"></script>
    <script src="../main/assets/js/swiper.min.js"></script>
    <script src="../main/assets/js/iframe_api.js"></script>
    <script src="../main/assets/js/movie.js"></script>
    <script src="../main/assets/js/bootstrap.min.js"></script>
    

</body>
</html>    