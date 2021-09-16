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
              <h2>공지 사항 입력</h2>
              <form method="post" action="../notice_insert_ok.do">
              <table class="table" style="width:1000px;">
			    <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">구분</th>
			      <td width=80% class="text-center" >
			        <select style="float: left;" name=type>
			          <option>시스템 점검</option>
			          <option>극장</option>
			          <option>기타</option>
			        </select>
			      </td>
			    </tr>
			    <tr>
			      <th width=20% class="text-center"  style="background-color: #d3d3d3">제목</th>
			      <td width=25%><input type="text" name=title></td>
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