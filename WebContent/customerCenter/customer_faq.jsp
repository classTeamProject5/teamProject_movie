<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
</head>
<body>
     <section class="py-8" id="faq" style="margin-top: 10px;">
       <div class="customer-container">
       <div class="customer-row">
        <div class="search-container" style="text-align: right; width:1000px;">
	        <form action="#">
	          <input type=text name="search" placeholder="검색어를 입력해 주세요"></input>
	          <button type="submit" class="glyphicon glyphicon-search"></button>
	        </form>
	     </div>
        
         
		  <nav class="navbar navbar-defualt" style="width: 1200px; ">
			<div class="container-fluid">
			  <ul class="navbar-nav" style="width: 950px; ">
			      <li style="width: 16%; height: 40px; text-align: center; background-color: #dce4f0; border-radius: 5px;">
			        <a href="main.do?type=전체" style="color: #212121">전체</a>
			      </li>
			      <li style="width: 16%; height: 40px; text-align: center; background-color: #dce4f0; border-radius: 5px; margin-left: 3px;">
			        <a href="main.do?type=예매" style="color: #212121">예매</a>
			      </li>
			      <li style="width: 16%; height: 40px; text-align: center; background-color: #dce4f0; border-radius: 5px; margin-left: 3px;">
			        <a href="main.do?type=결제/취소" style="color: #212121">결제/취소</a>
			      </li>
			      <li style="width: 16%; height: 40px; text-align: center; background-color: #dce4f0; border-radius: 5px; margin-left: 3px;">
			        <a href="main.do?type=회원정보" style="color: #212121">회원정보</a>
			      </li>
			      <li style="width: 16%; height: 40px; text-align: center; background-color: #dce4f0; border-radius: 5px; margin-left: 3px;">
			        <a href="main.do?type=기타" style="color: #212121">기타</a>
			      </li>
			  </ul>
		    </div>
		  </nav>
          <div class="row-cus flex-center">
            <div class="col-lg-9" style="margin-left: 75px;">
             <c:forEach var="vo" items="${list }" varStatus="s">
              <div class="accordion" id="accordionExample" style="width: 1000px;">
                <div class="accordion-item mb-2">
                  <h2 class="accordion-header" id="heading1">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${s.index }" aria-controls="collapse${s.index }" >
                    <span class="mb-0 fw-bold text-start fs-1 text-1000">${vo.question }</span>
                    </button>
                  </h2>
                  <div class="accordion-collapse collapse" id="collapse${s.index }" aria-labelledby="heading1">
                    <div class="accordion-body bg-100">${vo.answer }</div>
                  </div>
                </div>
              </div>
             </c:forEach>
            </div>
          </div>
         </div>
        </div>
        </section>
        
    </body>
    <hr>
</html>