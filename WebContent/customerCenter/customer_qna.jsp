<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="customer-container"  style="margin-bottom: 10px;">
    <div class="customer-row">
      <div>
              <h2>1:1 문의</h2>
              <form method="post" action="../qna_ok.do">
              <table class="table" style="width:1000px;">
			    <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">분류</th>
			      <td width=80% class="text-center" >
			        <select style="float: left;" name=type>
			          <option>예매</option>
			          <option>결제/취소</option>
			          <option>멤버십</option>
			          <option>회원정보</option>
			          <option>기타</option>
			        </select>
			      </td>
			    </tr>
			    
			    <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">이름</th>
			      <td width=80%><input type="text" name=name></td>
			    </tr>
			    <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">연락처</th>
			      <td width=25%><input type="text" name=tel></td>
			    </tr>
			    <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">이메일</th>
			      <td width=80%><input type="text" name=email></td>
			    </tr>
			    <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">제목</th>
			      <td width=80%><input type="text" name=title maxlength="50" size="50" ></td>
			    </tr>
			    <!-- <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">첨부파일</th>
			      <td>첨부</td>
			    </tr> -->
			    <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">답변수신여부</th>
			      <td width=80%>
			        <input type="radio" name="alert" value="수신">수신
			        <input type="radio" name="alert" value="비수신">비수신
			      </td>
			    </tr>
			  </table>
			  <div>
			    <textarea name="content" id="note" cols="120" rows="10"></textarea>
			  </div>
              <div class="text-center">
                <input type="submit" value="등록" class="btn btn-primary">
              </div>
              </form>
      </div>
    </div>
  </div >
</body>
</html>