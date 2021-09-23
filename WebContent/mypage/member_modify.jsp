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
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
});
$(function(){
	$('#idBtn').click(function(){
		 Shadowbox.open({
			content:'../member/idcheck.jsp',
			player:'iframe',
			title:'아이디 중복체크',
			width:340,
			height:200
		}); 
	});
	// id,class(javascript/css) ,name(java에 값을 보낸다) 
	$('#postBtn').click(function(){
		 Shadowbox.open({
			content:'../member/postfind.jsp',
			player:'iframe',
			title:'우편번호 찾기',
			width:530,
			height:350
		}); 
	});
	$('#sendBtn').click(function(){
		// NOT NULL => 강제 입력 (오라클에서 오류 방지 => 유효성 검사)
		//alert("click");
		/* let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		} */
		
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		// 이름 
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		// 생년월일
		let birth=$('#birthday').val();
		if(birth.trim()=="")
		{
			$('#birthday').focus();
			return;
		}
		// 이메일
		let email=$('#email').val();
		if(email.trim()=="")
		{
			$('#email').focus();
			return;
		}
		// 주소 
		/* let addr1=$('#addr1').val();
		if(addr1.trim()=="")
		{
			$('#addr1').focus();
			return;
		} */
		
		// 전화번호
		let tel2=$('#tel2').val();
		if(tel2.trim()=="")
		{
			$('#tel2').focus();
			return;
		}
		
		// 정상수행 
		$('#joinFrm').submit();
	})
})
</script>
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
                  <li><a href="../mypage/mypage_main.do" style="width:120px;">예매/구매내역</a></li>
                    <li><a href="../mypage/movieticket.do" style="width:120px;">영화 관람권</a></li>
                    <li><a href="../mypage/discount.do" style="width:170px;">할인/제휴쿠폰</a></li>
                    <li><a href="../mypage/membershippoint.do" style="width:140px;">포인트 이용내역</a></li>
                    <li><a href="../mypage/membershipcard.do" style="width:140px;">멤버쉽 카드관리</a></li>
                    <li><a href="../mypage/moivestory.do" style="width:140px;">나의 무비스토리</a></li>
                    <li><a href="../mypage/event_aply.do" style="width:190px;">나의 이벤트 응모내역</a></li>
                    <li><a href="../mypage/myask.do" style="width:130px;">나의 문의내역</a></li>
                    <li><a href="../mypage/card.do" style="width:170px;">자주쓰는 카드 관리</a></li>
                    <li><a href="../mypage/member_moidfy.do" style="width:130px;">개인정보 수정</a></li>
                </ul>
            </nav>
           </div>
        </div>
     
        <!-- 옆에 카테고리 끝 -->
   <div  style="width:700px; margin-top: 100px; margin-left: 100px;">
                    <div>
                        <div style="">
                            <div class="cart-title">
                                <h2>회원 수정</h2>
                            </div>   
                             <form action="#" method="post">     
      
<div class="wrapper row3">
  <main class="container clear">

    <form method="post" action="../member/join_update_ok.do" id="joinFrm" name="joinFrm">
     <table class="table">
       <tr>
         <th class="text-right" width=15%>ID</th>
         <td width=85% class="inline">
           <input type=text name=id size=20 value="${vo.id }" class="input-sm" readonly id=id>
          
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>비밀번호</th>
         <td width=85% class="inline">
           <input type=password name=pwd size=20 class="input-sm" id=pwd>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,10자~16자)
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>이름</th>
         <td width=85% class="inline">
           <input type=text name=name size=20 class="input-sm" id=name value="${vo.name }">
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>성별</th>
         <td width=85% class="inline">
           <input type="radio" value="남자" name=sex ${vo.sex=='남자'?"checked":"" }>남자
           <input type="radio" value="여자" name=sex ${vo.sex=='여자'?"checked":"" }>여자
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>생년월일</th>
         <td width=85%>
           <input type="date" size=30 name=birthday id=birthday value="${vo.birthday }">
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>이메일</th>
         <td width=85%>
           <input type=text name=email size=55 class="input-sm" id=email value="${vo.email }">
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>우편번호</th>
         <td width=85% class="inline">
           <input type=text name=post1 size=7 class="input-sm" readonly id="post1" value=${post1 }>-<input type=text value="${post2 }" id=post2 name=post2 size=7 class="input-sm" readonly>
           <input type=button value="우편번호검색" class="btn btn-sm btn-primary" id=postBtn>
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>주소</th>
         <td width=85%>
           <input type=text name=addr1 size=55 class="input-sm" id=addr1 readonly value="${vo.addr1 }">
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>상세주소</th>
         <td width=85%>
           <input type=text name=addr2 size=55 class="input-sm" value="${vo.addr2 }">
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>전화번호</th>
         <td width=85% class="inline">
           <select name=tel1 class="input-sm">
            <option>010</option>
            <option>011</option>
           </select>
           <input type=text name=tel2 size=20 class="input-sm" id=tel2 value="${tel2 }">
         </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center inline">
           <input type=button value="회원수정" class="btn btn-sm btn-info" id=sendBtn>
           <input type=button value="취소" class="btn btn-sm btn-success" 
             onclick="javascript:history.back()"
           >
         </td>
       </tr>
       <tr>
         <th class="text-right" width=15%>선호하는 장르</th>
         <td width=85% class="inline">
           <select name=genre class="input-sm">
            <option>코미디</option>
            <option>로맨스/멜로</option>
            <option>스릴러/공포</option>
            <option>SF/미스터리</option>
           </select>
         </td>
       </tr>
       
     </table>
      
     </form>
      </div>
  
    </div>
    </form>
    
  </main>
 </div>

</body>
</html>

        
 
   
           