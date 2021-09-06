<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="search-container" style="text-align: right; ">
	    <form action="#">
	      <textarea name="search" placeholder="검색어를 입력해 주세요"></textarea>
	      <button type="submit" class="glyphicon glyphicon-search"></button>
	    </form>
	  </div>
	<nav class="navbar navbar-defualt" style="width: 1200px;">
	    <div class="container-fluid">
			  <ul class="nav navbar-nav" style="width: 1000px; margin-left: 350px;">
			  <li style="width: 16%; text-align: center; background-color: #dce4f0; border-radius: 5px;"><a href="#" style="color: #212121">전체</a></li>
			  <li style="width: 16%; text-align: center; background-color: #dce4f0; border-radius: 5px; margin-left: 3px;"><a href="#" style="color: #212121">시스템 점검</a></li>
			  <li style="width: 16%; text-align: center; background-color: #dce4f0; border-radius: 5px; margin-left: 3px;"><a href="#" style="color: #212121">극장</a></li>
			  <li style="width: 16%; text-align: center; background-color: #dce4f0; border-radius: 5px; margin-left: 3px;"><a href="#" style="color: #212121">기타</a></li>
	      </ul>
		</div>
    </nav>
    <table class="table">
      <tr style="background-color: #d3d3d3">
        <th width=10% class="text-center">번호</th>
        <th width=10% class="text-center">구분</th>
        <th width=50% class="text-center">제목</th>
        <th width=15% class="text-center">등록일</th>
        <th width=5% class="text-center">조회수</th>
      </tr>
    </table>
    <table class="table">
      <tr>
        <td class="text-center">
          <a href="#" class="btn btn-sm btn-danger">이전</a>
            1 page / 2 pages
          <a href="#" class="btn btn-sm btn-info">다음</a>
        </td>
      </tr>
    </table>
    </div>
  </div>
</body>
</html>