<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="../detail_search/css/rSlider.min.css">
</head>
<div style="background: #1a2a6c; background: -webkit-linear-gradient(to left, #fdbb2d, #b21f1f, #1a2a6c); background: linear-gradient(to left, #fdbb2d, #b21f1f, #1a2a6c);">
	<script src="../detail_search/js/rSlider.min.js"></script>
	<div class="container" style="border-radius: 30px; background-color: #F22973;">
		<div class="row">
			<div class="col-md-2 col-md-offset-6">
				<select class="form-control">
				  <option>전체</option>
				  <option>제목</option>
				  <option>배우</option>
				  <option>감독</option>
				</select>
			</div>
			<div class="col-md-3">
				<input type="text" class="form-control" placeholder="검색어를 입력해주세요" style="border-radius: 30px">
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
		  							<input type="checkbox" id="selectAll" value="option1">전체
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
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">드라마
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">판타지
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">서부
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">공포
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
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">멜로/로맨스
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">모험
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">스릴러
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">느와르
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
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">컬트
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">다큐멘터리
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">코미디
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">가족
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
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">미스터리
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">전쟁
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">애니메이션
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">범죄
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
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">뮤지컬
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">sf
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">액션
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">무협
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
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">에로
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">서스펜스
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">시사
								</label>
							</div>
							<div class="col-md-3">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">블랙코미디
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
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">실험
								</label>
							</div>
							<div class="col-md-9">
								<label class="checkbox-inline">
		  							<input type="checkbox" id="inlineCheckbox1" value="option1">공연실황
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 30px;">
					<div class="col-md-2">
						<h4>제작국가</h4>
					</div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 전체
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 미국
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 일본
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 중국
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 홍콩
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 기타
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
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 전체
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> ALL
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 12
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 15
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 19
								</label>
							</div>
							<div class="col-md-2">
								<label class="checkbox-inline">
  									<input type="checkbox" id="inlineCheckbox3" value="option3"> 기타
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
        				</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row text-center" style="margin-bottom: 30px;">
			<div class="col-md-4 col-md-offset-4">
				<button class="btn btn-primary btn-lg" style="margin: 0px 20px;">검색</button>
				<button class="btn btn-info btn-lg" style="margin: 0px 20px;">초기화</button>
			</div>
		</div>
	</div>
	<script>
	 const mySlider = new rSlider({
	        target: '#slider',
	        values: [1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020],
	        range: true,
	        tooltip: true,
	        scale: true,
	        labels: true,
	        set: [1950, 2020],
	        width: '700px',
	    });
	 
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
	
	</script>
</div>