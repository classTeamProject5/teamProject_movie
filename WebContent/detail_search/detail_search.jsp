<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<link rel="stylesheet" href="../detail_search/css/rSlider.min.css">
	<style>
		#maincontainer * {
			box-sizing: border-box;
		}
	</style>
</head>
<div style="padding-top: 40px; padding-bottom: 40px;" id="maincontainer">
	<script src="../detail_search/js/rSlider.min.js"></script>
	<div class="container" style="border-radius: 30px; border: black solid 2px;">
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
				<input id="search-word" type="text" class="form-control" placeholder="검색어를 입력해주세요" style="border-radius: 30px" name="title" required value="${not empty param.title ? param.title : ''}">
			</div>
		</div>
		<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
			<div class="col-md-10 col-md-offset-1" style="border-radius: 40px;">
				<div class="row" style="margin-top: 30px;">
					<div class="col-md-2">
						<h4>장르</h4>
					</div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreAll" value="option1" checked>전체
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
		  							<input type="checkbox" id="genreCheckBox" value="드라마" name="genre" checked>드라마
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="판타지" name="genre" checked>판타지
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="공포" name="genre" checked>공포
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="멜로/로맨스" name="genre" checked>멜로/로맨스
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
		  							<input type="checkbox" id="genreCheckBox" value="모험" name="genre" checked>모험
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="스릴러" name="genre" checked>스릴러
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="느와르" name="genre" checked>느와르
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="다큐멘터리" name="genre" checked>다큐멘터리
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
		  							<input type="checkbox" id="genreCheckBox" value="코미디" name="genre" checked>코미디
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="가족" name="genre" checked>가족
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="미스터리" name="genre" checked>미스터리
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="전쟁" name="genre" checked>전쟁
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
		  							<input type="checkbox" id="genreCheckBox" value="애니메이션" name="genre" checked>애니메이션
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="범죄" name="genre" checked>범죄
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="뮤지컬" name="genre" checked>뮤지컬
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="genreCheckBox" value="SF" name="genre" checked>SF
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
		  							<input type="checkbox" id="genreCheckBox" value="액션" name="genre" checked>액션
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
				<button class="btn btn-info btn-lg" style="margin: 0px 20px;" id="initButton" type="button">초기화</button>
			</div>
		</div>
		</form>
	</div>
	
	<c:if test="${method == 'post'}">
		<c:if test="${!empty list}">
		<div class="container" style="border-radius: 30px; margin-top: 50px;">
		<div class="row" style="margin-top: 30px;">
			<c:forEach var="m" items="${list}">
			<c:set var="title" value="${m.title}" />
				  <div class="col-md-3">
				    <div class="thumbnail" style="width: 260px; height: 510px; border-radius: 30px; padding: 0px;">
				      <img src="${m.poster}" alt="..." style="width: 100%;">
				      <div class="caption text-right">
				        <c:if test="${fn:length(title) > 15 }">
				        	<h4 class="text-center">${fn:substring(m.title, 0, 15)}...</h4>
				        </c:if>
				        <c:if test="${fn:length(title) <= 15 }">
				        	<h4 class="text-center">${m.title}</h4>
				        </c:if>
				        <p><a href="../movie_detail/movie_detailpage.do?mno=${m.mno}" class="btn btn-primary" role="button">상세보기</a></p>
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
	</c:if>
	<c:if test="${wrong == 'wrong'}">
		<div class="container" style="border-radius: 30px; background-color: #F22973; margin-top: 50px">
			<div class="row" style="margin-top: 30px;">
				  <div class="col-md-6 col-md-offset-3">
				    <div class="thumbnail">
				      <div class="caption text-center">
				        <h1>장르와 등급을 선택해야합니다.</h1>
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
	 
	 const genreAll = document.querySelector('#genreAll');
	 const genreCheckboxs = document.querySelectorAll('#genreCheckBox');

	 genreAll.addEventListener('change', function() {
	     if (this.checked) {
	         for (const checkbox of genreCheckboxs) {
	             checkbox.checked = true;
	         }
	     } else if (!this.checked) {
	         for (const checkbox of genreCheckboxs) {
	             checkbox.checked = false;
	         }
	     }
	 })
	 
	 
	 for (const checkbox of genreCheckboxs) {
    	checkbox.addEventListener('change', function() {
        if (!this.checked) {
            genreAll.checked = false;
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
	 const searchInput = document.querySelector('#search-word');
	 const initButton = document.querySelector('#initButton');
		
	
	 initButton.addEventListener("click", function (e) {
	   e.preventDefault;
	   searchInput.value = "";
	   genreAll.checked = false;
	   rateAll.checked = false;
	   for (const rateBtn of rateBtns) {
	     rateBtn.checked = false;
	   }
	   for (const genreCheckbox of genreCheckboxs) {
	     genreCheckbox.checked = false;
	   }
	 });
	</script>
</div>