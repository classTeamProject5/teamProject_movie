<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.row{
  margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div>
            <form action="#" class="p-5 bg-white">
              <h2 class="mb-4 site-section-heading">1:1 문의</h2>
              
              <table class="row form-group">
                <tr class="col-md-6 mb-3 mb-md-0">
                  <th class="text-black" for="treatment" width=20%>문의 종류</th> 
                  <td width=30%><select name="treatment" id="treatment" class="form-control">
                    <option value="">예매</option>
                    <option value="">결제취소</option>
                    <option value="">멤버십</option>
                    <option value="">회원정보</option>
                  </select>
                  </td>
                </tr>
              

                <tr class="col-md-12 table">
                  <th class="text-black" for="date" width=30%>제목</th> 
                  <td width=70%><input type="text" id="date" class="form-control datepicker px-2"></td>
                </tr>
                <tr class="col-md-12">
                  <th class="text-black" for="date" width=30%>내용</th><br>
                  <td width=70%><textarea rows="15" cols="130"></textarea></td>
                </tr>    
                <tr class="col-md-12">
                  <th class="text-black" for="fname" width=30%>이름</th>
                  <td width=70%><input type="text" id="fname" class="form-control" placeholder="이름"></td>
                </tr>
                <tr class="col-md-12">
                  <th class="text-black" for="date" width=30%>메일주소</th> 
                  <td width=70%><input type="text" id="date" class="form-control datepicker px-2" placeholder="메일주소"></td>
                </tr>
                <tr>
                  <th class="text-black" for="email" width=30%>연락처</th> 
                  <td width=70%><input type="email" id="email" class="form-control" placeholder="연락처"></td>
                </tr>
               </table>
              

              <div class="row form-group">
                <div class="col-md-12">
                  <textarea name="note" id="note" cols="30" rows="5" class="form-control" placeholder="Write your notes or questions here..."></textarea>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Send" class="btn btn-primary py-2 px-4 text-white">
                </div>
              </div>
            </form>
      </div>
    </div>
  </div>
</body>
</html>