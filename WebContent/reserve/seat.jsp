
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <script src="https://code.jquery.com/jquery.js"></script> 
   <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script> 
<!--  <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">    -->
	
<style type="text/css">
	.select-container {
    margin-top: 140px;
}

.select-wrapper {
    width: 900px;
    background-color: #f9fafb;
    margin: 0 auto;
    border-left: 1px solid #dddddd;
    border-right: 1px solid #dddddd;
}

.select-title {
    background-color: #4f3397;
    color: #dddddd;
    font-size: 16px;
    text-align: center;
    padding: 10px;
}

.select-seat-container {
    display: flex;
    /* align-items: center; */
    border-bottom: 2px solid #dddddd;
}

.select-seat-number-container {
    flex-grow: 1;
    border-right: 1px solid #dddddd;
    display: flex;
}

.select-seat-number-wrapper {
    padding: 15px 0 20px 20px;
    flex-grow: 1;
}

.select-seat-ul {
    display: flex;
}

.select-seat-ul>li {
    width: 20px;
    height: 20px;
    border: 1px solid #dddddd;
    text-align: center;
    font-weight: bold;
    /* line-height: 15px; */
    /* padding: 5px; */
    padding: 2px;
}

.select-seat-ul>li:hover {
    color: white;
    background-color: #222222;
    cursor: pointer;
}

.select-seat-ul-active {
    color: white;
    background-color: #222222;
}

.select-seat-ul>li:not(:first-child) {
    margin-left: 5px;
}

.select-seat-information {
    flex-grow: 1;
    padding: 15px 0 20px 20px;
}

.select-seat {
    display: flex;
    font-size: 12px;
}

.select-seat:not(:first-child) {
    margin-top: 12px;
}

.select-seat-age {
    width: 40px;
}

.select-seat-number {
    margin-left: 15px;
}

.reserve-number-wrapper {
    flex-grow: 1;
    padding-top: 15px;
    border-left: 1px solid #DDDDDD;
    text-align: center;
}

.reserve-number {
    margin-top: 20px;
    font-size: 34px;
    font-weight: bold;
}

.selected-movie {
	font-size: 20px;
    margin-bottom: 5px;
    font-weight: bold;
}

.select-seat-information-wrapper {
    display: flex;
}

.select-theater-place {
    font-size: 12px;
}

.select-theater-place:not(:last-child) {
    width: 55px;
    border-right: 1px solid #dddddd;
}

.select-theater-place:last-child {
    width: 150px;
    /* border-right: 1px solid #dddddd; */
}

.select-theater-place:not(:first-child) {
    margin-left: 12px;
}

.select-theater-date {
    /*  font-size: 18px;
    margin-top: 8px;
    font-weight: bold; */
    display: flex;
}

.select-theater-date>div {
    font-size: 18px;
    margin-top: 8px;
    font-weight: bold;
}

.theater-time {
    margin-left: 5px;
}

.remain-seats {
    margin-left: 3px;
    color: rgba(255, 0, 0, 0.6);
    font-weight: bold;
}

.selected-seats-wrapper {
    margin-top: 5px;
}

.selected-seats {
    font-size: 13px;
    word-spacing: 2px;
    margin-left: 20px;
}

.selected-seats-title {
    color: black;
    font-size: 13px;
    font-weight: bold;
}

.ticket-price-wrapper{
	margin-top: 5px;
	display: flex;
	align-items: center;
}
.ticket-price-wrapper>div{	
	font-weight: bold;
}
.ticket-price-title{
	font-size: 13px;
}

.ticket-price {
	margin-left: 47px;
	font-size:20px;
}

.reserve-button {
    margin-top: 5px;
    display: flex;
    align-items: center;
    font-weight: bold;
    font-size: 13px;
    padding: 0;
}

.reserve-button img {
    margin-left: 20px;
    width: 60px;
}

.seat-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.screen-view {
    width: 140px;
    color: #777777;
    padding-top: 30px;
    font-size: 30px;
    text-align: center;
    margin: 0 auto 30px auto;
    border-bottom: 1px solid #666666;
    letter-spacing: 4px;
}

.seat-wrapper {
    background-color: #f3f4f6;
    width: 700px;
    height: 460px;
    /* padding-top: 120px; */
}

.seat {
    width: 30px;
    height: 30px;
}

.seat {
    font-size: 13px;
    background-color: #767479;
    color: white;
    border: 1px solid #FFFFFF;
}

.seat:hover {
    background-color: #4f3397;
    color: white;
    cursor: pointer;
}

.seat:active {
    background-color: #4f3397;
    color: white;
}

.clicked {
    background-color: #4f3397;
    color: white;
}

.seatButtonWrapper {
    text-align: center;
}

.seatButtonWrapper>input {
    width: 30px;
    height: 30px;
}

.left-margin {
    margin-left: 30px;
}

.right-margin {
    margin-right: 30px;
}

.top-margin {
    margin-top: 30px;
} 
	</style>
	
<script type="text/javascript">
$(function(){

	$('.select-number-normal').click(function(){
		let inwon=$(this).text();
		$('.reserve-number').text(inwon+"명");
		$('#finwon').val(inwon);
	
	})
})
</script>	
</head>
<body>
<div class="select-container">
		<div class="select-wrapper">
			<div class="select-title">인원/좌석</div>
			<div class="select-seat-container">
				<div class="select-seat-number-container">
				
																   <%-- <div>
																	   <c:forEach var="i" begin="1" end="7">
												        					 <span class="inwons btn btn-sm btn-success">${i }</span>
												       				   </c:forEach>
																	</div> --%>
					 <div class="select-seat-number-wrapper">
						<div class="select-seat">
							<div class="select-seat-age">일반</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul select-seat-ul-normal" style="list-style: none;">
									<li class="select-number-normal ">0</li>
									<li class="select-number-normal">1</li>
									<li class="select-number-normal">2</li>
									<li class="select-number-normal">3</li>
									<li class="select-number-normal">4</li>
									<li class="select-number-normal">5</li>
									 <li class="select-number-normal">6</li>
                                    <li class="select-number-normal">7</li>
                                    <li class="select-number-normal">8</li>
								</ul>
							</div>
						</div>
						<!-- <div class="select-seat">
							<div class="select-seat-age">청소년</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul select-seat-ul-teen" style="list-style: none;">
									<li class="select-number-teen">0</li>
									<li class="select-number-teen">1</li>
									<li class="select-number-teen">2</li>
									<li class="select-number-teen">3</li>
									<li class="select-number-teen">4</li>
									<li class="select-number-teen">5</li>
									<li class="select-number-teen">6</li>
                                    <li class="select-number-teen">7</li>
                                    <li class="select-number-teen">8</li>
								</ul>
							</div>
						</div>
						<div class="select-seat">
							<div class="select-seat-age">우대</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul  select-seat-ul-old " style="list-style: none;">
									<li class="select-number-old">0</li>
									<li class="select-number-old">1</li>
									<li class="select-number-old">2</li>
									<li class="select-number-old">3</li>
									<li class="select-number-old">4</li>
									<li class="select-number-old">5</li>
									<li class="select-number-old">6</li>
                                    <li class="select-number-old">7</li>
                                    <li class="select-number-old">8</li>
								</ul>
							</div>
						</div> -->

					</div> 
					<div class="reserve-number-wrapper">
						<div class="reserve-number-title">선택된 인원 수</div>
						<div class="reserve-number">0</div>
					</div>
				</div>
					<div class="select-seat-information">
					<div class="selected-movie">${svo.title}</div>
					<div class="select-seat-information-wrapper">
					
						<div class="select-theater-place selected-theater-place-info">${svo.theater }</div>
						<div class="select-theater-place">
							<span>남은좌석</span><span class="remain-seats">${svo.remainseat }</span>/
							<span class="all-seats">${svo.totalseat }</span>
						</div>						
					</div>
					<div class="select-theater-date">
						<div class="theater-date">${svo.regdate }</div>
						<div class="theater-time">${svo.starttime }</div>
					</div>
					<div class="selected-seats-wrapper">
						<span class="selected-seats-title" >좌석번호</span> 				
						 <span>선택한 좌석이 없습니다.</span>
					</div>
					
					<div class="ticket-price-wrapper">
						<div class="ticket-price-title">가격</div>
						<div class="ticket-price">0원</div>
					</div>
					
				
					<form action="../reserve/reserve_ok.do" name=frm class="seatForm" method="post">
						<input type="hidden" class="title" name="title"> 
						<input type="hidden" class="selectedTheater" name="selectedTheater" value="${svo.theater }">
						<input type="hidden" class="reserveDate" name="movieDate" value="${svo.regdate }">
						<input type="hidden" class="runningTime" name="runningTime" value="${svo.starttime }~${svo.endtime}">
						<input type="hidden" class="movieAge" name="movieAge" value="${svo.grade }">
						<!-- 티켓의수(선택한 좌석) -->
					<!-- 	<input type="hidden" class="ticketNumber" name="ticketNumber"> -->
						<input type="hidden" class="select-number-normal" name="finwon" id="finwon" value="">
						
						<!-- 결제 정보 -->
						<input type="hidden" class="payMoney" name="payMoney">
						<button type="submit" class="reserve-button">
							결제하기
						</button>
					</form>
				</div>

			</div>
			<div class="seat-container">

				<div class="seat-wrapper">
					<div class="screen-view-wrapper">
						<div class="screen-view">SCREEN</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="../reserve/js/seat.js"></script>

</html>
			