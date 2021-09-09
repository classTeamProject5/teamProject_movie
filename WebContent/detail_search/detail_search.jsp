<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<link rel="stylesheet" href="../detail_search/css/rSlider.min.css">
</head>
<div style="background: #1a2a6c; padding-top: 40px; padding-bottom: 40px; background: -webkit-linear-gradient(to left, #fdbb2d, #b21f1f, #1a2a6c); background: linear-gradient(to left, #fdbb2d, #b21f1f, #1a2a6c);">
	<script src="../detail_search/js/rSlider.min.js"></script>
	<div class="container" style="border-radius: 30px; background-color: #F22973;">
		<form method="post" action="moviefind.do">
		<div class="row" style="margin-top: 30px;">
			<div class="col-md-2 col-md-offset-6">
				<select class="form-control" name="type">
				  <option value="all" ${(param.type == "all") ? "selected" : "" }>전체</option>
				  <option value="title" ${(param.type == "title") ? "selected" : "" }>제목</option>
				  <option value="actor" ${(param.type == "actor") ? "selected" : "" }>배우</option>
				  <option value="director" ${(param.type == "director") ? "selected" : "" }>감독</option>
				</select>
			</div>
			<div class="col-md-3">
				<input type="text" class="form-control" placeholder="검색어를 입력해주세요" style="border-radius: 30px" name="title" required value="${not empty param.title ? param.title : ''}">
			</div>
		</div>
		<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
			<div class="col-md-10 col-md-offset-1" style="background-color: #50F2A7; border-radius: 40px;">
				<div class="row" style="margin-top: 30px;">
					<div class="col-md-2">
						<h4>장르</h4>
					</div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="selectAll" value="option1" checked>전체
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-2">
						<div class="row">
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="드라마" name="genre" checked>드라마
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="판타지" name="genre" checked>판타지
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="공포" name="genre" checked>공포
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="멜로/로맨스" name="genre" checked>멜로/로맨스
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-2">
						<div class="row">
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="모험" name="genre" checked>모험
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="스릴러" name="genre" checked>스릴러
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="느와르" name="genre" checked>느와르
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="다큐멘터리" name="genre" checked>다큐멘터리
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-2">
						<div class="row">
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="코미디" name="genre" checked>코미디
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="가족" name="genre" checked>가족
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="미스터리" name="genre" checked>미스터리
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="전쟁" name="genre" checked>전쟁
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-2">
						<div class="row">
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="애니메이션" name="genre" checked>애니메이션
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="범죄" name="genre" checked>범죄
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="뮤지컬" name="genre" checked>뮤지컬
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="SF" name="genre" checked>SF
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-2">
						<div class="row">
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="액션" name="genre" checked>액션
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 30px;">
					<div class="col-md-2">
						<h4>등급</h4>
					</div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="allRatebtn" value="option3" checked> 전체
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="전체 관람가" checked name="rating"> 전체 관람가
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="12세 관람가" checked name="rating"> 12세 관람가
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="15세 관람가" checked name="rating"> 15세 관람가
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="청소년 관람불가" checked name="rating"> 청소년 관람불가
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="등급없음" checked name="rating"> 등급없음
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 30px;">
					<div class="col-md-2">
						<h4>개봉년도</h4>
					</div>
					<div class="col-md-10">
						<div class="slider-container">
            				<input type="text" id="slider" class="slider" />
            				<input type="hidden" name="regdate" id="regdate" />
        				</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row text-center" style="margin-bottom: 30px;">
			<div class="col-md-4 col-md-offset-4">
				<button class="btn btn-primary btn-lg" style="margin: 0px 20px;" type="submit">검색</button>
				<button class="btn btn-info btn-lg" style="margin: 0px 20px;">초기화</button>
			</div>
		</div>
		</form>
	</div>
	
	<c:if test="${!empty list}">
	<div class="container" style="border-radius: 30px; background-color: #F22973; margin-top: 50px;">
	<div class="row" style="margin-top: 30px;">
		<c:forEach var="m" items="${list}">
		<c:set var="title" value="${m.title}" />
			  <div class="col-md-3">
			    <div class="thumbnail" style="width: 260px; height: 510px;">
			      <img src="${m.poster}" alt="..." style="width: 100%;">
			      <div class="caption text-right">
			        <c:if test="${fn:length(title) > 10 }">
			        	<h3>${fn:substring(m.title, 0, 10)}...</h3>
			        </c:if>
			        <c:if test="${fn:length(title) <= 10 }">
			        	<h3>${m.title}</h3>
			        </c:if>
			        <p><a href="#" class="btn btn-primary" role="button">예매하기</a></p>
			        <p>${m.regdate}</p>
			      </div>
			    </div>
			  </div>
			  </c:forEach>
	</div>
	</div>
	</c:if>
	<c:if test="${empty list}">
	<div class="container" style="border-radius: 30px; background-color: #F22973; margin-top: 50px">
		<div class="row" style="margin-top: 30px;">
			  <div class="col-md-6 col-md-offset-3">
			    <div class="thumbnail">
			      <div class="caption text-center">
			        <h1>검색결과가 없습니다.</h1>
			      </div>
			    </div>
			  </div>
		</div>
	</div>
	</c:if>
	
	
	<script>
	 const mySlider = new rSlider({
	        target: '#slider',
	        values: [1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020, 2025],
	        range: true,
	        tooltip: true,
	        scale: true,
	        labels: true,
	        set: [1950, 2025],
	        width: '700px',
	        onChange: function(val) {
	        	regdate.value = val;
	        }
	    });
	 const regdate = document.querySelector("#regdate");
	 
	 
	 const selectAll = document.querySelector('#selectAll');
	 const checkboxs = document.querySelectorAll('input[type="checkbox"]');

	 selectAll.addEventListener('change', function() {
	     if (this.checked) {
	         for (const checkbox of checkboxs) {
	             checkbox.checked = true;
	         }
	     } else if (!this.checked) {
	         for (const checkbox of checkboxs) {
	             checkbox.checked = false;
	         }
	     }
	 })
	 
	 for (const checkbox of checkboxs) {
    	checkbox.addEventListener('change', function() {
        if (!this.checked) {
            selectAll.checked = false;
	        }
	    })
		}
	 const rateAll = document.querySelector('#allRatebtn');
	 const rateBtns = document.querySelectorAll('input[name="rating"]');
	 rateAll.addEventListener('change', function() {
		 if (this.checked) {
	         for (const checkbox of rateBtns) {
	             checkbox.checked = true;
	         }
	     } else if (!this.checked) {
	         for (const checkbox of rateBtns) {
	             checkbox.checked = false;
	         }
	     }
	 })
	 
	 for (const checkbox of rateBtns) {
    	checkbox.addEventListener('change', function() {
        if (!this.checked) {
            rateAll.checked = false;
	        }
	    })
		}
	</script>
</div>